<?php

namespace Vtlabs\Doctor\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Vtlabs\Core\Http\Resources\UserResource;
use Vtlabs\Doctor\Models\Hospital;

class HospitalRatingResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'rating' => $this->pivot->rating,
            'review' => $this->pivot->review,
            'created_at' => $this->pivot->created_at,
            'user' => new UserResource($this),
            'hospital' => new HospitalResource(Hospital::find($this->pivot->rateable_id))
        ];
    }
}