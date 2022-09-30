<?php

namespace Vtlabs\Doctor\Http\Controllers\Api;

use Illuminate\Http\Request;
use Vtlabs\Core\Models\User\User;
use Illuminate\Support\Facades\DB;
use Vtlabs\Doctor\Models\Hospital;
use Illuminate\Support\Facades\Auth;
use Vtlabs\Doctor\Filters\HospitalFilter;
use Illuminate\Contracts\Auth\Access\Gate;
use Vtlabs\Core\Http\Controllers\Controller;
use Vtlabs\Doctor\Http\Resources\HospitalResource;
use Vtlabs\Doctor\Http\Resources\HospitalRatingResource;

class HospitalController extends Controller
{
    public function __construct(Gate $gate)
    {
        if (array_key_exists('HTTP_AUTHORIZATION', $_SERVER)) {
            $this->middleware('auth:api');
        }
    }
    
    public function index(Request $request)
    {
        $request->validate([
            'name' => 'sometimes',
            'pagination' => 'sometimes|boolean',
        ]);

        $hospitals = Hospital::filter($request->all(), HospitalFilter::class);

        if ($request->pagination == '0') {
            $hospitals = $hospitals->get();
        } else {
            $hospitals = $hospitals->paginate();
        }

        return HospitalResource::collection($hospitals);
    }

    public function ratingList(Hospital $hospital, Request $request)
    {
        return HospitalRatingResource::collection($hospital->raters(User::class)->orderByDesc('pivot_created_at')->paginate());
    }

    public function ratingStore(Hospital $hospital, Request $request)
    {
        $request->validate([
            'rating' => 'required|numeric',
            'review' => 'required'
        ]);

        $user = Auth::user();

        // $user->unrate($hospital);
        $user->rate($hospital, $request->rating, $request->review);

        return response()->json([], 200);
    }

    public function ratingSummary(Hospital $hospital)
    {
        return response()->json([
            "average_rating" => $hospital->averageRating(User::class),
            "total_ratings" => $hospital->raters(User::class)->count(),
            "summary" => DB::table('ratings')->selectRaw('count(*) as total, ROUND(rating) as rounded_rating')
                ->where('rateable_type', Hospital::class)
                ->where('rateable_id', $hospital->id)
                ->where('rater_type', User::class)
                ->groupBy('rounded_rating')
                ->get()
        ]);
    }

    public function favourites(Request $request)
    {
        return HospitalResource::collection(Auth::user()->favorite(Hospital::class)->flatten());
    }

    public function toggleFavourite(Hospital $hospital)
    {
        $hospital->toggleFavorite();

        return response()->json([]);
    }
}