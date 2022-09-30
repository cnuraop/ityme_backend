<?php

namespace Vtlabs\Payment\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Vtlabs\Payment\Http\Resources\PaymentMethodResource;

class PaymentResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'payable_id' => $this->payable_id,
            'payer_id' => $this->payer_id,
            'amount' => $this->amount,
            'status' => $this->status,
            'payment_method' => new PaymentMethodResource($this->paymentMethod),
        ];
    }
}