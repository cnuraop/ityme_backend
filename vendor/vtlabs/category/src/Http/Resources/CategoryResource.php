<?php

namespace Vtlabs\Category\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class CategoryResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'slug' => $this->slug,
            'title' => $this->title,
            'title_translations' => $this->getTranslations('title'),
            'meta' => $this->meta,
            'sort_order' => $this->sort_order,
            'mediaurls' => $this->getMediaUrlsAttribute(),
            'parent_id' => $this->parent_id
        ];
    }
}