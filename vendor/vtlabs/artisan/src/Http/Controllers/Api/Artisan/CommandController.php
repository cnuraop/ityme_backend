<?php

namespace Vtlabs\Artisan\Http\Controllers\Api\Artisan;

use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Artisan;
use Symfony\Component\Console\Output\BufferedOutput;

class CommandController extends Controller
{
    public function command(Request $request)
    {
        $exitCode = 1;
        $message = "Command failed";

        try {
            $output = new BufferedOutput; 
            $exitCode = Artisan::call($request->command, [], $output);
            $message = $output->fetch();
        } catch(\Exception $ex) {
            $exitCode = 1;
            $message = $ex->getMessage();
        }
        return response()->json(["exit_code" => $exitCode, "message" => $message]);
    }
}
