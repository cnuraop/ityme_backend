<?php

namespace Vtlabs\Doctor\Listeners;

use Vtlabs\Core\Models\User\User;
use Vtlabs\Doctor\Models\DoctorProfile;
use Vtlabs\Doctor\Events\UpdateAppointment;

class UpdateAppointmentListener
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  UpdateAppointment $event
     * @return void
     */
    public function handle(UpdateAppointment $event)
    {
        $doctor = DoctorProfile::find($event->appointment->appointee_id);
        $user = User::find($event->appointment->appointer_id);

        if (in_array($event->appointment->status, ['accepted', 'complete', 'rejected'])) {
            $user->sendPushNotification(
                'customer',
                __('vtlabs_doctor::messages.notification_update_appointment_title', ['id' => $event->appointment->id, 'status' => $event->appointment->status]),
                __('vtlabs_doctor::messages.notification_update_appointment_body')
            );
        }

        if (in_array($event->appointment->status, ['cancelled', 'complete'])) {
            $user->sendPushNotification(
                'doctor',
                __('vtlabs_doctor::messages.notification_update_appointment_title', ['id' => $event->appointment->id, 'status' => $event->appointment->status]),
                __('vtlabs_doctor::messages.notification_update_appointment_body')
            );
        }

        return true;
    }
}
