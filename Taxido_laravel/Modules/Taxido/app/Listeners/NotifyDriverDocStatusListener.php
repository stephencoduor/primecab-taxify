<?php

namespace Modules\Taxido\Listeners;

use Exception;
use App\Models\SmsTemplate;
use App\Models\PushNotificationTemplate;
use Modules\Taxido\Events\NotifyDriverDocStatusEvent;
use Modules\Taxido\Notifications\NotifyDriverDocStatusNotification;

class NotifyDriverDocStatusListener
{
    /**
     * Handle the event.
     */
    public function handle(NotifyDriverDocStatusEvent $event): void
    {
        try {
            $driver = $event->driver;
            $document = $event->document;

            $driver->notify(new NotifyDriverDocStatusNotification($document));

            $sendTo = ('+' . $driver->country_code . $driver->phone);
            sendSMS($sendTo, $this->getSMSMessage($driver, $document));

            // Send Push
            $message = "Your document '{$document->name}' status has been updated to {$document->status}";
            $this->sendPushNotification($driver->fcm_token, $message, $driver, $document);

        } catch (Exception $e) {
           //
        }
    }

    public function getSMSMessage($driver, $document)
    {
        $locale = request()->hasHeader('Accept-Lang') ? request()->header('Accept-Lang') : app()->getLocale();
        $slug = 'driver-document-status-update';
        $content = SmsTemplate::where('slug', $slug)->first();

        if ($content) {
            $data = [
                '{{driver_name}}' => $driver->name,
                '{{document_name}}' => $document->name,
                '{{status}}' => ucfirst($document->status),
                '{{Your Company Name}}' => config('app.name')
            ];
            return str_replace(array_keys($data), array_values($data), $content->content[$locale]);
        }

        return "Your document '{$document->name}' status has been updated.";
    }

    public function sendPushNotification($token, $message, $driver, $document)
{
    if (!$token) return;

    $status = strtolower($document->status);
    $docName = $document->name;

    if ($status === 'accepted') {
        $title = "✅ Document Approved!";
        $body = "Great news! 🎉 Your document \"{$docName}\" has been approved. You’re good to go! 🚗💨";
    } elseif ($status === 'rejected') {
        $title = "❌ Document Rejected";
        $body = "Oops! 😕 Your document \"{$docName}\" was rejected. Please review and upload again. 📤";
    } else {
        $title = "📄 Document Status Updated";
        $body = "Your document \"{$docName}\" status is now \"{$status}\". Check your profile for more info. 📱";
    }

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
                'type' => 'driver_document_status',
            ],
        ],
    ];

    pushNotification($notification);
}

}
