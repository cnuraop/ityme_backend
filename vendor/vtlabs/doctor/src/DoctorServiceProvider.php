<?php

namespace Vtlabs\Doctor;

use Illuminate\Support\ServiceProvider;

class DoctorServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        $this->publishes([
            __DIR__.'/../config/vtlabs_doctor.php' => config_path('vtlabs_doctor.php'),
        ], 'config');

        // translations
        $this->loadTranslationsFrom(__DIR__.'/../resources/lang', 'vtlabs_doctor');
        $this->publishes([
            __DIR__.'/../resources/lang' => resource_path('lang/vendor/vtlabs_doctor'),
        ], 'translations');

        $this->loadMigrationsFrom(__DIR__.'/../database/migrations');

        $this->loadRoutesFrom(__DIR__.'/../routes/api.php');
    }

    /**
     * Register bindings in the container.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
