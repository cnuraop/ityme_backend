<?php

namespace Vtlabs\Doctor\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class HospitalAvailabilityResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'days' => $this->days,
            'from' => $this->from,
            'to' => $this->to,
            'hospital_id' => $this->hospital_id
        ];
    }
}