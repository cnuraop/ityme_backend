<?php

namespace Vtlabs\Doctor\Http\Controllers\Api;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Vtlabs\Core\Models\User\User;
use Illuminate\Support\Facades\DB;
use Vtlabs\Core\Helpers\CoreHelper;
use Illuminate\Support\Facades\Auth;
use Vtlabs\Doctor\Models\Availability;
use Vtlabs\Doctor\Filters\DoctorFilter;
use Vtlabs\Doctor\Models\DoctorProfile;
use Illuminate\Contracts\Auth\Access\Gate;
use Vtlabs\Appointment\Models\Appointment;
use Vtlabs\Core\Http\Controllers\Controller;
use Vtlabs\Doctor\Http\Resources\DoctorRatingResource;
use Vtlabs\Doctor\Http\Resources\DoctorProfileResource;
use Vtlabs\Doctor\Models\Hospital;

class DoctorProfileController extends Controller
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
            'search' => 'sometimes',
            'specialization' => 'sometimes|exists:categories,id',
            'degree' => 'sometimes|exists:categories,id',
            'type' => 'sometimes|exists:categories,id',
            'service' => 'sometimes|exists:categories,id',
            'hospital' => 'sometimes|exists:doctor_hospitals,id',
            'lat' => 'sometimes|numeric',
            'long' => 'sometimes|numeric'
        ]);

        $doctors = DoctorProfile::filter($request->all(), DoctorFilter::class)->ordered();

        return DoctorProfileResource::collection($doctors->paginate());
    }

    public function show(DoctorProfile $profile, Request $request)
    {
        return new DoctorProfileResource($profile);
    }

    public function showMyProfile(Request $request)
    {
        $doctorProfile = DoctorProfile::findByUser(Auth::user()->id);
        return new DoctorProfileResource($doctorProfile);
    }

    public function update(Request $request)
    {
        $request->validate([
            'name' => 'required|string',
            'tagline' => 'sometimes|string',
            'details' => 'sometimes|string',
            'experience_years' => 'sometimes|numeric',
            'address' => 'sometimes',
            'longitude' => 'sometimes|numeric|min:-180|max:180',
            'latitude' => 'sometimes|numeric|min:-90|max:90',
            'hospitals' => 'sometimes|array',
            'hospitals.*.id' => 'sometimes|exists:doctor_hospitals,id',
            'hospitals.*.fee' => 'sometimes|numeric',
            'degrees' => 'sometimes|array|exists:categories,id',
            'types' => 'sometimes|array|exists:categories,id',
            'services' => 'sometimes|array|exists:categories,id',
            'specializations' => 'sometimes|array|exists:categories,id',
            'availability' => 'sometimes|array',
            'availability.*.days' => 'required|in:sun,mon,tue,wed,thu,fri,sat',
            'availability.*.from' => 'required|date_format:H:i',
            'availability.*.to' => 'required|date_format:H:i',
            'image_urls' => 'sometimes|array',
        ]);

        $request->merge([
            "meta" => $request->meta ? json_decode($request->meta) : null
        ]);

        $doctorProfile = DoctorProfile::findByUser(Auth::user()->id);

        $doctorProfile->fill($request->only(['experience_years', 'address', 'longitude', 'latitude', 'meta']));

        CoreHelper::fillTranslation($doctorProfile, $request->only(['name', 'tagline', 'details']));

        $doctorProfile->save();

        // attach hospitals
        if ($request->hospitals) {
            $selectedHospitals = [];
            $i = 0;
            foreach ($request->hospitals as $hospital) {
                // @TODO: remove lat/long fields from doctor profile
                if ($i == 0) {
                    $hospitalRecord = Hospital::find($hospital['id']);
                    $doctorProfile->longitude = $hospitalRecord->longitude;
                    $doctorProfile->latitude = $hospitalRecord->latitude;
                    $doctorProfile->save();
                    $i++;
                }
                $selectedHospitals[$hospital['id']] = ['fee' => $hospital['fee']];
            }
            $doctorProfile->hospitals()->sync($selectedHospitals);
        }

        // attach degrees
        if ($request->degrees) {
            $doctorProfile->degrees()->sync($request->degrees);
        }

        // attach type
        if ($request->types) {
            $doctorProfile->types()->sync($request->types);
        }

        // attach services
        if ($request->services) {
            $doctorProfile->services()->sync($request->services);
        }

        // attach specializations
        if ($request->specializations) {
            $doctorProfile->specializations()->sync($request->specializations);
        }

        // attach availablities
        if ($request->availability) {
            $doctorProfile->availabilities()->delete();
            foreach ($request->availability as $availability) {
                Availability::create([
                    'doctor_profile_id' => $doctorProfile->id,
                    'days' => $availability['days'],
                    'from' => $availability['from'],
                    'to' => $availability['to']
                ]);
            }
        }

        // images
        if (!empty($request->image_urls)) {
            $newMediaItems = [];
            foreach ($request->image_urls as $imageUrl) {
                $newMediaItems[] = $doctorProfile->addMediaFromUrl($imageUrl)->toMediaCollection("images");
            }
            $doctorProfile->clearMediaCollectionExcept('images', $newMediaItems);
        }

        return new DoctorProfileResource($doctorProfile);
    }

    public function ratingList(DoctorProfile $doctor, Request $request)
    {
        return DoctorRatingResource::collection($doctor->raters(User::class)->orderByDesc('pivot_created_at')->paginate());
    }

    public function ratingStore(DoctorProfile $doctor, Request $request)
    {
        $request->validate([
            'rating' => 'required|numeric',
            'review' => 'required'
        ]);

        $user = Auth::user();

        $user->rate($doctor, $request->rating, $request->review);

        return response()->json([], 200);
    }

    public function ratingSummary(DoctorProfile $doctor)
    {
        return response()->json([
            "average_rating" => $doctor->averageRating(User::class),
            "total_ratings" => $doctor->raters(User::class)->count(),
            "summary" => DB::table('ratings')->selectRaw('count(*) as total, ROUND(rating) as rounded_rating')
                ->where('rateable_type', DoctorProfile::class)
                ->where('rateable_id', $doctor->id)
                ->where('rater_type', User::class)
                ->groupBy('rounded_rating')
                ->get()
        ]);
    }

    public function favourites(Request $request)
    {
        return DoctorProfileResource::collection(Auth::user()->favorite(DoctorProfile::class)->flatten());
    }

    public function toggleFavourite(DoctorProfile $doctor)
    {
        $doctor->toggleFavorite();

        return response()->json([]);
    }

    public function schedule(DoctorProfile $doctor, Request $request)
    {
        $request->validate([
            'days' => 'required|numeric',
            'start_from' => 'required|date_format:Y-m-d'
        ]);

        $settings = CoreHelper::settingsAsDictionary();

        if (isset($settings['schedule_interval_in_minutes'])) {
            $schedule = [];
            $interval = $settings['schedule_interval_in_minutes'];
            $dayWiseAvailability = $this->mapAvailabilityToDay($doctor->availabilities);

            $daysPeriod = Carbon::parse($request->start_from)->daysUntil($request->days);

            foreach ($daysPeriod as $date) {
                if (!isset($dayWiseAvailability[strtolower($date->shortEnglishDayOfWeek)])) {
                    continue;
                }

                $timeFrom = $dayWiseAvailability[strtolower($date->shortEnglishDayOfWeek)]['from'];
                $timeTo = $dayWiseAvailability[strtolower($date->shortEnglishDayOfWeek)]['to'];

                if ($timeFrom && $timeTo) {
                    $timePeriod = Carbon::parse($date->format('Y-m-d') . ' ' . $timeFrom)->minutesUntil($date->format('Y-m-d') . ' ' . $timeTo, $interval);
                    foreach ($timePeriod as $time) {
                        $isScheduled = Appointment::where('date', $time->format('Y-m-d'))->where('time_from', $time->format('H:i'))->exists();
                        $schedule[] = ['time' => $time->format('Y-m-d H:i'), 'is_scheduled' => $isScheduled];
                    }
                }
            }
            return response()->json(['schedule' => $schedule]);
        }

        return response()->json(['message' => 'Setting not set'], 400);
    }

    private function mapAvailabilityToDay($availabilities)
    {
        $availabilityMap = [];
        foreach ($availabilities as $availability) {
            $availabilityMap[$availability['days']] = ['from' => $availability['from'], 'to' => $availability['to']];
        }

        return $availabilityMap;
    }
}
