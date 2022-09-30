<?php

namespace Vtlabs\Core\Http\Resources;

use Vtlabs\Core\Models\User\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Resources\Json\JsonResource;
use Vtlabs\Category\Http\Resources\CategoryResource;

class UserResource extends JsonResource
{
    public function toArray($request)
    {
        $user = User::find($this->id); 

        return [
            'id' => $this->id,
            'name' => $this->name,
            'email' => $this->email,
            'username' => $this->username,
            'mobile_number' => $this->mobile_number,
            'mobile_verified' => $this->mobile_verified,
            'is_verified' => $this->is_verified,
            'active' => $this->active,
            'language' => $this->language,
            'notification' => $this->notification,
            'meta' => $this->meta,
            'mediaurls' => $this->getMediaUrlsAttribute(),
            'balance' => $this->balance,
            'wallet' => $this->wallet,
            'is_following' => Auth::check() ? Auth::user()->isFollowing(User::find($this->id)) : false,
            'categories' => CategoryResource::collection($this->categories),
            'plan' => $user->hasActiveSubscription() ? $user->activeSubscription() : null,
        ];
    }
}