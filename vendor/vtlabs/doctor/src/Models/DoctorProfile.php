<?php

namespace Vtlabs\Doctor\Models;

use EloquentFilter\Filterable;
use Vtlabs\Core\Models\User\User;
use Vtlabs\Category\Models\Category;
use Rennokki\Rating\Traits\CanBeRated;
use Illuminate\Database\Eloquent\Model;
use Rennokki\Rating\Contracts\Rateable;
use Spatie\Translatable\HasTranslations;
use Vtlabs\Core\Traits\CoreHasMediaTrait;
use Spatie\MediaLibrary\HasMedia\HasMedia;
use Vtlabs\Appointment\Contracts\Appointee;
use Vtlabs\Appointment\Traits\CanBeAppointed;
use ChristianKuri\LaravelFavorite\Traits\Favoriteable;

class DoctorProfile extends Model implements Appointee, Rateable, HasMedia
{
    use Filterable,
        Favoriteable,
        CoreHasMediaTrait,
        HasTranslations,
        CanBeAppointed,
        CanBeRated;

    protected $table = 'doctor_profiles';

    protected $guarded = [];

    protected $casts = [
        'name' => 'json',
        'details' => 'json',
        'tagline' => 'json',
        'meta' => 'json',
        'experience_years' => 'integer',
        'longitude' => 'float',
        'latitude' => 'float',
        'is_verified' => 'integer'
    ];

    public $translatable = ['name', 'details', 'tagline'];

    public static function findByUser($userId)
    {
        return DoctorProfile::where('user_id', $userId)->firstOrFail();
    }

    public function scopeOrdered($query)
    {
        return $query->orderBy('created_at', 'desc');
    }

    public function degrees()
    {
        return $this->belongsToMany(Category::class, 'doctor_profiles_degrees', 'doctor_profile_id', 'category_id');
    }

    public function specializations()
    {
        return $this->belongsToMany(Category::class, 'doctor_profiles_specializations', 'doctor_profile_id', 'category_id');
    }

    public function services()
    {
        return $this->belongsToMany(Category::class, 'doctor_profiles_services', 'doctor_profile_id', 'category_id');
    }

    public function types()
    {
        return $this->belongsToMany(Category::class, 'doctor_profiles_types', 'doctor_profile_id', 'category_id');
    }

    public function hospitals()
    {
        return $this->belongsToMany(Hospital::class, 'doctor_profiles_hospitals', 'doctor_profile_id', 'hospital_id')->withPivot("fee");
    }

    public function availabilities()
    {
        return $this->hasMany(Availability::class, 'doctor_profile_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
