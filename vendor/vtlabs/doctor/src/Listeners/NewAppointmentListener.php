<?php

namespace Vtlabs\Doctor\Listeners;

use Vtlabs\Core\Events\RoleAssigned;
use Vtlabs\Doctor\Models\DoctorProfile;
use Vtlabs\Doctor\Events\NewAppointment;

class NewAppointmentListener
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
     * @param  RoleAssigned $event
     * @return void
     */
    public function handle(NewAppointment $event)
    {
        $doctor = DoctorProfile::find($event->appointment->appointee_id);

        $doctor->user->sendPushNotification(
            'doctor',
            __('vtlabs_doctor::messages.notification_new_appointment_title', ['id' => $event->appointment->id]),
            __('vtlabs_doctor::messages.notification_new_appointment_body')
        );

        return true;
    }
}
