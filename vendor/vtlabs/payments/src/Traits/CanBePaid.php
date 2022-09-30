<?php

namespace Vtlabs\Payment\Traits;

trait CanBePaid
{
    /**
     * Relationship for models that paid this model.
     *
     * @param  null|\Illuminate\Database\Eloquent\Model  $model
     * @return mixed
     */
    public function payment()
    {
        return $this->morphOne(config('vtlabs_payment.models.payment'), 'payable');
    }

    /**
     * Calculate if current model is paid
     *
     * @param  null|\Illuminate\Database\Eloquent\Model  $model
     * @return float
     */
    public function isPaid($model = null): bool
    {
        return $this->payment->status == 'paid' ? true : false;
    }
}
