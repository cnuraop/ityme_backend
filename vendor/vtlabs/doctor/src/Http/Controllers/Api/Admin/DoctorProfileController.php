<?php

namespace Vtlabs\Doctor\Http\Controllers\Api\Admin;

use Illuminate\Http\Request;
use Vtlabs\Doctor\Models\Hospital;
use Illuminate\Support\Facades\Gate;
use Vtlabs\Core\Services\UserService;
use Vtlabs\Doctor\Models\Availability;
use Vtlabs\Doctor\Filters\DoctorFilter;
use Vtlabs\Doctor\Models\DoctorProfile;
use Vtlabs\Core\Http\Controllers\Controller;
use Vtlabs\Doctor\Http\Resources\Admin\DoctorProfileAdminResource;

class DoctorProfileController extends Controller
{
    public function index(Request $request)
    {
        $request->validate([
            'name' => 'sometimes'
        ]);

        $doctors = DoctorProfile::filter($request->all(), DoctorFilter::class)->ordered();

        return DoctorProfileAdminResource::collection($doctors->paginate());
    }

    public function show(DoctorProfile $doctorprofile, Request $request)
    {
        return new DoctorProfileAdminResource($doctorprofile);
    }

    public function store(Request $request)
    {
        $request->validate([
            'email' => 'required|email|max:255|unique:users',
            'mobile_number' => 'required|unique:users',
            'password' => 'required|min:6',
            'name_translations' => 'required|json|translation',
            'tagline_translations' => 'required|json|translation',
            'details_translations' => 'required|json|translation',
            'is_verified' => 'required|boolean',
            'experience_years' => 'required|numeric',
            'address' => 'sometimes',
            'longitude' => 'sometimes|numeric|min:-180|max:180',
            'latitude' => 'sometimes|numeric|min:-90|max:90',
            'fee' => 'required|numeric',
            'hospitals' => 'required|array|exists:doctor_hospitals,id',
            'degrees' => 'required|array|exists:categories,id',
            'types' => 'required|array|exists:categories,id',
            'services' => 'required|array|exists:categories,id',
            'specializations' => 'required|array|exists:categories,id',
            'availability' => 'required|array',
            'availability.*.days' => 'required|in:sun,mon,tue,wed,thu,fri,sat',
            'availability.*.from' => 'required|date_format:H:i',
            'availability.*.to' => 'required|date_format:H:i',
            'images.*' => 'sometimes|image',
            'profile_image' => 'sometimes|image',
            'meta' => 'sometimes|json|nullable'
        ]);

        request()->merge([
            "name" => request()->input('_name'),
            "tagline" => request()->input('_tagline') ?? null,
            "details" => request()->input('_details') ?? null
        ]);

        if ($request->meta) {
            request()->merge([
                "meta" => json_decode($request->meta)
            ]);
        }

        // create user for doctor first  
        $userName = $request->name[array_keys(($request->name))[0]];
        $userData = collect($request->only(['email', 'mobile_number', 'password']));
        $userData = $userData->merge(['name' => $userName, 'mobile_verified' => 1, 'roles' => ['doctor']]);
        $user = UserService::create($userData);

        $doctorProfile = DoctorProfile::where('user_id', $user->id)->firstOrFail();
        $doctorProfile = $doctorProfile->fill($request->only([
            'name', 'tagline', 'details', 'experience_years', 'address', 'longitude', 'latitude', 'is_verified', 'meta'
        ]));
        $doctorProfile->save();

        // attach hospitals
        $selectedHospitals = [];
        $i = 0;
        foreach ($request->hospitals as $hospital) {
            // @TODO: remove lat/long fields from doctor profile
            // set the doctor's location at his first selected hospital, this will be used for distance sorting purpose
            if ($i == 0) {
                $hospitalRecord = Hospital::find($hospital);
                $doctorProfile->longitude = $hospitalRecord->longitude;
                $doctorProfile->latitude = $hospitalRecord->latitude;
                $doctorProfile->save();
                $i++;
            }

            $selectedHospitals[$hospital]    = ['fee' => $request->fee];
        }
        $doctorProfile->hospitals()->sync($selectedHospitals);

        // attach degrees
        $doctorProfile->degrees()->sync($request->degrees);

        // attach type
        $doctorProfile->types()->sync($request->types);

        // attach services
        $doctorProfile->services()->sync($request->services);

        // attach specializations
        $doctorProfile->specializations()->sync($request->specializations);

        // attach availablities
        $doctorProfile->availabilities()->delete();
        foreach ($request->availability as $availability) {
            Availability::create([
                'doctor_profile_id' => $doctorProfile->id,
                'days' => $availability['days'],
                'from' => $availability['from'],
                'to' => $availability['to']
            ]);
        }

        // images
        if (!empty($request->images)) {
            foreach ($request->images as $image) {
                $doctorProfile->addMedia($image)->toMediaCollection("images");
            }
        }

        if ($request->profile_image) {
            $doctorProfile->user->clearMediaCollection('images');
            $doctorProfile->user->addMedia($request->profile_image)->toMediaCollection("images");
        }

        return new DoctorProfileAdminResource($doctorProfile);
    }

    public function update(DoctorProfile $doctorprofile, Request $request)
    {
        $request->validate([
            'name_translations' => 'required|json|translation',
            'tagline_translations' => 'required|json|translation',
            'details_translations' => 'required|json|translation',
            'is_verified' => 'required|boolean',
            'experience_years' => 'required|numeric',
            'address' => 'sometimes',
            'longitude' => 'sometimes|numeric|min:-180|max:180',
            'latitude' => 'sometimes|numeric|min:-90|max:90',
            'fee' => 'required|numeric',
            'hospitals' => 'required|array|exists:doctor_hospitals,id',
            'degrees' => 'required|array|exists:categories,id',
            'types' => 'required|array|exists:categories,id',
            'services' => 'required|array|exists:categories,id',
            'specializations' => 'required|array|exists:categories,id',
            'availability' => 'required|array',
            'availability.*.days' => 'required|in:sun,mon,tue,wed,thu,fri,sat',
            'availability.*.from' => 'required',
            'availability.*.to' => 'required',
            'images.*' => 'sometimes|image',
            'profile_image' => 'sometimes|image',
            'meta' => 'sometimes|json|nullable'
        ]);

        request()->merge([
            "name" => request()->input('_name'),
            "tagline" => request()->input('_tagline') ?? null,
            "details" => request()->input('_details') ?? null
        ]);

        if ($request->meta) {
            request()->merge([
                "meta" => json_decode($request->meta)
            ]);
        }

        $doctorprofile->fill($request->only([
            'name', 'tagline', 'details', 'experience_years', 'address', 'longitude', 'latitude', 'is_verified', 'meta'
        ]));

        $doctorprofile->save();

        // attach hospitals
        $selectedHospitals = [];
        $i = 0;
        foreach ($request->hospitals as $hospital) {

            // @TODO: remove lat/long fields from doctor profile
            // set the doctor's location at his first selected hospital, this will be used for distance sorting purpose
            if ($i == 0) {
                $hospitalRecord = Hospital::find($hospital);
                $doctorprofile->longitude = $hospitalRecord->longitude;
                $doctorprofile->latitude = $hospitalRecord->latitude;
                $doctorprofile->save();
                $i++;
            }

            $selectedHospitals[$hospital] = ['fee' => $request->fee];
        }
        $doctorprofile->hospitals()->sync($selectedHospitals);

        // attach degrees
        $doctorprofile->degrees()->sync($request->degrees);

        // attach type
        $doctorprofile->types()->sync($request->types);

        // attach services
        $doctorprofile->services()->sync($request->services);

        // attach specializations
        $doctorprofile->specializations()->sync($request->specializations);

        // attach availablities
        $doctorprofile->availabilities()->delete();
        foreach ($request->availability as $availability) {
            Availability::create([
                'doctor_profile_id' => $doctorprofile->id,
                'days' => $availability['days'],
                'from' => $availability['from'],
                'to' => $availability['to']
            ]);
        }

        // images
        if (!empty($request->images)) {
            $doctorprofile->clearMediaCollection('images');
            foreach ($request->images as $image) {
                $doctorprofile->addMedia($image)->toMediaCollection("images");
            }
        }

        if ($request->profile_image) {
            $doctorprofile->user->clearMediaCollection('images');
            $doctorprofile->user->addMedia($request->profile_image)->toMediaCollection("images");
        }

        return new DoctorProfileAdminResource($doctorprofile);
    }

    public function destroy(DoctorProfile $doctorprofile)
    {
        Gate::authorize('delete');

        $doctorprofile->delete();

        return response()->json([], 200);
    }
}
