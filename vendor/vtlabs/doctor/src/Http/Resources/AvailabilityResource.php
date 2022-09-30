<?php

namespace Vtlabs\Doctor\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class AvailabilityResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'days' => $this->days,
            'from' => $this->from,
            'to' => $this->to,
            'doctor_profile_id' => $this->doctor_profile_id
        ];
    }
}