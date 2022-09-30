<?php

namespace Vtlabs\Doctor\Models;

use EloquentFilter\Filterable;
use Vtlabs\Category\Models\Category;
use Rennokki\Rating\Traits\CanBeRated;
use Illuminate\Database\Eloquent\Model;
use Rennokki\Rating\Contracts\Rateable;
use Spatie\Translatable\HasTranslations;
use Vtlabs\Core\Traits\CoreHasMediaTrait;
use Spatie\MediaLibrary\HasMedia\HasMedia;
use Vtlabs\Doctor\Models\HospitalAvailability;
use ChristianKuri\LaravelFavorite\Traits\Favoriteable;

class Hospital extends Model implements Rateable, HasMedia
{
    use Filterable,
        Favoriteable,
        CoreHasMediaTrait,
        HasTranslations,
        CanBeRated;

    protected $table = 'doctor_hospitals';

    protected $guarded = [];

    protected $casts = [
        'name' => 'json',
        'details' => 'json',
        'tagline' => 'json',
        'meta' => 'json',
        'longitude' => 'float',
        'latitude' => 'float'
    ];

    public $translatable = ['name', 'details', 'tagline'];

    public function scopeOrdered($query)
    {
        return $query->orderBy('sort_order');
    }

    public function services()
    {
        return $this->belongsToMany(Category::class, 'doctor_hospital_services', 'hospital_id', 'category_id');
    }

    public function categories()
    {
        return $this->belongsToMany(Category::class, 'doctor_hospital_categories', 'hospital_id', 'category_id');
    }

    public function availabilities()
    {
        return $this->hasMany(HospitalAvailability::class, 'hospital_id');
    }
}
