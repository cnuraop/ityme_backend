<?php

namespace Vtlabs\Payment\Services\PaymentGateway;

use BadMethodCallException;
use InvalidArgumentException;
use Vtlabs\Payment\Models\Payment;
use Vtlabs\Payment\Contracts\Gateway;
use Illuminate\Support\Facades\Validator;
use Vtlabs\Payment\Models\GatewayResponse;
use Cartalyst\Stripe\Laravel\Facades\Stripe;

class StripeGateway
{
    public function purchase(Payment $payment, array $parameters): GatewayResponse
    {
        $validator = Validator::make($parameters, [
            'token' => 'required',
            'amount' => 'required',
            'currency' => 'required'
        ]);

        if ($validator->fails()) {
            throw new InvalidArgumentException();
        }

        $amount = number_format((float) $parameters['amount'], 2, '.', '');
        $currency = $parameters['currency'];

        try {
            $token = $parameters['token'];
            
            $charge = Stripe::charges()->create([
                'amount' => $amount,
                'currency' => strtolower($currency),
                'description' => 'Payment',
                'source' => $token,
            ]);

            $payment->setStatus('paid');
            $payment->save();

            $response = new GatewayResponse(["charge" => $charge], true);
        } catch (\Exception $ex) {
            throw $ex;
        }

        return $response;
    }
}
