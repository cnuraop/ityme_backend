<?php

namespace Vtlabs\Core\Http\Controllers\Api;

use Illuminate\Http\Request;
use Vtlabs\Core\Filters\UserFilter;
use Illuminate\Support\Facades\Auth;
use Vtlabs\Core\Http\Controllers\Controller;
use Vtlabs\Core\Http\Resources\NotificationResource;
use Vtlabs\Core\Models\Notification;
use Vtlabs\Core\Models\User\User;

/**
 * @group  User Management
 *
 * APIs for user management
 */
class UserController extends Controller
{
    private $userModel;
    private $userResource;

    public function __construct() {
        $this->userModel = config('auth.models.user');
        $this->userResource = config('auth.resources.user');
    }

    public function index(Request $request)
    {
        $request->validate([
            'search' => 'sometimes'
        ]);

        $users = $this->userModel::filter($request->all(), UserFilter::class);

        return $this->userResource::collection($users->paginate());
    }

    public function show()
    {
        return new $this->userResource(Auth::user());
    }

    public function showUserById(User $user)
    {
        return new $this->userResource($user);
    }
    
    public function update(Request $request)
    {
        $request->validate([
            'name' => 'sometimes',
            'username' => 'sometimes|string',
            'image_url' => 'sometimes|nullable|url',
            'notification' => 'sometimes|json|nullable',
            'language' => 'sometimes|string',
            'meta' => 'sometimes|json',
            'categories' => 'sometimes|array|exists:categories,id'
        ]);

        $user = Auth::user();
        
        if($request->name) {
            $user->name = $request->name;
        }

        if($request->username) {
            $user->username = $request->username;
        }

        if($request->notification) {
            $user->notification = json_decode($request->notification);
        }
        
        if($request->language) {
            $user->language = $request->language;
        }

        if($request->image_url) {
            $newMediaItems = [];
            $newMediaItems[] = $user->addMediaFromUrl($request->image_url)->toMediaCollection('images');
            $user->clearMediaCollectionExcept('images', $newMediaItems);
        }
        
        if($request->meta) {
            $user->meta = json_decode($request->meta);
        }
        
        $user->save();

        if($request->categories) {
            $user->categories()->sync($request->categories);
        }
        
        return new $this->userResource($user->fresh());
    }
    
    public function newChatNotification(Request $request)
    {
        $request->validate([
            "role" => "required|role",
            "user_id" => "required|exists:users,id"
        ]);
        
        $notifyingUser = Auth::user();
        $notifiedUser = $this->userModel::find($request->user_id);

        $notifiedUser->sendPushNotification($request->role,
            __('vtlabs_core::messages.notification_chat_new_message_title'),
            __('vtlabs_core::messages.notification_chat_new_message_body')
        );

        return response()->json((object)[], 200);
    }

    public function notifications(Request $request)
    {
        $request->validate([]);

        $notifications = Notification::where('user_id', Auth::id());

        return NotificationResource::collection($notifications->paginate());
    }
}
