<?php

namespace Vtlabs\Ecommerce\Models;

use EloquentFilter\Filterable;
use Spatie\ModelStatus\HasStatuses;
use Vtlabs\Payment\Traits\CanBePaid;
use Vtlabs\Payment\Contracts\Payable;
use Illuminate\Database\Eloquent\Model;
use Vtlabs\Ecommerce\Models\OrderDelivery;

class Order extends Model implements Payable
{
    use CanBePaid, HasStatuses, Filterable;

    const ACTIVE_ORDER_STATUS = ['new', 'pending' , 'accepted', 'preparing', 'prepared', 'dispatched'];
    const COMPLETED_ORDER_STATUS = ['complete'];
    const FAILED_ORDER_STATUS = ['rejected', 'refund', 'failed'];
    
    protected $table = 'ecommerce_orders';

    protected $guarded = [];

    protected $casts = [
        'meta' => 'array',
        'subtotal' => 'float',
        'taxes' => 'float',
        'delivery_fee' => 'float',
        'total' => 'float',
        'discount' => 'float',
    ];

    public static function boot()
    {
        parent::boot();

        // on create
        static::created(function ($vendor) {
            $vendor->setStatus(config('vtlabs_ecommerce.order.status_default'));
        });
    }

    public function scopeOrdered($query)
    {
        return $query->orderBy('created_at', 'desc');
    }

    public function isValidStatus(string $name, ?string $reason = null): bool
    {
        return in_array($name, config('vtlabs_ecommerce.order.status_list', []));
    }

    public function address()
    {
        return $this->hasOne(OrderAddress::class);
    }

    public function products()
    {
        return $this->hasMany(config('vtlabs_ecommerce.models.order_product'));
    }

    public function vendor()
    {
        return $this->belongsTo(config('vtlabs_ecommerce.models.vendor'));
    }

    public function delivery()
    {
        return $this->hasOne(OrderDelivery::class);
    }

    public function user()
    {
        return $this->belongsTo(config('vtlabs_ecommerce.models.user'));
    }

    public static function getOrderById($id)
    {
        //return $this->belongsTo(config('vtlabs_ecommerce.models.user'));
        //return $this->order::find($id);
        //$token = $request->bearerToken();
        //dd($token);
        // return order::query('ecommerce_orders')
        // ->where('id', $id)
        // ->get();

        // $users = order::query('ecommerce_orders')
        //     ->join('ecommerce_order_products', 'ecommerce_orders.id', '=', 'ecommerce_order_products.order_id')
        //     // ->join('orders', 'users.id', '=', 'orders.user_id')
        //     ->select('ecommerce_orders.*', 'ecommerce_order_products.*')
        //     ->where('ecommerce_order_products.active','=' ,1)
        //     ->get();

        $users = order::query('ecommerce_orders')
            ->join('ecommerce_order_products', 'ecommerce_orders.id', '=', 'ecommerce_order_products.order_id')
            ->join('ecommerce_products', 'ecommerce_products.id', '=', 'ecommerce_order_products.vendor_product_id')
            ->select('ecommerce_products.title', 'ecommerce_order_products.quantity','ecommerce_products.active')
            ->where('ecommerce_products.active','=',1)
            ->get();

         return $users;

    }
    // public function activeOrderStatus()
    // {
    //     return ['new', 'pending' , '']
    // }
}
