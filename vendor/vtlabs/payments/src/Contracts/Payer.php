<?php

namespace Vtlabs\Payment\Contracts;

use Illuminate\Database\Eloquent\Model;

interface Payer
{
    /**
     *  Payment of certain model.
     */
    public function payment(Model $model): ?Model;

    /**
     * Pay a certain model.
     */
    public function createPayment(Model $model, float $amount): Model;

    /**
     * Update payment for a certain model.
     */
    public function updatePayment(Model $model, string $status): ?Model;
}
