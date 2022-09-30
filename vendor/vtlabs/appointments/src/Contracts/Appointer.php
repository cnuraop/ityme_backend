<?php

namespace Vtlabs\Appointment\Contracts;

use Illuminate\Database\Eloquent\Model;

interface Appointer
{
    /**
     *  Appointment of certain model.
     */
    public function appointments(Model $model): ?Model;

    public function appoint(Model $model, $attributes): Model;

    public function validateAppointmentRequest(Model $model, array $attributes);
}
