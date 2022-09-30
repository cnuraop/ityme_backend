<?php

namespace Vtlabs\Category;

use Illuminate\Support\ServiceProvider;

class CategoryServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        $this->publishes([
            __DIR__.'/../config/vtlabs_category.php' => config_path('vtlabs_category.php'),
        ], 'config');

        $this->loadMigrationsFrom(__DIR__.'/../database/migrations');

        $this->loadRoutesFrom(__DIR__.'/../routes/api.php');

        // api responses
        $this->publishes([
            __DIR__.'/../storage/responses' => storage_path('responses'),
        ], 'api_response');

        // assets
        $this->publishes([
            __DIR__.'/../assets' => public_path('assets/vendor/category/'),
        ], 'public');
    }

    /**
     * Register bindings in the container.
     *
     * @return void
     */
    public function register()
    {
    }
}