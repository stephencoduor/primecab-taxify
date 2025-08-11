<?php

namespace Modules\Taxido\Listeners;

use Exception;
use App\Models\SmsTemplate;
use App\Models\PushNotificationTemplate;
use Modules\Taxido\Events\RideRequestEvent;
use Modules\Taxido\Notifications\RideRequestNotification;

class RideRequestListener
{
    /**
     * Handle the event.
     */
    public function handle(RideRequestEvent $event): void
    {
        try {

            $drivers = $event->rideRequest->drivers;

            foreach ($drivers as $driver) {
                $driver->notify(new RideRequestNotification($driver,$event->rideRequest));
                $sendTo = ('+'.$driver?->country_code.$driver?->phone);
                sendSMS($sendTo, $this->getSMSMessage($driver,$event));

                $this->sendPushNotification($driver, $event);
            }

        } catch (Exception $e) {

            //
        }
    }

    public function sendPushNotification($driver, $event)
    {
        if ($driver->fcm_token) {
            $locale = request()->hasHeader('Accept-Lang') ? request()->header('Accept-Lang') : app()->getLocale();
            $slug = 'ride-request-driver';

            $content = PushNotificationTemplate::where('slug', $slug)->first();

            $riderName = $event->rideRequest->rider['name'];
        $fromTo = implode(" ➡️ ", $event->rideRequest->locations);

                $title = "🚗 New Ride Request Available!";
             $body = "Hey {$driver->name}! 🎯 {$riderName} just requested a ride from {$fromTo}. Place your bid now and don’t miss the ride! 🛣️💰";

            $notification = [
                'message' => [
                    'token' => $driver->fcm_token,
                    'notification' => [
                        'title' => $title,
                        'body' => $body,
                        'image' => '',
                    ],
                    'data' => [
                        'service_request_id' => (string) $event?->rideRequest?->id,
                        'click_action' => 'FLUTTER_NOTIFICATION_CLICK',
                        'type' => 'service_request',
                    ],
                ],
            ];
            pushNotification($notification);
        }
    }

    public function getSMSMessage($driver , $event)
    {
        $locale = request()->hasHeader('Accept-Lang') ? request()->header('Accept-Lang') : app()->getLocale();
        $slug = 'ride-request-driver';
        $content = SmsTemplate::where('slug', $slug)->first();

        if ($content) {
            $data = [
               '{{driver_name}}' => $driver->name,
                    '{{rider_name}}' => $event->rideRequest->rider['name'],
                    '{{services}}' => $event->rideRequest->service->name,
                    '{{service_category}}' => $event->rideRequest->service_category->name,
                    '{{vehicle_type}}' => $event->rideRequest->vehicle_type->name,
                    '{{fare_amount}}' => $event->rideRequest->ride_fare,
                    '{{distance}}' => $event->rideRequest->distance,
                    '{{distance_unit}}' => $event->rideRequest->distance_unit,
                    '{{locations}}' => implode("<br>", $event->rideRequest->locations),
                    '{{Your Company Name}}' => config('app.name')
            ];

            $message = str_replace(array_keys($data), array_values($data), $content?->content[$locale]);

        } else {
            $message = "A new ride request has been created. Place your bid now.";
        }

        return $message;
    }
}
