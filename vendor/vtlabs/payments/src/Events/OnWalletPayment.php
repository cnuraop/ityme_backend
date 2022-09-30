<?php

namespace Vtlabs\Payment\Events;

use Illuminate\Queue\SerializesModels;
use Illuminate\Foundation\Events\Dispatchable;
use Vtlabs\Payment\Models\Payment;

class OnWalletPayment
{
    use Dispatchable, SerializesModels;

    public $payment;

    /**
     * Create a new event instance.
     */
    public function __construct(Payment $payment)
    {
        $this->payment = $payment;
    }
}