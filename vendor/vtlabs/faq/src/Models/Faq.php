<?php

namespace Vtlabs\Faq\Models;

use EloquentFilter\Filterable;
use Illuminate\Database\Eloquent\Model;

class Faq extends Model
{
    use Filterable;


    protected $table = 'faqs';

    protected $guarded = [];

    protected $casts = [
        'meta' => 'json'
    ];

    public function scopeOrdered($query)
    {
        return $query->orderBy('created_at');
    }
}
