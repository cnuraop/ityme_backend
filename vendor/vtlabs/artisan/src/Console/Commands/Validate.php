<?php

namespace Vtlabs\Artisan\Console\Commands;

use DB;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Artisan;

class Validate extends Command
{
    /**
    * The name and signature of the console command.
    *
    * @var string
    */
    protected $signature = 'setup:validate';
    
    /**
    * The console command description.
    *
    * @var string
    */
    protected $description = 'Vtlabs installation validator';
    
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
            // validate database connection
            DB::connection()->getPdo();
        } catch(\Exception $ex) {
            $this->error($ex->getMessage());
            return 1;
        }
        
        return 0;
    }
}
