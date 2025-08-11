<?php

namespace Modules\Taxido\Repositories\Api;

use Exception;
use Carbon\Carbon;
use App\Enums\PaymentMode;
use App\Enums\PaymentStatus;
use App\Enums\PaymentMethod;
use App\Enums\TransactionType;
use Barryvdh\DomPDF\Facade\Pdf;
use Modules\Taxido\Models\Ride;
use App\Http\Traits\PaymentTrait;
use Illuminate\Support\Facades\DB;
use Modules\Taxido\Enums\RoleEnum;
use Nwidart\Modules\Facades\Module;
use App\Exceptions\ExceptionHandler;
use Modules\Taxido\Enums\ServicesEnum;
use Modules\Taxido\Enums\WalletDetail;
use Modules\Taxido\Models\RideRequest;
use Modules\Taxido\Models\RiderWallet;
use Modules\Taxido\Models\DriverWallet;
use Modules\Taxido\Enums\RideStatusEnum;
use Modules\Taxido\Enums\ServiceCategoryEnum;
use Modules\Taxido\Http\Traits\RideTrait;
use Modules\Taxido\Models\VehicleTypeZone;
use Modules\Taxido\Http\Traits\CouponTrait;
use Modules\Taxido\Models\DriverSubscription;
use Modules\Taxido\Http\Resources\RideResource;
use Modules\Taxido\Http\Traits\CommissionTrait;
use Prettus\Repository\Eloquent\BaseRepository;
use Prettus\Repository\Criteria\RequestCriteria;
use Modules\Taxido\Http\Resources\RideDetailResource;
use Modules\Taxido\Http\Traits\RideRequestTrait;
use Modules\Taxido\Http\Resources\Drivers\RideRequestResource;

class RideRepository extends BaseRepository
{
    use RideRequestTrait, CouponTrait, PaymentTrait, CommissionTrait;

    protected $fieldSearchable = [
        'ride_number' => 'like',
    ];

    public function model()
    {
        return Ride::class;
    }

    public function boot()
    {
        try {

            $this->pushCriteria(app(RequestCriteria::class));
        } catch (Exception $e) {

            throw new ExceptionHandler($e->getMessage(), $e->getCode());
        }
    }

    public function getRideLocation($ride_id)
    {
        try {

            if (!$ride_id) {
                throw new Exception('Ride number is required', 400);
            }

            $ride = Ride::where('id', $ride_id)->first();
            $firstPoint = head($ride->location_coordinates) ?? null;
            $paymentMethods = getPaymentMethodList();
            $allPaymentMethods = collect($paymentMethods);
            $zone = getZoneByPoint($firstPoint['lat'], $firstPoint['lng'])->first();
            if ($zone) {
                $selectedSlugs = $zone?->payment_method;
                $filtered = $allPaymentMethods->filter(function ($method) use ($selectedSlugs) {
                    return in_array($method['slug'], $selectedSlugs);
                })->map(function ($method) {
                    return collect($method)->only(['name', 'slug', 'title', 'image'])->toArray();
                })->values();

                return [
                    'success' => true,
                    'data' => [
                        [
                            'ride_number' => $ride->ride_number,
                            'location_coordinates' => $ride->location_coordinates,
                            'zone' => $zone?->name,
                            'locations' => $zone?->locations,
                            'currency_code' => $zone?->currency?->code,
                            'currency_symbol' => $zone?->currency?->symbol,
                            'exchange_rate' => $zone?->currency?->exchange_rate,
                            'payment_method' => $filtered,
                        ]
                    ]
                ];
            }

            throw new Exception("Zone not found!", 400);

        } catch (Exception $e) {


            throw new ExceptionHandler($e->getMessage(), $e->getCode());
        }
    }

    public function show($id)
    {
        $ride = $this->model?->findOrFail($id);
        return new RideDetailResource($ride);
    }

    public function updateRideStatusActivities($ride, $status)
    {
        $ride_status_id = getRideStatusIdBySlug($status);
        if ($ride_status_id) {
            $ride->update(['ride_status_id' => $ride_status_id]);
            if ($status) {
                $rideStatusActivities = $ride->ride_status_activities()->latest()->first();
                $rideRequestId = $ride?->ride_status_activities?->where('status', RideStatusEnum::ACCEPTED)?->value('ride_request_id');
                if ($rideStatusActivities && $rideRequestId) {
                    if ($rideStatusActivities?->status == $status) {
                        $rideStatusActivities->update([
                            'status' => $status,
                            'changed_at' => now(),
                            'ride_request_id' => $rideRequestId,
                        ]);
                    } else {
                        $ride->ride_status_activities()?->create([
                            'status' => $status,
                            'changed_at' => now(),
                            'ride_request_id' => $rideRequestId,
                        ]);
                    }
                } else {
                    $ride->ride_status_activities()?->create([
                        'status' => $status,
                        'changed_at' => now(),
                    ]);
                }
            }
        }
    }

    public function update($request, $id)
    {
        DB::beginTransaction();
        try {
            $roleName = getCurrentRoleName();
            $taxidoSettings = getTaxidoSettings();
            $ride = $this->model->findOrFail($id);
            $ride_status_id = getRideStatusIdBySlug($request['status']);
            $driver = getDriverById($ride?->driver_id);
            $zone_id = $ride?->zones()->pluck('zone_id')?->first();
            $vehicleTypeZone = VehicleTypeZone::where('vehicle_type_id', $ride->vehicle_type_id)?->where('zone_id', $zone_id)?->first();
            if ($request['status'] == RideStatusEnum::CANCELLED) {
                if (empty($request['cancellation_reason'])) {
                    throw new Exception(__('taxido::static.rides.cancellation_reason_required'), 422);
                }

                if ($ride->ride_status?->slug == RideStatusEnum::CANCELLED) {
                    throw new Exception(__('taxido::static.rides.ride_already_cancelled'), 400);
                }

                if (in_array($ride->ride_status?->slug, [RideStatusEnum::STARTED, RideStatusEnum::ARRIVED, RideStatusEnum::COMPLETED])) {
                    throw new Exception(__('taxido::static.rides.ride_cannot_cancel'), 400);
                }

                $riderCancellationCharge = $vehicleTypeZone?->cancellation_charge_for_rider ?? 0;
                $driverCancellationCharge = $vehicleTypeZone?->cancellation_charge_for_driver ?? 0;
                if ($roleName == RoleEnum::DRIVER) {
                    $riderCancellationCharge = 0;
                } else if($roleName == RoleEnum::RIDER) {
                    $driverCancellationCharge = 0;
                }

                $ride->update([
                    'rider_cancellation_charge' => $riderCancellationCharge,
                    'driver_cancellation_charge' => $driverCancellationCharge,
                    'ride_status_id' => $ride_status_id,
                    'cancellation_reason' => $request['cancellation_reason'] ?? null,
                ]);

                $driver = getDriverById($ride?->driver_id);
                $charge_goes_to = $vehicleTypeZone?->charge_goes_to;
                if ($driverCancellationCharge) {
                    $this->debitDriverWallet($ride?->driver_id, $driverCancellationCharge, __('taxido::static.commission_histories.ride_cancellation_charge_credited', ['ride_number' => $ride?->ride_number]), $ride?->id, false);
                    if($charge_goes_to == 'fleet') {
                        $this->creditFleetWallet($driver?->fleet_manager_id, $driverCancellationCharge, __('taxido::static.commission_histories.ride_cancellation_charge_credited', ['ride_number' => $ride?->ride_number]), $ride?->id);
                    }
                }

                if($riderCancellationCharge) {
                    $this->debitRiderWallet($ride?->rider_id, $riderCancellationCharge, __('taxido::static.commission_histories.ride_cancellation_charge_credited', ['ride_number' => $ride?->ride_number]), $ride?->id, false);
                    if($charge_goes_to == RoleEnum::DRIVER) {
                        $this->creditDriverWallet($ride?->driver_id, $riderCancellationCharge, __('taxido::static.commission_histories.ride_cancellation_charge_credited', ['ride_number' => $ride?->ride_number]), $ride?->id);
                    } elseif($charge_goes_to == 'fleet') {
                        $this->creditFleetWallet($ride?->fleet_manager_id, $riderCancellationCharge, __('taxido::static.commission_histories.ride_cancellation_charge_credited', ['ride_number' => $ride?->ride_number]), $ride?->id);
                    }
                }

                $driver?->update([
                    'is_on_ride' => false,
                ]);
                $driver = $driver?->refresh();
                $data = [
                    'is_on_ride' => (string) $driver?->is_on_ride,
                ];

                $this->fireStoreUpdateDocument('driverTrack', $driver?->id, $data, true);
            }

            if ($roleName == RoleEnum::DRIVER && $request['status'] == RideStatusEnum::COMPLETED) {
                $ride_status_id = getRideStatusIdBySlug(RideStatusEnum::COMPLETED);
                if ($ride->driver_id != getCurrentUserId()) {
                    throw new Exception(__('taxido::static.rides.only_assigned_driver'), 400);
                }

                if ($ride?->service?->type == ServicesEnum::PARCEL) {
                    $isParcelOtpEnabled = $taxidoSettings['activation']['parcel_otp'];
                    if ($isParcelOtpEnabled && ! $ride?->is_otp_verified) {
                        if (isset($request['parcel_delivered_otp'])) {
                            if (! is_null($request['parcel_delivered_otp'])) {
                                if ($ride?->parcel_delivered_otp == $request['parcel_delivered_otp']) {
                                    $ride?->update([
                                        'is_otp_verified'  => true,
                                        'parcel_otp_verified_at' => now(),
                                    ]);

                                    $ride = $ride?->refresh();
                                }
                            }
                        }

                        if (!$ride?->parcel_otp_verified_at) {
                            throw new Exception(__('taxido::static.rides.otp_not_verified_for_parcel'), 400);
                        }
                    }
                }

                $driver?->update([
                    'is_on_ride' => false,
                ]);
            }

            if ($ride_status_id) {
                $ride->update(['ride_status_id' => $ride_status_id]);
                $this->updateRideStatusActivities($ride, $request['status']);
            }

            DB::commit();
            $ride = $ride->refresh();
            $driver = $driver?->refresh();
            $data = [
                'is_on_ride' => (string) $driver?->is_on_ride,
                'ride_id' => null,
            ];

            if ($ride?->ride_status?->slug == RideStatusEnum::COMPLETED) {
                if (!$ride?->waiting_charges && !$ride->waiting_total_times) {
                    $waiting_charges = 0;
                    $waiting_total_times = 0;
                    $arrived_at = $ride->ride_status_activities()->where([
                        'status' => RideStatusEnum::ARRIVED
                    ])->value('created_at');

                    $started_at = $ride->ride_status_activities()->where([
                        'status' => RideStatusEnum::STARTED
                    ])->value('created_at');

                    $waitingTime = null;
                    if ($arrived_at && $started_at) {
                        $waitingTime = Carbon::parse($started_at)->diffInMinutes(Carbon::parse($arrived_at));
                        $waitingTime = round($waitingTime, 2);
                        if ($waitingTime >= $vehicleTypeZone?->free_waiting_time_before_start_ride) {
                            $waitingTime -= $vehicleTypeZone?->free_waiting_time_before_start_ride;
                        }

                        if ($waitingTime >= $vehicleTypeZone?->free_waiting_time_after_start_ride) {
                            $waitingTime -= $vehicleTypeZone?->free_waiting_time_after_start_ride;
                        }

                        if ($waitingTime > 0) {
                            $waiting_charges = $waitingTime * $vehicleTypeZone?->waiting_charge;
                            $waiting_total_times = $waitingTime;
                        }

                        $total = $ride?->total + $waiting_charges;
                        $ride->update([
                            'waiting_charges' => $waiting_charges,
                            'waiting_total_times' => $waiting_total_times,
                            'total' => $total,
                        ]);
                    }
                }
            }

            $ride = $ride->refresh();
            $rideData = new RideDetailResource($ride);
            $rideDataArray = $rideData->toArray(request());
            $this->fireStoreUpdateDocument('driverTrack', $driver?->id, $data, true);
            $this->fireStoreUpdateDocument('rides', $ride?->id, $rideDataArray, true);

            return response()->json([
                'id' => $ride?->id,
                'ride_status' => [
                    'start_time' => $ride->start_time,
                    'name' => $ride->ride_status?->name,
                    'slug' => $ride->ride_status?->slug
                ]
            ]);

        } catch (Exception $e) {

            DB::rollBack();
            throw new ExceptionHandler($e->getMessage(), $e->getCode());
        }
    }

    public function startRide($request)
    {
        DB::beginTransaction();
        try {

            $roleName = getCurrentRoleName();
            if ($roleName == RoleEnum::DRIVER) {
                $ride = $this->model->findOrFail($request?->ride_id);
                $service = getServiceById($ride->service_id);
                if ($ride->otp != $request?->otp) {
                    throw new Exception(__('taxido::static.rides.invalid_otp'), 400);
                }

                if ($ride->driver_id != getCurrentUserId()) {
                    throw new Exception(__('taxido::static.rides.only_assigned_driver'), 400);
                }

                if ($service?->slug == ServicesEnum::PARCEL) {
                    $ride->update([
                        'ride_status_id'       => getRideStatusIdBySlug(RideStatusEnum::STARTED),
                        'parcel_delivered_otp' => rand(1000, 9999),
                    ]);
                } else {
                    $ride?->update([
                        'is_otp_verified' => true,
                        'start_time'      => $request?->start_time,
                        'ride_status_id'  => getRideStatusIdBySlug(RideStatusEnum::STARTED),
                    ]);
                }

                $ride->save();
                DB::commit();
                $ride = $ride->fresh();
                $driver = getDriverById($ride?->driver_id);
                $driver?->update([
                    'is_on_ride' => true,
                ]);

                $this->updateRideStatusActivities($ride, RideStatusEnum::STARTED);
                $data = [
                    'driver_name' => $driver?->name,
                    'is_verified' => $driver?->is_verified,
                    'is_on_ride' => (string) $driver?->is_on_ride,
                    'profile_image_url' => $driver?->profile_image?->original_url,
                    'rating_count' => $driver?->rating_count,
                    'review_count' => $driver?->review_count,
                    'phone' => $driver?->phone,
                    'country_code' => $driver->country_code,
                    'model' => $driver->vehicle_info?->model,
                    'plate_number' => $driver->vehicle_info?->plate_number,
                    'ride_id' => $ride?->id,
                    'vehicle_type_map_icon_url' => $driver?->vehicle_info?->vehicle?->vehicle_map_icon?->original_url,
                ];

                $rideData = new RideDetailResource($ride);
                $rideDataArray = $rideData->toArray(request());
                $this->fireStoreUpdateDocument('driverTrack', $driver?->id, $data, true);
                $this->fireStoreUpdateDocument('rides', $ride?->id, $rideDataArray, true);
                return response()->json([
                    'id' => $ride?->id,
                    'data' => new RideResource($ride),
                    'ride_status' => [
                        'name' => $ride->ride_status?->name,
                        'slug' => $ride->ride_status?->slug
                    ]
                ]);
            }

            throw new Exception(__('taxido::static.rides.user_must_be_driver'), 400);
        } catch (Exception $e) {

            DB::rollBack();
            throw new ExceptionHandler($e->getMessage(), $e->getCode());
        }
    }

    public function ambulanceStartRide($request)
    {
        DB::beginTransaction();
        try {

            $ride = $this->model->findOrFail($request?->ride_id);
            $service = getServiceById($ride->service_id);
            if ($service?->type == ServicesEnum::AMBULANCE) {
                $roleName = getCurrentRoleName();
                if ($roleName == RoleEnum::DRIVER) {
                    if ($ride->driver_id != getCurrentUserId()) {
                        throw new Exception(__('taxido::static.rides.only_assigned_driver'), 400);
                    }

                    $ride->update([
                        'ride_status_id'  => getRideStatusIdBySlug(RideStatusEnum::STARTED),
                    ]);

                    $ride->save();
                    DB::commit();
                    $ride = $ride->fresh();
                    $driver = getDriverById($ride?->driver_id);
                    $driver?->update([
                        'is_on_ride' => true,
                    ]);

                    $this->updateRideStatusActivities($ride, RideStatusEnum::STARTED);
                    $data = [
                        'driver_name' => $driver?->name,
                        'is_verified' => $driver?->is_verified,
                        'is_on_ride' => (string) $driver?->is_on_ride,
                        'profile_image_url' => $driver?->profile_image?->original_url,
                        'rating_count' => $driver?->rating_count,
                        'review_count' => $driver?->review_count,
                        'phone' => $driver?->phone,
                        'country_code' => $driver->country_code,
                        'model' => $driver->vehicle_info?->model,
                        'plate_number' => $driver->vehicle_info?->plate_number,
                        'ride_id' => $ride?->id,
                        'vehicle_type_map_icon_url' => $driver?->vehicle_info?->vehicle?->vehicle_map_icon?->original_url,
                    ];

                    $rideData = new RideDetailResource($ride);
                    $rideDataArray = $rideData->toArray(request());
                    $this->fireStoreUpdateDocument('driverTrack', $driver?->id, $data, true);
                    $this->fireStoreUpdateDocument('rides', $ride?->id, $rideDataArray, true);
                    return response()->json([
                        'id' => $ride?->id,
                        'data' => new RideResource($ride),
                        'ride_status' => [
                            'name' => $ride->ride_status?->name,
                            'slug' => $ride->ride_status?->slug
                        ]
                    ]);
                }

                throw new Exception(__('taxido::static.rides.user_must_be_driver'), 400);
            }

            throw new Exception(__('taxido::static.rides.only_ambulance_ride_request'), 400);

        } catch (Exception $e) {

            DB::rollBack();
            throw new ExceptionHandler($e->getMessage(), $e->getCode());
        }
    }

    public function verifyOtp($request)
    {
        DB::beginTransaction();
        try {

            if (parcelOtpEnabled()) {
                $roleName = getCurrentRoleName();
                if ($roleName != RoleEnum::DRIVER) {
                    throw new Exception(__('taxido::static.rides.user_must_be_driver'), 400);
                }

                $ride = $this->model->findOrFail($request->ride_id);
                if ($ride->service_id != getServiceIdBySlug(ServicesEnum::PARCEL)) {
                    throw new Exception(__('taxido::static.rides.invalid_service_type'), 400);
                }

                if ($ride->otp != $request->otp) {
                    throw new Exception(__('taxido::static.rides.invalid_otp'), 400);
                }

                $ride?->update([
                    'is_otp_verified'        => true,
                    'parcel_otp_verified_at' => now(),
                ]);

                DB::commit();
                return response()->json([
                    'id' => $ride?->id,
                    'ride_status' => [
                        'name' => $ride->ride_status?->name,
                        'slug' => $ride->ride_status?->slug
                    ]
                ]);
            }

            throw new Exception(__('taxido::static.rides.parcel_otp_disabled'), 400);
        } catch (Exception $e) {

            DB::rollBack();
            throw new ExceptionHandler($e->getMessage(), $e->getCode());
        }
    }

    public function verifyCoupon($request)
    {
        try {

            $rideDiscount = 0;
            $coupon = $this->getCoupon($request->coupon);
            if ($coupon) {
                $total = $this->isValidCoupon($coupon, $request);
                if ($total) {
                    switch ($coupon->type) {
                        case 'fixed':
                            $rideDiscount = $this->fixedDiscount($total, $coupon->amount);
                            break;

                        case 'percentage':
                            $rideDiscount = $this->percentageDiscount($total, $coupon->amount);
                            break;

                        default:
                            $rideDiscount = 0;
                    }
                }
            }

            return [
                'total_coupon_discount' => round($rideDiscount, 2) ,
                'coupon_type' => $coupon->type,
                'is_apply_all' => $coupon?->is_apply_all,
                'applicable_vehicles' => $coupon?->vehicle_types()?->pluck('vehicle_type_id')?->toArray(),
                'success' => true,
            ];
        } catch (Exception $e) {

            throw new ExceptionHandler($e->getMessage(), $e->getCode());
        }
    }

    public function payment($request)
    {
        DB::beginTransaction();
        try {

            $ride = $this->model->findOrFail($request->ride_id);
            $settings = getTaxidoSettings();
            if ($request->driver_tip && ! $ride->driver_tips) {
                if ($settings['activation']['driver_tips']) {
                    $ride->driver_tips = $request->driver_tip;
                    $ride->comment = $request->comment;
                    $ride->sub_total = $ride->sub_total + $request->driver_tip;
                    $ride->total = $ride->total + $request->driver_tip;
                    $ride->save();
                    $ride = $ride->refresh();
                }
            }

            if ($request->coupon) {
                $discount = $this->verifyCoupon($request);
                if (isset($discount['total_coupon_discount'])) {
                    $coupon = $this->getCoupon($request->coupon);
                    if ($coupon) {
                        $ride->coupon_id = $coupon?->id;
                        $ride->coupon_total_discount = ($discount['total_coupon_discount'] ?? 0);
                        $ride->sub_total = $ride->sub_total - ($discount['total_coupon_discount'] ?? 0);
                        $ride->total = $ride->total - ($discount['total_coupon_discount'] ?? 0);
                        $ride->save();
                    }
                }
            }

            DB::commit();
            $ride = $ride->refresh();
            if ($request->payment_method != PaymentMethod::CASH && $request->payment_method != PaymentMethod::WALLET) {
                if (!$settings['activation']['online_payments']) {
                    throw new Exception(__('taxido::static.online_payments_is_disabled'), 400);
                }

                $module = Module::find($request->payment_method);
                if (!is_null($module) && $module?->isEnabled()) {
                    $moduleName = $module->getName();
                    $payment = 'Modules\\' . $moduleName . '\\Payment\\' . $moduleName;
                    if (class_exists($payment) && method_exists($payment, 'getIntent')) {
                        if ($ride->payment_method != PaymentMethod::CASH) {
                            $ride->payment_status = PaymentStatus::PENDING;
                            $ride->payment_mode   = PaymentMode::ONLINE;
                            $processing_fee       = config($request->payment_method)['processing_fee'] ?? 0.0;
                            $ride->processing_fee = $processing_fee ?? 0;
                            $ride->total = $ride->total + $processing_fee;
                            $ride->save();
                        }

                        $request->merge([
                            'type' => 'ride',
                            'request_type' => 'api'
                        ]);

                        return $payment::getIntent($ride, $request);

                    } else {
                        throw new Exception(__('static.booking.payment_module_not_found'), 400);
                    }
                }

                throw new Exception(__('taxido::static.rides.selected_payment_module_not_found'), 400);

            } elseif ($request->payment_method == PaymentMethod::CASH) {

                if (!$settings['activation']['cash_payments']) {
                    throw new Exception(__('taxido::static.cash_payments_is_disabled'), 400);
                }

                if ($request->payment_method == PaymentMethod::CASH) {
                    $ride->payment_mode = PaymentMode::OFFLINE;
                } elseif ($request->payment_method == PaymentMethod::WALLET) {
                    $ride->payment_mode = PaymentMode::ONLINE;
                }

                $ride->save();
                $request->merge(['type' => 'ride']);
                $ride = $this->paymentStatus($ride, PaymentStatus::COMPLETED, $request);
                $rideData = new RideDetailResource($ride);
                $rideDataArray = $rideData->toArray(request());
                $this->fireStoreUpdateDocument('rides', $ride?->id, $rideDataArray, true);
                return $ride;

            } elseif($request->payment_method == PaymentMethod::WALLET) {

                $riderId = getCurrentUserId();
                $request->merge(['type' => 'ride']);
                $ride = $this->paymentStatus($ride, PaymentStatus::COMPLETED, $request);
                $ride->payment_method = PaymentMethod::WALLET;
                $ride->save();
                $ride = $ride->refresh();

                if ($this->verifyRiderWallet($riderId, $ride?->total)) {
                    $this->debitRiderWallet($riderId, $ride?->total, "Wallet amount successfully debited for ride #{$ride?->ride_number}.");
                }

                $rideData = new RideDetailResource($ride);
                $rideDataArray = $rideData->toArray(request());
                $this->fireStoreUpdateDocument('rides', $ride?->id, $rideDataArray, true);
                return $ride;

            }

            throw new Exception(__('static.invalid_payment_method'), 400);

        } catch (Exception $e) {

            DB::rollBack();
            throw new ExceptionHandler($e->getMessage(), $e->getCode());
        }
    }

    public function verifyPayment($request)
    {
        try {

            $paymentTransaction = self::getPaymentTransactions($request->item_id, $request?->type, $request->transaction_id);
            if ($paymentTransaction) {
                $item = null;
                $payment_method = $paymentTransaction?->payment_method;
                switch ($paymentTransaction?->type) {
                    case 'wallet':
                        $currentRoleName = getCurrentRoleName();
                        if ($currentRoleName === RoleEnum::DRIVER) {
                            $item = DriverWallet::findOrFail($request?->item_id);
                        } elseif ($currentRoleName === RoleEnum::RIDER) {
                            $item = RiderWallet::findOrFail($request?->item_id);
                        }
                        break;

                    case 'subscription':
                        $item = $this->getDriverSubscription($request?->item_id);
                        break;

                    case 'ride':
                        $item  = $this->model->findOrFail($request?->item_id);
                        $item->payment_method = $payment_method;
                        $item->save();
                        $item = $item->refresh();
                        $rideData = new RideDetailResource($item);
                        $rideDataArray = $rideData->toArray(request());
                        $this->fireStoreUpdateDocument('rides', $item?->id, $rideDataArray, true);
                }

                if (! $paymentTransaction?->is_verified) {
                    if ($item && $payment_method) {
                        if ($payment_method != PaymentMethod::CASH) {
                            $payment = Module::find($payment_method);
                            if (! is_null($payment) && $payment?->isEnabled()) {
                                $request['amount']  = $paymentTransaction?->amount;
                                $request['transaction_id'] = $paymentTransaction?->transaction_id;
                                $payment_status = $paymentTransaction?->payment_status;
                                $paymentTransaction?->update([
                                    'is_verified' => true,
                                ]);
                                $item = $this->paymentStatus($item, $payment_status, $request);
                                return response()?->json(['id' => $item?->id]);
                            }
                        } elseif ($payment_method == PaymentMethod::CASH || $payment_method == PaymentMethod::WALLET) {

                            $payment_status = PaymentStatus::COMPLETED;
                            $paymentTransaction?->update([
                                'is_verified' => true,
                            ]);

                            return response()?->json(['id' => $item?->id]);
                        }

                        throw new Exception(__('static.payment_methods.not_found'), 400);
                    }
                }

                return response()?->json(['id' => $item?->id]);
            }

            throw new Exception(__('taxido::static.rides.invalid_details'), 400);
        } catch (Exception $e) {

            throw new ExceptionHandler($e->getMessage(), $e->getCode());
        }
    }

    public function getDriverSubscription($item_id)
    {
        return DriverSubscription::findOrFail($item_id);
    }

    public function paymentStatus($item, $status, $request)
    {
        if ($status) {
            if ($request->type == 'ride') {
                $item?->update([
                    'payment_status' => $status,
                ]);

                if ($status == PaymentStatus::COMPLETED) {
                    $ride_status_id = getRideStatusIdBySlug(RideStatusEnum::COMPLETED);
                    if ($ride_status_id) {
                        $item->ride_status_id = $ride_status_id;
                        $item->save();
                        $item = $item?->refresh();
                    }

                    $this->calAdminDriverCommission($item);
                }
            } elseif ($request->type == 'wallet') {
                if ($status == PaymentStatus::COMPLETED) {
                    $item->increment('balance', $request->amount);
                    $transaction_id = $request?->transaction_id;
                    $this->storeTransaction($item, TransactionType::CREDIT, WalletDetail::TOPUP, $request->amount, null, $transaction_id);
                }
            } elseif ($request->type == 'subscription') {
                if ($status == PaymentStatus::COMPLETED) {
                    $item?->update([
                        'payment_status' => $status,
                    ]);

                    return $item;
                }
            }
        }

        return $item;
    }

    public function getInvoice($request)
    {
        try {

            $ride = $this->verifyInvoiceId($request->invoice_id);
            $roleName = getCurrentRoleName();
            if ($ride->rider_id != getCurrentUserId() && $roleName == RoleEnum::RIDER) {
                throw new Exception(__('errors.not_created_ride'), 400);
            }

            $invoice = [
                'ride'     => $ride,
                'settings' => getTaxidoSettings(),
            ];

            return Pdf::loadView('taxido::emails.invoice', $invoice)->download('ride_invoice_' . $ride->ride_number . '.pdf');

        } catch (Exception $e) {

            throw new ExceptionHandler($e->getMessage(), $e->getCode());
        }
    }

    public function verifyInvoiceId($invoice_id)
    {
        try {

            $ride = $this->model->where('invoice_id', $invoice_id)?->first();
            if (!$ride) {
                throw new Exception(__('errors.invalid_ride_number'), 400);
            }

            return $ride;
        } catch (Exception $e) {

            throw new ExceptionHandler($e->getMessage(), $e->getCode());
        }
    }


    public function fetchTodayScheduleRide()
    {
        try {

            $today = now()->format('Y-m-d');
            $cabSettings = getTaxidoSettings();
            $leadTimeMinutes = $cabSettings['ride']['schedule_ride_request_lead_time'] ?? 15;
            $serviceCategoryIds = getServiceCategoryIdsByType(ServiceCategoryEnum::SCHEDULE);
            $rideRequestIds = RideRequest::whereIn('service_category_id', $serviceCategoryIds)?->whereDate('start_time', $today)?->whereNull('deleted_at')?->pluck('id');
            foreach ($rideRequestIds as $rideRequestId) {
                if($rideRequestId) {
                    $rideRequest = RideRequest::where('id', $rideRequestId)?->whereNull('deleted_at')?->first();

                    if($rideRequest) {
                        $startTime = Carbon::parse($rideRequest->start_time);
                        $drivers = $this->findIdleDrivers($rideRequest);
                        if($leadTimeMinutes) {
                            $reminderTime = $startTime->subMinutes($leadTimeMinutes);
                            if (now() >= $reminderTime && now() < $startTime) {
                                $rideRequest?->ride_status_activities()?->create([
                                    'status' => RideStatusEnum::REQUESTED,
                                    'changed_at' => now(),
                                ]);

                                $drivers = $this->findIdleDrivers($rideRequest);
                                $rideRequestFireStoreFields = new RideRequestResource($rideRequest);
                                $data = $rideRequestFireStoreFields?->toArray(request());
                                $this->addRideRequestFireStore($data, $drivers);
                            }
                        }
                    }
                }
            }

        } catch (Exception $e) {

            throw new ExceptionHandler($e->getMessage(), $e->getCode());
        }
    }

    public function offlineDrivers()
    {
        try {

            $filters = [
                ['is_online', 'EQUAL', '1'],
            ];

            $cabSettings = getTaxidoSettings();
            $driverMaxOnlineHours = $cabSettings['ride']['driver_max_online_hours'] ?? 18;
            if($driverMaxOnlineHours) {
                $drivers = $this->fireStoreQueryCollection('driverTrack', $filters);
                $workingHoursAgo = Carbon::now()->subHours($driverMaxOnlineHours)->format('Y-m-d\TH:i:s.v\Z');
                foreach ($drivers as $driver) {
                    $lastOnline = $driver['last_online_at'] ?? null;
                    if ($lastOnline && $lastOnline < $workingHoursAgo) {
                        $this->fireStoreUpdateDocument(
                            'driverTrack',
                            $driver['id'],
                            ['is_online' => '0'],
                            true
                        );
                    } elseif (!$lastOnline) {
                        $this->fireStoreUpdateDocument(
                            'driverTrack',
                            $driver['id'],
                            ['is_online' => '0'],
                            true
                        );
                    }
                }

                return $drivers;
            }

        } catch (Exception $e) {

            throw new ExceptionHandler($e->getMessage(), $e->getCode());
        }
    }
}
