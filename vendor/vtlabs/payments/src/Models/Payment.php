<?php

namespace Vtlabs\Payment\Models;

use EloquentFilter\Filterable;
use Spatie\ModelStatus\HasStatuses;
use Illuminate\Database\Eloquent\Model;
use Vtlabs\Payment\Events\PaymentUpdated;

class Payment extends Model
{
    use Filterable, HasStatuses;

    protected $table = 'payments';

    protected $guarded = [];

    protected $appends = ['status'];

    protected $casts = [
        'amount' => 'float',
    ];

    public static function boot()
    {
        parent::boot();

        // on create
        static::created(function ($payment) {
            $payment->setStatus(config('vtlabs_payment.payment.status_default'));
        });

        // on update
        static::saved(function ($payment) {
            event(new PaymentUpdated($payment));
        });
    }

    public function isValidStatus(string $name, ?string $reason = null): bool
    {
        return in_array($name, config('vtlabs_payment.payment.status_list', []));
    }

    /**
     * The relationship function for the model who was paid.
     *
     * @return mixed
     */
    public function payable()
    {
        return $this->morphTo();
    }

    /**
     * The relationship function for the model who paid.
     *
     * @return mixed
     */
    public function payer()
    {
        return $this->morphTo();
    }

    public function paymentMethod()
    {
        return $this->belongsTo(PaymentMethod::class);
    }
}
