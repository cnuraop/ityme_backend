<?php

namespace Vtlabs\Doctor\Listeners;

use Vtlabs\Payment\Events\PaymentUpdated;
use Vtlabs\Appointment\Models\Appointment;

class PaymentUpdatedListener
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
     * @param  Registered $event
     * @return void
     */
    public function handle(PaymentUpdated $event)
    {
        $payment = $event->payment;

        // we need to process the appointment according to payment status
        if ($payment->payable_type == 'Vtlabs\Appointment\Models\Appointment') {
            if ($payment->status == 'failed') {
                $appointment = Appointment::find($payment->payable_id);
                $appointment->setStatus('failed');
                $appointment->save();
            }
        }

        return true;
    }
}
