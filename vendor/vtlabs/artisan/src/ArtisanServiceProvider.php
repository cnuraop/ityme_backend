<?php

namespace Vtlabs\Artisan;

use Illuminate\Support\ServiceProvider;
use Vtlabs\Artisan\Console\Commands\Setup;
use Vtlabs\Artisan\Console\Commands\Validate;
use Vtlabs\Artisan\Console\Commands\CacheClear;

class ArtisanServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        $this->loadRoutesFrom(__DIR__.'/../routes/api.php');
    }

    /**
     * Register bindings in the container.
     *
     * @return void
     */
    public function register()
    {
        $this->registerCommands();
    }

    protected function registerCommands(): void
    {
        $this->commands([
            Setup::class,
            Validate::class,
            CacheClear::class
        ]);
    }
}