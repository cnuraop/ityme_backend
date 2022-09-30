<?php

namespace Vtlabs\Core\Listeners;

use Vtlabs\Core\Models\User\User;
use Vtlabs\Core\Events\Registered;
use Vtlabs\Core\Events\RoleAssigned;
use Vtlabs\Payment\Events\PaymentUpdated;

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
        
        // if payable_type is Transaction we consider it as wallet payment and deposit the amount in user's wallet
        if ($payment->payable_type == 'Vtlabs\Core\Models\Transaction' && $payment->status == 'paid') {
            $user_id = $payment->payer_id;
            User::find($user_id)->deposit(
                $payment->amount,
                'deposit',
                [
                    'description' => 'Amount deposited in wallet',
                    'type' => 'deposit'
                ]
            );
        }
        return true;
    }
}
