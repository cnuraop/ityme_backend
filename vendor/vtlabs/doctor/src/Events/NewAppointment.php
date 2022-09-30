<?php

namespace Vtlabs\Doctor\Events;

use Vtlabs\Ecommerce\Models\Order;
use Illuminate\Queue\SerializesModels;
use Vtlabs\Appointment\Models\Appointment;
use Illuminate\Foundation\Events\Dispatchable;

class NewAppointment
{
    use Dispatchable, SerializesModels;

    public $appointment;

    public $statusUpdate;

    /**
     * Create a new event instance.
     */
    public function __construct(Appointment $appointment)
    {
        $this->appointment = $appointment;
    }
}