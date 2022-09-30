<?php

namespace Vtlabs\Core\Services;

use Vtlabs\Core\Models\User\User;
use Illuminate\Support\Collection;
use Vtlabs\Core\Events\Registered;

class UserService
{
    public static function create(Collection $data)
    {
        $data->merge(['password' => bcrypt($data['password'])]);

        $user = User::create($data->only(['name', 'email', 'mobile_number', 'password', 'mobile_verified', 'language'])->toArray());

        // attach roles
        $user->assignRole($data['roles']);

        event(new Registered($user, $data['roles']));

        return $user;
    }
}
