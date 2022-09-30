<?php

namespace Vtlabs\Support\Http\Controllers\Api\Admin;

use Illuminate\Http\Request;
use Vtlabs\Support\Models\Support;
use Illuminate\Support\Facades\Gate;
use Vtlabs\Core\Http\Controllers\Controller;
use Vtlabs\Support\Http\Resources\Admin\SupportAdminResource;

class SupportController extends Controller
{
    public function index(Request $request)
    {
        return SupportAdminResource::collection(Support::ordered()->paginate());
    }

    public function destroy(Support $support)
    {
        Gate::authorize('delete');

        $support->delete();

        return response()->json([], 200);
    }
}
