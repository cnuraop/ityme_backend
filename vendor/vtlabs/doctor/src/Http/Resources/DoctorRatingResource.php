<?php

namespace Vtlabs\Doctor\Http\Resources;

use Vtlabs\Doctor\Models\DoctorProfile;
use Vtlabs\Core\Http\Resources\UserResource;
use Illuminate\Http\Resources\Json\JsonResource;
use Vtlabs\Doctor\Http\Resources\DoctorProfileResource;

class DoctorRatingResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'rating' => $this->pivot->rating,
            'review' => $this->pivot->review,
            'created_at' => $this->pivot->created_at,
            'user' => new UserResource($this),
            'doctor' => new DoctorProfileResource(DoctorProfile::find($this->pivot->rateable_id))
        ];
    }
}