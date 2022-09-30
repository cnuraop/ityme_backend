<?php

namespace Vtlabs\Doctor\Http\Controllers\Api\Admin;

use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Gate;
use Vtlabs\Appointment\Models\Appointment;
use Vtlabs\Doctor\Events\UpdateAppointment;
use Vtlabs\Core\Http\Controllers\Controller;
use Vtlabs\Doctor\Filters\AppointmentFilter;
use Vtlabs\Appointment\Services\AppointmentService;
use Vtlabs\Doctor\Http\Resources\Admin\AppointmentAdminResource;

class AppointmentController extends Controller
{
    public function index(Request $request)
    {
        $request->validate([]);

        $appointments = Appointment::filter($request->all(), AppointmentFilter::class)->orderBy('date', 'desc');

        return AppointmentAdminResource::collection($appointments->paginate());
    }

    public function show(Appointment $appointment)
    {
        return new AppointmentAdminResource($appointment);
    }

    public function update(Appointment $appointment, Request $request)
    {
        $request->validate([
            'status' => ['required', Rule::in(config('vtlabs_appointment.appointment.status_list'))]
        ]);

        AppointmentService::updateStatus($appointment, $request->status);

        event(new UpdateAppointment($appointment));

        return new AppointmentAdminResource($appointment->fresh());
    }

    public function destroy(Appointment $appointment)
    {
        Gate::authorize('delete');

        $appointment->delete();

        return response()->json([], 200);
    }
}
