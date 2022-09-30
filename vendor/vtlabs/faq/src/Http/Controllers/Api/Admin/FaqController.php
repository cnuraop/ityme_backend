<?php

namespace Vtlabs\Faq\Http\Controllers\Api\Admin;

use Vtlabs\Faq\Models\Faq;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;
use Vtlabs\Core\Http\Controllers\Controller;
use Vtlabs\Faq\Http\Resources\Admin\FaqAdminResource;

class FaqController extends Controller
{
    public function index(Request $request)
    {
        return FaqAdminResource::collection(Faq::ordered()->paginate());
    }

    public function show(Faq $faq)
    {
        return new FaqAdminResource($faq);
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required',
            'short_description' => 'required',
            'description' => 'required',
        ]);

        $faq = Faq::create($request->all());

        return new FaqAdminResource($faq);
    }

    public function update(Request $request, Faq $faq)
    {
        $request->validate([
            'title' => 'required|max:255',
            'short_description' => 'required|max:255',
            'description' => 'required|max:500',
        ]);

        $faq->fill($request->all());
        $faq->save();

        return new FaqAdminResource($faq);
    }

    public function destroy(Faq $faq)
    {
        Gate::authorize('delete');
        
        $faq->delete();

        return response()->json([], 204);
    }
}
