<?php

namespace Vtlabs\Appointment\Traits;

use Vtlabs\Appointment\Models\Appointment;

trait CanBeAppointed
{
    /**
     * Relationship for models that appointed this model.
     *
     * @param  null|\Illuminate\Database\Eloquent\Model  $model
     * @return mixed
     */
    public function appointments()
    {
        return $this->morphOne(Appointment::class, 'appointee');
    }
}
