<?php

namespace Vtlabs\Category\Models;

use EloquentFilter\Filterable;
use Illuminate\Database\Eloquent\Model;
use Spatie\Translatable\HasTranslations;
use Vtlabs\Core\Traits\CoreHasMediaTrait;
use Spatie\MediaLibrary\HasMedia\HasMedia;

class Category extends Model implements HasMedia
{
    use Filterable,
        HasTranslations,
        CoreHasMediaTrait;

    protected $table = 'categories';

    protected $guarded = [];

    protected $casts = [
        'title' => 'array',
        'meta' => 'json'
    ];

    public $availableMediaConversions = [];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);  
        
        $this->availableMediaConversions = [
            'thumb' => ["width" => config('vtlabs_category.images.thumb', 50)]
        ];
    }

    public $translatable = ['title'];

    public function scopeOrdered($query)
    {
        return $query->orderBy('sort_order');
    }

    public function subcategories()
    {
        return $this->hasMany(config('vtlabs_category.models.category'), 'parent_id');
    }

    public function category()
    {
        return $this->belongsTo(config('vtlabs_category.models.category'), 'parent_id');
    }
}
