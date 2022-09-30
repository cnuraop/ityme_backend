<?php

namespace Vtlabs\Appointment\Models;

use EloquentFilter\Filterable;
use Spatie\ModelStatus\HasStatuses;
use Vtlabs\Payment\Contracts\Payable;
use Illuminate\Database\Eloquent\Model;
use Vtlabs\Payment\Traits\CanBePaid;

class Appointment extends Model implements Payable
{
    use Filterable,
        HasStatuses,
        CanBePaid;

    protected $table = 'appointments';

    protected $guarded = [];

    protected $casts = [
        'amount' => 'float',
        'longitude' => 'float',
        'latitude' => 'float',
        'meta' => 'array',
        'amount_meta' => 'array',
        'address_meta' => 'array'
    ];

    public static function boot()
    {
        parent::boot();

        // on create
        static::created(function ($appointment) {
            $appointment->setStatus(config('vtlabs_appointment.appointment.status_default'));
        });
    }

    public function isValidStatus(string $name, ?string $reason = null): bool
    {
        return in_array($name, config('vtlabs_appointment.appointment.status_list', []));
    }

    /**
     * The relationship function for the model who was appointed.
     *
     * @return mixed
     */
    public function appointee()
    {
        return $this->morphTo();
    }

    /**
     * The relationship function for the model who appointed.
     *
     * @return mixed
     */
    public function appointer()
    {
        return $this->morphTo();
    }
}
