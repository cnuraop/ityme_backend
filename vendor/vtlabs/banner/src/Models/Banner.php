<?php

namespace Vtlabs\Banner\Models;

use EloquentFilter\Filterable;
use Illuminate\Database\Eloquent\Model;
use Spatie\Translatable\HasTranslations;
use Spatie\MediaLibrary\HasMedia\HasMedia;
use Vtlabs\Core\Traits\CoreHasMediaTrait;

class Banner extends Model implements HasMedia
{
    use Filterable,HasTranslations,CoreHasMediaTrait;


    protected $table = 'banners';

    protected $guarded = [];

    protected $casts = [
        'title' => 'json',
        'meta' => 'json'
    ];

    public $translatable = ['title'];
    public $availableMediaConversions = [];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes); 
        
        $this->availableMediaConversions = [
            'thumb' => ["width" => config('vtlabs_banner.images.thumb', 50)]
        ];
    }

    public function getTitleTranslationsAttribute()
    {
        return $this->getTranslations('title');
    }

    public function scopeOrdered($query)
    {
        return $query->orderBy('sort_order');
    }
}
