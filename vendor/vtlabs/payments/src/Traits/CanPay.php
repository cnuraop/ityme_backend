<?php

namespace Vtlabs\Payment\Traits;

use Illuminate\Database\Eloquent\Model;
use InvalidArgumentException;
use Vtlabs\Payment\Models\Payment;
use Vtlabs\Payment\Models\PaymentMethod;
use Vtlabs\Payment\Contracts\Payable;

trait CanPay
{
    /**
     *  Payment of certain model.
     */
    public function payment(Model $model): ?Model
    {
        $modelClass = (new $model)->getMorphClass();

        return $this->morphMany(Payment::class, 'payer')
            ->where('payable_type', $modelClass)
            ->where('payable_id', $model->getKey())->first();
    }

    /**
     * Pay a certain model.
     */
    public function createPayment(Model $model, float $amount, string $paymentMethodSlug = null): Model
    {
        if (!$model instanceof Payable) {
            throw new \InvalidArgumentException("Must be an instance of Payable");
        }

        // delete if there was any previous attempt for payment
        $previousPayment = $this->payment($model);
        if ($previousPayment) {
            $previousPayment->delete();
        }

        $paymentMethod = null;
        if ($paymentMethodSlug) {
            try {
                $paymentMethod = PaymentMethod::where('slug', $paymentMethodSlug)->first();
            } catch (\Exception $ex) {
                //
            }
        }

        $payment = Payment::create([
            'payer_id' => $this->getKey(),
            'payer_type' => $this->getMorphClass(),
            'payable_type' => $model->getMorphClass(),
            'payable_id' => $model->getKey(),
            'amount' => $amount,
            'payment_method_id' => $paymentMethod ? $paymentMethod->id : null
        ]);

        if ($paymentMethod && $paymentMethod->type == 'postpaid') {
            $payment->setStatus('postpaid');
        }

        return $payment;
    }

    /**
     * Update payment for a certain model.
     */
    public function updatePayment(Model $model, string $status): ?Model
    {
        $payment = $this->payment($model);
        if ($payment) {
            $payment->setStatus($status);
        }
        return $payment;
    }
}
