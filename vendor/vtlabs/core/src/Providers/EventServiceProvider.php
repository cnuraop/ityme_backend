<?php

namespace Vtlabs\Core\Providers;

use Vtlabs\Core\Events\Registered;
use Vtlabs\Payment\Events\PaymentUpdated;
use Vtlabs\Core\Listeners\RegisteredListener;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;
use Vtlabs\Core\Listeners\PaymentUpdatedListener;

class EventServiceProvider extends ServiceProvider
{
    /**
     * The event listener mappings for the application.
     *
     * @var array
     */
    protected $listen = [
        Registered::class => [RegisteredListener::class],
        PaymentUpdated::class => [PaymentUpdatedListener::class]
    ];

    /**
     * Register any events for your application.
     *
     * @return void
     */
    public function boot()
    {
        parent::boot();

        //
    }
}
