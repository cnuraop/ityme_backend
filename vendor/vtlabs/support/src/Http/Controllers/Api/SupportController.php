<?php

namespace Vtlabs\Support\Http\Controllers\Api;

use Illuminate\Http\Request;
use Vtlabs\Support\Models\Support;
use Vtlabs\Core\Http\Controllers\Controller;

/**
 * @group Support
 *
 * APIs for support requests
 */
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
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string',
            'email' => 'required|email',
            'message' => 'required|string'
        ]);

        $support = Support::create($request->only(['name', 'email', 'message']));
        $support->save();
        
        return response()->json((object)[]);
    }
}
