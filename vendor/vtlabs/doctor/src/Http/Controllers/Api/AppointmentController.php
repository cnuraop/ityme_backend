<?php

namespace Vtlabs\Doctor\Http\Controllers\Api;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Vtlabs\Doctor\Models\DoctorProfile;
use Vtlabs\Doctor\Events\NewAppointment;
use Vtlabs\Appointment\Models\Appointment;
use Vtlabs\Doctor\Events\UpdateAppointment;
use Vtlabs\Core\Http\Controllers\Controller;
use Vtlabs\Doctor\Filters\AppointmentFilter;
use Vtlabs\Appointment\Services\AppointmentService;
use Vtlabs\Doctor\Http\Resources\AppointmentResource;

class AppointmentController extends Controller
{
    public function index(Request $request)
    {
        $request->validate([
            'appointer' => 'required_without:appointee|exists:users,id',
            'appointee' => 'required_without:appointer|exists:doctor_profiles,id'
        ]);

        $appointments = Appointment::filter($request->all(), AppointmentFilter::class)->orderBy('date', 'desc');

        return AppointmentResource::collection($appointments->paginate());
    }

    public function store(DoctorProfile $doctorProfile, Request $request)
    {
        $user = Auth::user();

        $request->validate(AppointmentService::validationRules());

        $appointment = $user->appoint($doctorProfile, $request->all());

        event(new NewAppointment($appointment));

        return new AppointmentResource($appointment);
    }

    public function update(Appointment $appointment, Request $request)
    {
        $request->validate([
            'status' => ['required', Rule::in(config('vtlabs_appointment.appointment.status_list'))]
        ]);

        AppointmentService::updateStatus($appointment, $request->status);

        event(new UpdateAppointment($appointment));

        return new AppointmentResource($appointment->fresh());
    }

    public function appointmentSummary(DoctorProfile $doctorProfile, Request $request)
    {
        $request->validate([
            'duration' => 'required|in:hours,days,months,years',
            'limit' => 'required|numeric'
        ]);

        $appointments = Appointment::where('appointee_id', $doctorProfile->id)->where('appointee_type', DoctorProfile::class);

        $appointmentsForCount = clone $appointments;

        if ($request->duration == 'hours') {
            $appointments = $appointments->select(DB::raw('HOUR(created_at) as period'), DB::raw('count(*) as total'))
                ->whereDate('created_at', '>', Carbon::now()->subdays(1))
                ->whereDate('created_at', '<=', Carbon::now())
                ->groupBy(DB::raw('HOUR(created_at)'));
        }

        if ($request->duration == 'days') {
            $appointments = $appointments->select(DB::raw('DATE(created_at) as period'), DB::raw('count(*) as total'))
                ->whereDate('created_at', '>', Carbon::now()->subDays($request->limit))
                ->whereDate('created_at', '<=', Carbon::now())
                ->groupBy(DB::raw('DATE(created_at)'));
        }

        if ($request->duration == 'months') {
            $appointments = $appointments->select(DB::raw('MONTH(created_at) as period'), DB::raw('count(*) as total'))
                ->whereDate('created_at', '>', Carbon::now()->subDays($request->limit * 30))
                ->whereDate('created_at', '<=', Carbon::now())
                ->groupBy(DB::raw('MONTH(created_at)'));
        }

        if ($request->duration == 'years') {
            $appointments = $appointments->select(DB::raw('YEAR(created_at) as period'), DB::raw('count(*) as total'))
                ->whereDate('created_at', '>', Carbon::now()->subDays($request->limit * 365))
                ->whereDate('created_at', '<=', Carbon::now())
                ->groupBy(DB::raw('YEAR(created_at)'));
        }

        return response([
            "appointments_count" => $appointmentsForCount->filter(['duration' => $request->duration], AppointmentFilter::class)->count(),
            'appointments_chart_data' => $appointments->get()
        ]);
    }
}