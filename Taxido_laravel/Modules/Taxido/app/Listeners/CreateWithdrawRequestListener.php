<?php

namespace Modules\Taxido\Listeners;

use Exception;
use App\Models\User;
use App\Enums\RoleEnum;
use App\Models\SmsTemplate;
use App\Models\PushNotificationTemplate;
use Illuminate\Contracts\Queue\ShouldQueue;
use Modules\Taxido\Events\CreateWithdrawRequestEvent;
use Modules\Taxido\Notifications\CreateWithdrawRequestNotification;

class CreateWithdrawRequestListener
{
    /**
     * Handle the event.
     */
    public function handle(CreateWithdrawRequestEvent $event)
    {
        try {

            $admin = User::role(RoleEnum::ADMIN)->first();
            if (isset($admin)) {
                $admin->notify(new CreateWithdrawRequestNotification($event->withdrawRequest));
                $sendTo = ('+'.$admin?->country_code.$admin?->phone);
                sendSMS($sendTo, $this->getSMSMessage($event));
                $message = "A New Withdraw Request Has Been created ";
                $this->sendPushNotification($admin->fcm_token, $message, $event);
            }

        } catch (Exception $e) {

            //
        }
    }

    public function getSMSMessage($event)
    {
        $locale = request()->hasHeader('Accept-Lang') ? request()->header('Accept-Lang') : app()->getLocale();
        $slug = 'create-withdraw-request-admin';
        $content = SmsTemplate::where('slug', $slug)->first();
        $driver = User::where('id', $event->withdrawRequest->driver_id)->first();

        if ($content) {

            $data = [
                '{{driver_name}}' => $driver?->name,
                '{{amount}}'=> $event->withdrawRequest?->amount,
            ];

            $message = str_replace(array_keys($data), array_values($data), $content?->content[$locale]);

        } else {
            $message = "A new Withdraw Request has been created.";
        }

        return $message;
    }

public function sendPushNotification($token, $message, $event)
{
    if (!$token) return;

    // Excited, user-friendly static messages with emojis
    $title = "💰 Withdraw Request Received!";
    $body = "A driver has just requested a withdrawal 🚀. Head over to the dashboard to review it! ✅";

    $notification = [
        'message' => [
            'token' => $token,
            'notification' => [
                'title' => $title,
                'body' => $body,
                'image' => '',
            ],
            'data' => [
                'click_action' => 'FLUTTER_NOTIFICATION_CLICK',
                'type' => 'service_request', // Consider renaming to 'withdraw_request' for clarity
            ],
        ],
    ];

    pushNotification($notification);
}
}
