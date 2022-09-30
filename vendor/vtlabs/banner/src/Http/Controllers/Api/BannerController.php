<?php

namespace Vtlabs\Banner\Http\Controllers\Api;

use Illuminate\Http\Request;
use Vtlabs\Banner\Models\Banner;
use Vtlabs\Banner\Filters\BannerFilter;
use Vtlabs\Core\Http\Controllers\Controller;
use Vtlabs\Banner\Http\Resources\BannerResource;

class BannerController extends Controller
{
    public function index(Request $request)
    {
        $request->validate([
            'pagination' => 'sometimes|boolean',
            'scope' => 'sometimes|string'
        ]);

        $banners = Banner::filter($request->all(), bannerFilter::class)->ordered();
        
        if($request->pagination == '0') {
            $banners = $banners->get();
        } else {
            $banners = $banners->paginate();
        }
        
        return BannerResource::collection($banners);
    }
}
