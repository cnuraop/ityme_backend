<?php

namespace Vtlabs\Doctor\Http\Resources;

use Vtlabs\Core\Models\User\User;
use Illuminate\Http\Resources\Json\JsonResource;
use Vtlabs\Category\Http\Resources\CategoryResource;
use Vtlabs\Doctor\Http\Resources\HospitalAvailabilityResource;

class HospitalResource extends JsonResource
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
            'slug' => $this->slug,
            'facilities' => $this->facilities,
            'meta' => $this->meta,
            'address' => $this->address,
            'longitude' => $this->longitude,
            'latitude' => $this->latitude,
            'mediaurls' => $this->getMediaUrlsAttribute(),
            'sort_order' => $this->sort_order,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'fee' => $this->whenPivotLoaded('doctor_profiles_hospitals', function () {
                return (float) $this->pivot->fee;
            }),
            'services' => CategoryResource::collection($this->services),
            'categories' => CategoryResource::collection($this->categories),
            'availability' => HospitalAvailabilityResource::collection($this->availabilities),
            'ratings' => $this->averageRating(User::class),
            'ratings_count' => $this->raters(User::class)->count(),
            'favourite_count' => $this->favoritesCount,
            'is_favourite' => $this->isFavorited()
        ];
    }
}