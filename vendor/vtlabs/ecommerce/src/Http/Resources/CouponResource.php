<?php

namespace Vtlabs\Ecommerce\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class CouponResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'title' => $this->title,
            'detail' => $this->detail,
            'meta' => $this->meta,
            'code' => $this->code,
            'reward' => $this->reward,
            'type' => $this->type,
            'expires_at' => $this->expires_at
        ];
    }
}