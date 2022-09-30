<?php

namespace Vtlabs\Payment\Contracts;

use Vtlabs\Payment\Models\Payment;
use Illuminate\Database\Eloquent\Model;
use Vtlabs\Payment\Models\GatewayResponse;

interface Gateway
{
    public function purchase(Payment $model, array $parameters): ?GatewayResponse;

    public function completePurchase(Payment $model, array $parameters): ?GatewayResponse;

    public function authorize(Payment $model, array $parameters): ?GatewayResponse;

    public function completeAuthorize(Payment $model, array $parameters): ?GatewayResponse;

}
