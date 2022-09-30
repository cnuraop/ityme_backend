<?php

namespace Vtlabs\Artisan\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Artisan;

class Setup extends Command
{
    /**
    * The name and signature of the console command.
    *
    * @var string
    */
    protected $signature = 'setup:install';
    
    /**
    * The console command description.
    *
    * @var string
    */
    protected $description = 'Vtlabs laravel setup';

    protected $commands = [
        "key:generate",
        "migrate:fresh",
        "db:seed",
        "passport:install",
        "storage:link"
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
