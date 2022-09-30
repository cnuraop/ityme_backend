<?php

namespace Vtlabs\Doctor\Http\Resources;

use Vtlabs\Core\Models\User\User;
use Vtlabs\Core\Http\Resources\UserResource;
use Illuminate\Http\Resources\Json\JsonResource;
use Vtlabs\Category\Http\Resources\CategoryResource;

class DoctorProfileResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'name_translations' => $this->getTranslations('name'),
            'tagline' => $this->tagline,
            'tagline_translations' => $this->getTranslations('tagline'),
            'details' => $this->details,
            'details_translations' => $this->getTranslations('details'),
            'meta' => $this->meta,
            'experience_years' => $this->experience_years,
            'fee' => $this->fee,
            'address' => $this->address,
            'longitude' => $this->longitude,
            'latitude' => $this->latitude,
            'is_verified' => $this->is_verified,
            'mediaurls' => $this->getMediaUrlsAttribute(),
            'user_id' => $this->user_id,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'degrees' => CategoryResource::collection($this->degrees),
            'types' => CategoryResource::collection($this->types),
            'specializations' => CategoryResource::collection($this->specializations),
            'services' => CategoryResource::collection($this->services),
            'hospitals' => HospitalResource::collection($this->hospitals),
            'availability' => AvailabilityResource::collection($this->availabilities),
            'user' => new UserResource($this->user),
            'ratings' => $this->averageRating(User::class),
            'ratings_count' => $this->raters(User::class)->count(),
            'favourite_count' => $this->favoritesCount,
            'is_favourite' => $this->isFavorited()
        ];
    }
}