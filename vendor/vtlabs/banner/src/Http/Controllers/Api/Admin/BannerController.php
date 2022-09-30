<?php

namespace Vtlabs\Banner\Http\Controllers\Api\Admin;

use Illuminate\Http\Request;
use Vtlabs\Banner\Models\Banner;
use Illuminate\Support\Facades\Gate;
use Vtlabs\Banner\Filters\BannerFilter;
use Vtlabs\Core\Http\Controllers\Controller;
use Vtlabs\Banner\Http\Resources\Admin\BannerAdminResource;

class BannerController extends Controller
{
    public function index(Request $request)
    {
        $request->validate([
            'pagination' => 'sometimes|boolean',
            'title' => 'sometimes|string',
            'scope' => 'sometimes|string'
        ]);

        $banners = Banner::filter($request->all(), bannerFilter::class);

        if ($request->pagination == '0') {
            $banners = $banners->get();
        } else {
            $banners = $banners->paginate();
        }
        return BannerAdminResource::collection($banners);
    }

    public function store(Request $request)
    {
        $request->validate([
            'title_translations' => 'required|translation',
            'meta' => 'sometimes|json|nullable',
            'image' => 'sometimes|image',
            'parent_id' => 'sometimes|exists:banners,id',
            'sort_order' => 'sometimes',
        ]);

        request()->merge([
            "title" => request()->input('_title')
        ]);

        if ($request->meta) {
            request()->merge([
                "meta" => json_decode($request->meta)
            ]);
        }

        $banner = Banner::create($request->only(['title', 'meta', 'parent_id', 'sort_order']));

        if ($request->image) {
            $banner->addMedia($request->image)->toMediaCollection("images");
        }

        return new BannerAdminResource($banner->fresh());
    }

    public function show($id)
    {
        return new BannerAdminResource(Banner::find($id));
    }

    public function update(Request $request, $id)
    {
        $banner = Banner::findOrFail($id);

        $request->validate([
            'title_translations' => 'required|translation',
            'meta' => 'sometimes|json|nullable',
            'image' => 'sometimes|image',
            'parent_id' => 'sometimes|exists:banners,id|nullable',
            'sort_order' => 'sometimes',
        ]);

        request()->merge([
            "title" => request()->input('_title')
        ]);

        if ($request->meta) {
            request()->merge([
                "meta" => json_decode($request->meta)
            ]);
        }

        $banner->fill($request->only(['title', 'meta', 'parent_id', 'sort_order']));
        $banner->save();

        if ($request->image) {
            $banner->clearMediaCollection("images");
            $banner->addMedia($request->image)->toMediaCollection("images");
        }

        return new BannerAdminResource($banner->fresh());
    }

    public function destroy($id)
    {
        Gate::authorize('delete');

        Banner::findOrFail($id)->delete();

        return response()->json([], 200);
    }
}
