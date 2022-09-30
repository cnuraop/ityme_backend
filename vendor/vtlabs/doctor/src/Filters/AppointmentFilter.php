<?php

namespace Vtlabs\Doctor\Filters;

use Carbon\Carbon;
use EloquentFilter\ModelFilter;
use Vtlabs\Core\Models\User\User;
use Illuminate\Support\Facades\App;
use Vtlabs\Doctor\Models\DoctorProfile;

class AppointmentFilter extends ModelFilter
{
    public function setup()
    {
        $this->where('appointer_type', User::class)
            ->where('appointee_type', DoctorProfile::class);
    }

    public function appointer($id)
    {
        return $this->where('appointer_id', $id);
    }

    public function appointee($id)
    {
        return $this->where('appointee_id', $id);
    }

    public function duration($duration)
    {
        $created_at = Carbon::now()->subDays(365 * 5);

        switch ($duration) {
            case 'hours':
                $created_at = Carbon::now()->subDays(1);
                break;
            case 'days':
                $created_at = Carbon::now()->subDays(7);
                break;
            case 'months':
                $created_at = Carbon::now()->subDays(30);
                break;
            case 'years':
                $created_at = Carbon::now()->subDays(365);
                break;
        }

        return $this->whereDate('created_at', '>', $created_at)->whereDate('created_at', '<=', Carbon::now());
    }
}
