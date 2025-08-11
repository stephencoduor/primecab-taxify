<?php

namespace Modules\Taxido\Listeners;

use Exception;
use Modules\Taxido\Events\DriverVerificationEvent;
use Modules\Taxido\Notifications\DriverVerifiedNotification;

class DriverVerificationListener
{
    /**
     * Handle the event.
     *
     * @param DriverVerificationEvent $event
     */
    public function handle(DriverVerificationEvent $event): void
    {
        try {

            $driver = $event->driver;
            if ($driver) {
                $driver->notify(new DriverVerifiedNotification($driver, $event->status));
            }

            $message = "Your document has '{$event->status}' status";
            $this->sendPushNotification($driver->fcm_token, $message, $driver);

        } catch (Exception $e) {

            //
        }
    }

    public function sendPushNotification($token, $message, $driver)
    {
        if ($token) {
            $locale = request()->hasHeader('Accept-Lang') ? request()->header('Accept-Lang') : app()->getLocale();
            $notification = [
                'message' => [
                    'token' => $token,
                    'notification' => [
                        'title' => 'Document Status Updated',
                        'body' => $message,
                        'image' => '',
                    ],
                    'data' => [
                        'click_action' => 'FLUTTER_NOTIFICATION_CLICK',
                        'type' => 'driver_document_status',
                    ],
                ],
            ];

            pushNotification($notification);
        }
    }
}
