<?php

namespace Vtlabs\Doctor\Http\Resources;

use Vtlabs\Core\Models\User\User;
use Vtlabs\Doctor\Models\DoctorProfile;
use Vtlabs\Core\Http\Resources\UserResource;
use Illuminate\Http\Resources\Json\JsonResource;
use Vtlabs\Payment\Http\Resources\PaymentResource;
use Vtlabs\Doctor\Http\Resources\DoctorProfileResource;

class AppointmentResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'meta' => $this->meta,
            'amount' => $this->amount,
            'amount_meta' => $this->amount_meta,
            'address' => $this->address,
            'address_meta' => $this->address_meta,
            'longitude' => $this->longitude,
            'latitude' => $this->latitude,
            'date' => $this->date,
            'time_from' => $this->time_from,
            'time_to' => $this->time_to,
            'status' => $this->status,
            'user' => new UserResource(User::find($this->appointer_id)),
            'doctor' => new DoctorProfileResource(DoctorProfile::find($this->appointee_id)),
            'payment' => new PaymentResource($this->payment),
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at
        ];
    }
}