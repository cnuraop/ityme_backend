<?php

namespace Vtlabs\Doctor\Models;

use Vtlabs\Doctor\Models\Hospital;
use Illuminate\Database\Eloquent\Model;

class HospitalAvailability extends Model
{
    protected $table = 'doctor_hospital_availabilities';

    protected $guarded = [];

    public $timestamps = false;

    public function hospitals()
    {
        $this->belongsTo(Hospital::class);
    }
}
