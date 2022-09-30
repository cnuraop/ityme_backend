<?php

namespace Vtlabs\Support\Http\Controllers;

use Illuminate\Http\Request;
use Vtlabs\Core\Helpers\CoreHelper;
use Vtlabs\Support\Models\Support;
use Vtlabs\Core\Http\Controllers\Controller;

class SupportController extends Controller
{
    /**
     * Create support request
     * 
     * @bodyParam  name string required Name
     * @bodyParam  email string required Email address
     * @bodyParam  message string required Message
     * 
     * @response []
     */
    public function index(Request $request)
    {
        $settings = CoreHelper::settingsAsDictionary();
        return view('vendor.support.layouts.default', ['settings' => $settings]);
    }
}
