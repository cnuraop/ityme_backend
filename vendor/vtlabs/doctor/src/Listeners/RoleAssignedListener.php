<?php

namespace Vtlabs\Doctor\Listeners;

use Vtlabs\Core\Events\RoleAssigned;
use Vtlabs\Doctor\Models\DoctorProfile;

class RoleAssignedListener
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  RoleAssigned $event
     * @return void
     */
    public function handle(RoleAssigned $event)
    {
        if(in_array('doctor', $event->roles)) {
            if(!DoctorProfile::where('user_id', $event->user->id)->exists()) {
                DoctorProfile::create([
                    'user_id' => $event->user->id
                ]);
            }
        }

        return true;
    }
}
