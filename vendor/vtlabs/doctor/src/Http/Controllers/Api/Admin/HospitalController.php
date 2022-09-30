<?php

namespace Vtlabs\Doctor\Http\Controllers\Api\Admin;

use Illuminate\Http\Request;
use Vtlabs\Doctor\Models\Hospital;
use Illuminate\Support\Facades\Gate;
use Illuminate\Validation\Rule;
use Vtlabs\Doctor\Models\Availability;
use Vtlabs\Doctor\Filters\HospitalFilter;
use Vtlabs\Core\Http\Controllers\Controller;
use Vtlabs\Doctor\Models\HospitalAvailability;
use Vtlabs\Doctor\Http\Resources\Admin\HospitalAdminResource;

class HospitalController extends Controller
{
    public function index(Request $request)
    {
        $request->validate([
            'name' => 'sometimes',
            'pagination' => 'sometimes|boolean',
        ]);

        $hospitals = Hospital::filter($request->all(), HospitalFilter::class)->ordered();

        if ($request->pagination == '0') {
            $hospitals = $hospitals->get();
        } else {
            $hospitals = $hospitals->paginate();
        }

        return HospitalAdminResource::collection($hospitals);
    }

    public function store(Request $request)
    {
        $request->validate([
            'name_translations' => 'required|json|translation',
            'tagline_translations' => 'required|json|translation',
            'details_translations' => 'required|json|translation',
            'slug' => 'required|slug|unique:doctor_hospitals',
            'sort_order' => 'required',
            'facilities' => 'sometimes',
            'meta' => 'sometimes|json|nullable',
            'images.*' => 'sometimes|image',
            'address' => 'sometimes|string',
            'longitude' => 'sometimes|numeric|min:-180|max:180',
            'latitude' => 'sometimes|numeric|min:-90|max:90',
            'services' => 'required|array|exists:categories,id',
            'categories' => 'required|array|exists:categories,id',
            'availability' => 'required|array',
            'availability.*.days' => 'required|in:sun,mon,tue,wed,thu,fri,sat',
            'availability.*.from' => 'required|date_format:H:i',
            'availability.*.to' => 'required|date_format:H:i',
        ]);

        request()->merge([
            "name" => request()->input('_name'),
            "tagline" => request()->input('_tagline'),
            "details" => request()->input('_details')
        ]);

        if ($request->meta) {
            request()->merge([
                "meta" => json_decode($request->meta)
            ]);
        }

        $hospital = Hospital::create($request->only([
            'name', 'tagline', 'details', 'slug', 'sort_order', 'meta', 'address',
            'longitude', 'latitude', 'facilities'
        ]));

        // images
        if (!empty($request->images)) {
            foreach ($request->images as $image) {
                $hospital->addMedia($image)->toMediaCollection("images");
            }
        }

        if ($request->services) {
            // attach services
            $hospital->services()->sync($request->services);
        }

        if ($request->categories) {
            // attach categories
            $hospital->categories()->sync($request->categories);
        }

        if ($request->availability) {
            // attach availablities
            $hospital->availabilities()->delete();
            foreach ($request->availability as $availability) {
                HospitalAvailability::create([
                    'hospital_id' => $hospital->id,
                    'days' => $availability['days'],
                    'from' => $availability['from'],
                    'to' => $availability['to']
                ]);
            }
        }


        return new HospitalAdminResource($hospital->fresh());
    }

    public function show(Hospital $hospital)
    {
        return new HospitalAdminResource($hospital);
    }

    public function update(Hospital $hospital, Request $request)
    {
        $request->validate([
            'name_translations' => 'required|json|translation',
            'tagline_translations' => 'required|json|translation',
            'details_translations' => 'required|json|translation',
            'slug' => ['required', 'slug', Rule::unique('doctor_hospitals')->ignore($hospital->id)],
            'sort_order' => 'required',
            'facilities' => 'sometimes',
            'meta' => 'sometimes|json|nullable',
            'images.*' => 'sometimes|image',
            'address' => 'sometimes|string',
            'longitude' => 'sometimes|numeric|min:-180|max:180',
            'latitude' => 'sometimes|numeric|min:-90|max:90',
            'services' => 'required|array|exists:categories,id',
            'categories' => 'required|array|exists:categories,id',
            'availability' => 'required|array',
            'availability.*.days' => 'required|in:sun,mon,tue,wed,thu,fri,sat',
            'availability.*.from' => 'required',
            'availability.*.to' => 'required',
        ]);

        request()->merge([
            "name" => request()->input('_name'),
            "tagline" => request()->input('_tagline'),
            "details" => request()->input('_details')
        ]);

        if ($request->meta) {
            request()->merge([
                "meta" => json_decode($request->meta)
            ]);
        }

        $hospital->fill($request->only([
            'name', 'tagline', 'details', 'slug', 'sort_order', 'meta', 'address',
            'longitude', 'latitude', 'facilities'
        ]));
        $hospital->save();

        // images
        if (!empty($request->images)) {
            $hospital->clearMediaCollection('images');
            foreach ($request->images as $image) {
                $hospital->addMedia($image)->toMediaCollection("images");
            }
        }

        if ($request->services) {
            // attach services
            $hospital->services()->sync($request->services);
        }

        if ($request->categories) {
            // attach categories
            $hospital->categories()->sync($request->categories);
        }

        if ($request->availability) {
            // attach availablities
            $hospital->availabilities()->delete();
            foreach ($request->availability as $availability) {
                HospitalAvailability::create([
                    'hospital_id' => $hospital->id,
                    'days' => $availability['days'],
                    'from' => $availability['from'],
                    'to' => $availability['to']
                ]);
            }
        }

        return new HospitalAdminResource($hospital->fresh());
    }

    public function destroy(Hospital $hospital)
    {
        Gate::authorize('delete');

        $hospital->delete();

        return response()->json([], 200);
    }
}
