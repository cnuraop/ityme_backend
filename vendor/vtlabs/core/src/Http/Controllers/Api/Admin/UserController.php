<?php

namespace Vtlabs\Core\Http\Controllers\Api\Admin;

use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Spatie\Permission\Models\Role;
use Vtlabs\Core\Events\Registered;
use Vtlabs\Core\Filters\UserFilter;
use Illuminate\Support\Facades\Gate;
use Vtlabs\Core\Events\RoleAssigned;
use Vtlabs\Core\Services\UserService;
use Illuminate\Support\Facades\Storage;
use Vtlabs\Core\Http\Controllers\Controller;
use Vtlabs\Core\Http\Resources\Admin\UserAdminResource;

class UserController extends Controller
{
    private $userModel;
    public function __construct() {
        $this->userModel = config('auth.models.user');
    }

    public function index(Request $request)
    {
        $request->validate([        
            'pagination' => 'sometimes|boolean',
            'email' => 'sometimes',
            'name' => 'sometimes',
            'mobile_number' => 'sometimes'
        ]);

        $users = $this->userModel::filter($request->all(), UserFilter::class);

        if ($request->pagination == '0') {
            $users = $users->get();
        } else {
            $users = $users->paginate();
        }
        
        return UserAdminResource::collection($users);
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|max:255',
            'email' => 'required|email|max:255|unique:users',
            'mobile_number' => 'required|unique:users',
            'password' => 'required|min:6',
            'mobile_verified' => 'required|boolean',
            'username' => 'sometimes|max:255',
            'image' => 'sometimes|image',
            'language' => 'required|locale',
            'roles' => ['required', 'array', 'role'],
            'meta' => 'sometimes|json|nullable',
        ]);

        if ($request->meta) {
            request()->merge([
                "meta" => json_decode($request->meta)
            ]);
        }

        request()->merge([
            "password" => bcrypt($request->password)
        ]);

        $user = UserService::create(collect($request->only(['name', 'email', 'mobile_number', 'password', 'mobile_verified', 'language', 'roles', 'username', 'meta'])));
        
        if ($request->image) {
            $user->image_url = Storage::url($request->file('image')->store('uploads'));
        }

        $user->save();

        return new UserAdminResource($user->fresh());
    }

    public function show($id)
    {
        return new UserAdminResource($this->userModel::find($id));
    }

    public function update(Request $request, $id)
    {
        $user = $this->userModel::findOrFail($id);

        $request->validate([
            'name' => 'required|max:255',
            'email' => ['required', 'email', 'max:255', Rule::unique('users')->ignore($user->id)],
            'mobile_number' => ['required', Rule::unique('users')->ignore($user->id)],
            'mobile_verified' => 'required|boolean',
            'password' => 'sometimes|min:6',
            'username' => 'sometimes|max:255',
            'image' => 'sometimes|image',
            'language' => 'required|locale',
            'roles' => ['required', 'array', 'role'],
            'meta' => 'sometimes|json|nullable',
        ]);

        if($request->has('password')) {
            request()->merge([
                "password" => bcrypt($request->password)
            ]);
        }

        if ($request->meta) {
            request()->merge([
                "meta" => json_decode($request->meta)
            ]);
        }

        $user = $user->fill($request->only(['name', 'email', 'mobile_number', 'password', 'mobile_verified', 'language', 'username', 'meta']));

        if ($request->image) {
            $newMediaItems = [];
            $newMediaItems[] = $user->addMedia($request->file('image'))->toMediaCollection('images');
            $user->clearMediaCollectionExcept('images', $newMediaItems);
        }

        $user->save();

        // attach roles
        $user->syncRoles($request->roles);

        event(new RoleAssigned($user, $request->roles));

        return new UserAdminResource($user->fresh());
    }

    public function destroy($id)
    {
        Gate::authorize('delete');

        $this->userModel::findOrFail($id)->delete();
        
        return response()->json([], 200);
    }

    public function roles()
    {
        return response()->json(Role::all());
    }
}
