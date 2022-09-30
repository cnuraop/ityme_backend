<?php

namespace Vtlabs\Banner\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class BannerResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'title' => $this->title,
            'title_translations' => $this->getTranslations('title'),
            'meta' => $this->meta,
            'sort_order' => $this->sort_order,
            'mediaurls' => $this->getMediaUrlsAttribute()
        ];
    }
}
