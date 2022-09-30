<?php

namespace Vtlabs\Payment\Contracts;

interface Payable
{
    /**
     * Relationship for models that paid this model.
     *
     * @param  null|\Illuminate\Database\Eloquent\Model  $model
     * @return mixed
     */
    public function payment();

    /**
     * Current model is paid or not.
     *
     * @param  null|\Illuminate\Database\Eloquent\Model  $model
     * @return boolean
     */
    public function isPaid($model=null);
}
