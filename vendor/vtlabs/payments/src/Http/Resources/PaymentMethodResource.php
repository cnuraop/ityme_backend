<?php

namespace Vtlabs\Payment\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class PaymentMethodResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'slug' => $this->slug,
            'title' => $this->title,
            'title_translations' => $this->getTranslations('title'),
            'meta' => $this->meta,
            'enabled' => $this->enabled,
            'type' => $this->type,
        ];
    }
}