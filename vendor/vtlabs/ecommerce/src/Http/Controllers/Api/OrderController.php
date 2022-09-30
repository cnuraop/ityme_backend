<?php

namespace Vtlabs\Ecommerce\Http\Controllers\Api;

use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Vtlabs\Ecommerce\Models\Order;
use Illuminate\Support\Facades\Auth;
use Vtlabs\Ecommerce\Events\NewOrder;
use Vtlabs\Payment\Models\PaymentMethod;
use Vtlabs\Ecommerce\Filters\OrderFilter;
use Vtlabs\Core\Http\Controllers\Controller;
use Vtlabs\Ecommerce\Events\UpdateOrderStatus;
use Vtlabs\Ecommerce\Services\CheckoutService;
use Vtlabs\Ecommerce\Http\Resources\OrderResource;
use Vtlabs\Payment\Http\Resources\PaymentResource;

class OrderController extends Controller
{
    public function index(Request $request)
    {
        $request->validate([
            'vendor' => 'sometimes',
            'delivery_profile' => 'sometimes',
            'user' => 'sometimes',
            'status' => 'sometimes',
            'id' => 'sometimes'
        ]);

        

        if (!$request->vendor && !$request->delivery_profile) {
            $request->merge([
                'current_user' => Auth::user()->id
            ]);
        }

        $orders = Order::filter($request->all(), OrderFilter::class)->ordered();

        return OrderResource::collection($orders->paginate());
    }

    public function store(Request $request)
    {
        $checkoutService = new CheckoutService($request->all(), Auth::user());

        // validate create order request
        $checkoutService->validator()->validate();

        $orderIds = $checkoutService->createOrder();

        // handle multiple orders incase checkout contains products from multiple vendors
        $payment = null;
        if (count($orderIds) > 1) {
            // payment
            $payment = $checkoutService->createMultiOrderPayment($orderIds);
        }

        // if payment is null that means payment object inside order will be used, 
        // it implies that it's a single vendor order
        return response()->json([
            'payment' => $payment ? new PaymentResource($payment): null,
            'order' => new OrderResource(Order::find($orderIds[0]))
        ]);
    }

    public function reorder($id)
    {

        //$checkoutService = new CheckoutService($request->all(), Auth::user());

        //store($request);
       // $product = Product::where('user_id', Auth::id())->where('id', $product_id)->firstOrFail();
        //$projects = Project::where('product_id', $product->id)->latest()->paginate(20);

       // return view('projects.index', compact('projects'))
       //   ->with('i', (request()->input('page', 1) - 1) * 5);

       //$ordered = $this->order->find($id);
       //dd($id);
      // $checkoutService = new CheckoutService($request->all(), Auth::user());

        // validate create order request
        //$checkoutService->validator()->validate();

        // if (!$request->vendor && !$request->delivery_profile) {
        //     $request->merge([
        //         'current_user' => Auth::user()->id
        //     ]);
        // }

        //$header = $request->header('Authorization');

        //dd($request->headers);
       return  json_encode(Order::getOrderById($id)); 
    }


    public function show(Order $order)
    {
        return new OrderResource($order);
    }

    public function update(Order $order, Request $request)
    {
        $request->validate([
            'status' => ['sometimes', Rule::in(config('vtlabs_ecommerce.order.status_list', []))],
            'delivery_status' => ['sometimes', Rule::in(config('vtlabs_ecommerce.order_delivery.status_list', []))],
            'distance_in_metres' => 'sometimes|numeric'
        ]);

        if ($request->status) {
            $lastStatus = $order->status;

            $order->setStatus($request->status);

            $order->save();

            event(new UpdateOrderStatus($order, 'order', $request->status, $lastStatus));
        }

        if ($request->delivery_status) {
            $lastStatus = $order->delivery->status;

            $order->delivery->setStatus($request->delivery_status);

            $order->save();

            event(new UpdateOrderStatus($order, 'delivery', $request->delivery_status, $lastStatus));
        }

        if ($request->distance_in_metres) {
            $order->distance_travelled = $request->distance_in_metres;
            $order->save();
        }

        return new OrderResource($order->fresh());
    }
}
