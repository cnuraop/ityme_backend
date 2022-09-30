<?php

namespace Vtlabs\Ecommerce\Models;

use Vtlabs\Payment\Traits\CanBePaid;
use Vtlabs\Payment\Contracts\Payable;
use Illuminate\Database\Eloquent\Model;
use Vtlabs\Ecommerce\Models\OrderDelivery;

class MultiOrderPayment extends Model implements Payable
{
    use CanBePaid;
    
    protected $table = 'ecommerce_multi_order_payments';

    protected $guarded = [];

    protected $casts = [
        'total' => 'float'
    ];

    public function orders()
    {
        return $this->belongsToMany(Order::class, 'ecommerce_multi_order_payment_orders');
    }
}
