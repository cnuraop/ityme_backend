<?php

namespace Vtlabs\Payment\Models;

use EloquentFilter\Filterable;
use Illuminate\Database\Eloquent\Model;
use Spatie\Translatable\HasTranslations;

class PaymentMethod extends Model
{
    use Filterable,
        HasTranslations;

    protected $table = 'payment_methods';

    protected $guarded = [];

    protected $casts = [
        'title' => 'array',
        'meta' => 'array'
    ];

    public $translatable = ['title'];
}
