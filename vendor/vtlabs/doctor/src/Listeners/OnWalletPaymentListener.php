<?php

namespace Vtlabs\Doctor\Listeners;

use Vtlabs\Core\Models\Setting;
use Vtlabs\Core\Models\User\User;
use Vtlabs\Appointment\Models\Appointment;
use Vtlabs\Payment\Events\OnWalletPayment;
use Vtlabs\Doctor\Http\Resources\AppointmentResource;
use Vtlabs\Doctor\Models\DoctorProfile;

class OnWalletPaymentListener
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
     * @param  OnWalletPayment $event
     * @return void
     */
    public function handle(OnWalletPayment $event)
    {
        $payment = $event->payment;

        if ($payment->payable_type == 'Vtlabs\Appointment\Models\Appointment' && $payment->status == 'paid') {
            $appointment = Appointment::find($payment->payable_id);

            $user = User::find($payment->payer_id);
            $doctor = DoctorProfile::find($appointment->appointee_id);

            $user->withdraw($payment->amount, 'withdraw', [
                'description' => 'Appointment #' . $appointment->id,
                'type' => 'wallet_payment',
                'source_title' => 'Appointment #' . $appointment->id,
                'source' => 'apopointment',
                'source_id' => $appointment->id,
                'source_amount' => $payment->amount,
                'source_payment_type' => $payment->paymentMethod->type == 'postpaid' ? 'COD' : 'Online'
            ]);

            // doctor earnings in this appointment
            $adminShare = floatval(Setting::findByKey('admin_commision_value'));
            $doctorEarnings = $payment->amount - ($payment->amount * $adminShare) / 100;
            $adminTotalEarning = ($payment->amount * $adminShare) / 100; // admin gets it's share of earning

            $doctor->user->deposit($doctorEarnings, 'deposit', [
                'description' => 'Appointment #' . $appointment->id,
                'type' => 'earnings',
                'source' => 'apopointment',
                'source_id' => $appointment->id,
                'source_amount' => $payment->amount,
                'source_payment_type' => $payment->paymentMethod->type == 'postpaid' ? 'COD' : 'Online'
            ]);

            // if admin has earned something from this appointment, create a transaction for admin's earning
            if ($adminTotalEarning !== 0) {
                User::find(1)->deposit($adminTotalEarning, 'deposit', [
                    'description' => 'Appointment #' . $appointment->id,
                    'type' => 'earnings',
                    'source' => 'apopointment',
                    'source_id' => $appointment->id,
                    'source_amount' => $payment->amount,
                    'source_payment_type' => $payment->paymentMethod->type == 'postpaid' ? 'COD' : 'Online'
                ]);
            }
        }
    }
}
