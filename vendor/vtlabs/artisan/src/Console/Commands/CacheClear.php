<?php

namespace Vtlabs\Artisan\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Artisan;

class CacheClear extends Command
{
    /**
    * The name and signature of the console command.
    *
    * @var string
    */
    protected $signature = 'setup:cacheclear';
    
    /**
    * The console command description.
    *
    * @var string
    */
    protected $description = 'Vtlabs laravel clear all cache';

    protected $commands = [
        "cache:clear",
        "route:clear",
        "view:clear",
        "config:clear"
    ];
    
    /**
    * Create a new command instance.
    *
    * @return void
    */
    public function __construct()
    {
        parent::__construct();
    }
    
    /**
    * Execute the console command.
    *
    * @return mixed
    */
    public function handle()
    {
        try {
            foreach($this->commands as $command) {
                if(in_array($command, array_keys(Artisan::all()))) {
                    $exitCode = Artisan::call($command);
                    // success is 0, failure is non zero
                    if($exitCode) {
                        throw new \Exception($command . " Failed");
                    }
                }                
            }
        } catch(\Exception $ex) {
            $this->error($ex->getMessage());
            return 1;
        }
        
        return 0;
    }
}
