<?php

namespace Vtlabs\Core\Models\User;

use Depsimon\Wallet\HasWallet;
use EloquentFilter\Filterable;
use Rennokki\Rating\Traits\Rate;
use Vtlabs\Payment\Traits\CanPay;
use Laravel\Passport\HasApiTokens;
use Illuminate\Support\Facades\Log;
use Vtlabs\Payment\Contracts\Payer;
use Rennokki\Rating\Contracts\Rating;
use Spatie\Permission\Traits\HasRoles;
use Illuminate\Notifications\Notifiable;
use Vtlabs\Core\Models\PushNotification;
use Vtlabs\Appointment\Traits\CanAppoint;
use Vtlabs\Core\Traits\CoreHasMediaTrait;
use Spatie\MediaLibrary\HasMedia\HasMedia;
use Vtlabs\Appointment\Contracts\Appointer;
use Illuminate\Foundation\Auth\User as Authenticatable;
use ChristianKuri\LaravelFavorite\Traits\Favoriteability;
use Illuminate\Contracts\Translation\HasLocalePreference;
use Vtlabs\Core\Jobs\SendPushNotification;
use Overtrue\LaravelFollow\Followable;
use Overtrue\LaravelLike\Traits\Liker;
use BeyondCode\Comments\Contracts\Commentator;
use Rennokki\Plans\Traits\HasPlans;

class User extends Authenticatable implements HasMedia, HasLocalePreference, Rating, Payer, Appointer, Commentator
{
    use Notifiable,
        HasRoles,
        HasApiTokens,
        Filterable,
        Favoriteability,
        CoreHasMediaTrait,
        CanPay,
        Rate,
        CanAppoint,
        HasWallet,
        Followable,
        Liker,
        HasPlans;

    protected $table = 'users';

    protected $guard_name = 'api';

    protected $fillable = [
        'name', 'email', 'password', 'mobile_number', 'mobile_verified',
        'active', 'language', 'notification', 'meta'
    ];

    protected $hidden = ['roles', 'password'];

    protected $casts = [
        'notification' => 'array',
        'meta' => 'array'
    ];

    public $availableMediaConversions = [];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

        // $this->availableMediaConversions = [
        //     'thumb' => ["width" => config('vtlabs_core.images.thumb', 50)],
        //     'small' => ["width" => config('vtlabs_core.images.small', 150)]
        // ];
    }

    public static function boot()
    {
        parent::boot();

        // on create
        static::created(function ($user) {
            $user->wallet()->create();
        });
    }
    
    /**
     * Check if a comment for a specific model needs to be approved.
     * @param mixed $model
     * @return bool
     */
    public function needsCommentApproval($model): bool
    {
        return false;    
    }

    /**
     * Get the user's preferred locale.
     *
     * @return string
     */
    public function preferredLocale()
    {
        return $this->language ?? 'en';
    }

    public function categories()
    {
        return $this->belongsToMany(config('vtlabs_category.models.category'), 'category_preferences', 'user_id', 'category_id');
    }

    public function sendPushNotification($role, $title, $body, $data = [])
    {
        $notificationId = $this->notification[$role] ?? null;

        if (!$notificationId) {
            Log::warning('Push Notification: Missing notfication id', ['role' => $role, 'userId' => $this->id]);
            return false;
        }

        $pushNotification = new PushNotification($this->preferredLocale(), $role, $title, $body, $notificationId, []);

        config('queue.use_queue') ? SendPushNotification::dispatch($pushNotification) : SendPushNotification::dispatchAfterResponse($pushNotification);
    }
}
