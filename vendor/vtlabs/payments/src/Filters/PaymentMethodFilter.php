<?php

namespace Vtlabs\Payment\Filters;

use EloquentFilter\ModelFilter;
use Illuminate\Support\Facades\App;

class PaymentMethodFilter extends ModelFilter
{
    public function setup()
    {
    }

    public function enabled($slug)
    {
        return $this->where('enabled', true);
    }

    public function type($type)
    {
        return $this->where('type', 'prepaid');
    }
}
