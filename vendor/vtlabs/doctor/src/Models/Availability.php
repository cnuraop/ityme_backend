<?php

namespace Vtlabs\Doctor\Models;

use Illuminate\Database\Eloquent\Model;
use Vtlabs\Doctor\Models\DoctorProfile;

class Availability extends Model
{
    protected $table = 'doctor_availabilities';

    protected $guarded = [];

    public $timestamps = false;

    public function doctorProfile()
    {
        $this->belongsTo(DoctorProfile::class);
    }
}
