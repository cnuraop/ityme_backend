<?php

namespace Vtlabs\Core\Http\Controllers\Api\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Vtlabs\Core\Http\Controllers\Controller;
use Vtlabs\Core\Http\Resources\Admin\UserAdminResource;

class LoginController extends Controller
{
    /**
     * Login admin user
     *
     * @return \Illuminate\Http\Response
     */
    public function authenticate(Request $request)
    {
        $request->validate([
            'email' => 'required|string',
            'password' => 'required|string',
        ]);

        if ($this->validate($request) || Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
            if(!Auth::user()->hasRole('admin') && !Auth::user()->hasRole('manager')) {
                return response()->json(["message" => "Permission denied. No suitable role found"], 400);
            }
            $user = Auth::user();
            $token = $user->createToken('Default')->accessToken;
            return response()->json(["token" => $token, "user" => new UserAdminResource($user)]);
        }
        return response()->json(["message" => "Invalid Login"], 400);
    }
}
