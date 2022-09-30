<?php

namespace Vtlabs\Appointment\Services;

use Vtlabs\Appointment\Models\Appointment;

class AppointmentService 
{
    public static function validationRules()
    {
        return [
            'amount' => 'required|numeric',
            'address' => 'sometimes|string',
            'longitude' => 'sometimes|numeric',
            'latitude' => 'sometimes|numeric',
            'date' => 'required|date_format:Y-m-d',
            'time_from' => 'required|date_format:H:i',
            'time_to' => 'required|date_format:H:i',
            'payment_method_slug' => 'sometimes',
            'meta' => 'sometimes|json|nullable',
            'is_guest' => 'sometimes|boolean',
            'customer_mobile' => 'sometimes',
            'customer_name' => 'sometimes',
            'customer_email' => 'sometimes',
            'duplicate_slots_allowed' => 'sometimes|numeric' // // this controls how many duplicate slots can be booked i.e no. of appointments at same time, -1 implies unlimited
        ];
    }

    public static function updateStatus(Appointment $appointment, $status)
    {
        $appointment->setStatus($status);
    }
}