<?php

namespace Vtlabs\Faq;

use Illuminate\Support\ServiceProvider;

class FaqServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        $this->publishes([
            __DIR__.'/../config/vtlabs_faq.php' => config_path('vtlabs_faq.php'),
        ], 'config');

        $this->loadMigrationsFrom(__DIR__.'/../database/migrations');

        $this->loadRoutesFrom(__DIR__.'/../routes/api.php');

        // api responses
        $this->publishes([
            __DIR__.'/../storage/responses' => storage_path('responses'),
        ], 'api_response');
    }
}
