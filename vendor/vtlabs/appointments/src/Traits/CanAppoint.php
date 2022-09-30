<?php

namespace Vtlabs\Appointment\Traits;

use InvalidArgumentException;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Validator;
use Vtlabs\Appointment\Models\Appointment;
use Vtlabs\Appointment\Contracts\Appointee;
use Illuminate\Validation\ValidationException;
use Vtlabs\Appointment\Services\AppointmentService;

trait CanAppoint
{
    /**
     *  Appointment of certain model.
     */
    public function appointments(Model $model): ?Model
    {
        $modelClass = (new $model)->getMorphClass();

        return $this->morphMany(Appointment::class, 'appointer')
            ->where('appointee_type', $modelClass)
            ->where('appointee_id', $model->getKey())->first();
    }

    /**
     * Appoint a certain model.
     * 
     * @throws InvalidArgumentException if the model is not of type Appointee
     * @throws ValidationException if attributes validation fails
     */
    public function appoint(Model $model, $attributes): Model
    {
        if (!$model instanceof Appointee) {
            throw new InvalidArgumentException("Must be a type of Appointee");
        }

        $this->validateAppointmentRequest($model, $attributes);

        $appointment = Appointment::create([
            'appointer_id' => $this->getKey(),
            'appointer_type' => $this->getMorphClass(),
            'appointee_type' => $model->getMorphClass(),
            'appointee_id' => $model->getKey(),
            'amount' => $attributes['amount'],
            'address' => $attributes['address'] ?? null,
            'longitude' => $attributes['longitude'] ?? 0.0,
            'latitude' => $attributes['latitude'] ?? 0.0,
            'date' => $attributes['date'],
            'time_from' => $attributes['time_from'],
            'time_to' => $attributes['time_to'],
            'meta' => isset($attributes['meta']) ? json_decode($attributes['meta']) : null
        ]);

        // payment
        $paymentMethodSlug = $attributes['payment_method_slug'] ?? 'cod';
        $this->createPayment($appointment, $attributes['amount'], $paymentMethodSlug);

        return $appointment;
    }

    /**
     * Validator for appointment request
     * 
     * @throws ValidationException if attributes validation fails
     */
    public function validateAppointmentRequest(Model $model, array $attributes)
    {
        $validator = Validator::make($attributes, AppointmentService::validationRules());

        if ($validator->fails()) {
            throw new ValidationException($validator);
        }

        // this controls how many duplicate slots can be booked i.e no. of appointments at same time
        $duplicateSlotsAllowed = !empty($attributes['duplicate_slots_allowed']) ? $attributes['duplicate_slots_allowed'] : 0;
        
        $appointerSlotsCount = Appointment::where('time_from', $attributes['time_from'])->where('date', $attributes['date'])->where('appointer_id', $this->getKey())->count();
        $appointeeSlotsCount = Appointment::where('time_from', $attributes['time_from'])->where('date', $attributes['date'])->where('appointee_id', $model->getKey())->where('appointee_type', $model->getMorphClass())->count();
        
        // $duplicateSlotsAllowed = -1 implies unlimited
        if($duplicateSlotsAllowed >= 0 && $appointerSlotsCount > $duplicateSlotsAllowed || $appointeeSlotsCount > $appointeeSlotsCount) {
            throw ValidationException::withMessages(['time_from' => 'Slot already booked']);
        }
    }
}
