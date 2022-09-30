<?php

namespace Vtlabs\Support;

use Illuminate\Support\ServiceProvider;

class SupportServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        $this->publishes([
            __DIR__.'/../config/vtlabs_support.php' => config_path('vtlabs_support.php'),
        ], 'config');

        $this->loadMigrationsFrom(__DIR__.'/../database/migrations');

        $this->loadRoutesFrom(__DIR__.'/../routes/api.php');
        $this->loadRoutesFrom(__DIR__.'/../routes/web.php');

        // views
        $this->publishes([
            __DIR__.'/../resources/views' => resource_path('views/vendor/support'),
        ], 'views');

        // assets
        $this->publishes([
            __DIR__.'/../assets' => public_path('assets/vendor/support'),
        ], 'public');
    }
}
