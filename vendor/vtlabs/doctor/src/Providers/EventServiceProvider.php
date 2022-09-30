<?php

namespace Vtlabs\Doctor\Providers;

use Vtlabs\Core\Events\LoggedIn;
use Vtlabs\Core\Events\RoleAssigned;
use Vtlabs\Doctor\Events\NewAppointment;
use Vtlabs\Payment\Events\PaymentUpdated;
use Vtlabs\Payment\Events\OnWalletPayment;
use Vtlabs\Doctor\Events\UpdateAppointment;
use Vtlabs\Doctor\Listeners\LoggedInListener;
use Vtlabs\Doctor\Listeners\RoleAssignedListener;
use Vtlabs\Doctor\Listeners\NewAppointmentListener;
use Vtlabs\Doctor\Listeners\PaymentUpdatedListener;
use Vtlabs\Doctor\Listeners\OnWalletPaymentListener;
use Vtlabs\Doctor\Listeners\UpdateAppointmentListener;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    /**
     * The event listener mappings for the application.
     *
     * @var array
     */
    protected $listen = [
        LoggedIn::class => [LoggedInListener::class],
        RoleAssigned::class => [RoleAssignedListener::class],
        NewAppointment::class => [NewAppointmentListener::class],
        UpdateAppointment::class => [UpdateAppointmentListener::class],
        OnWalletPayment::class => [OnWalletPaymentListener::class],
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
