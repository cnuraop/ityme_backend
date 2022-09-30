<?php

namespace Vtlabs\Support\Models;

use EloquentFilter\Filterable;
use Illuminate\Database\Eloquent\Model;

class Support extends Model
{
    use Filterable;


    protected $table = 'supports';

    protected $guarded = [];

    protected $casts = [
        'meta' => 'json'
    ];

    public function scopeOrdered($query)
    {
        return $query->orderBy('created_at');
    }
}
