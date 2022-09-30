<?php

namespace Vtlabs\Payment\Http\Controllers\Api\Admin;

use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Vtlabs\Payment\Models\Payment;
use Illuminate\Support\Facades\Gate;
use Vtlabs\Payment\Models\PaymentMethod;
use Vtlabs\Core\Http\Controllers\Controller;
use Vtlabs\Payment\Filters\PaymentMethodFilter;
use Vtlabs\Payment\Http\Resources\PaymentMethodResource;

class PaymentMethodController extends Controller
{
    public function index(Request $request)
    {
        $paymentMethods = PaymentMethod::filter($request->all(), PaymentMethodFilter::class);
        
        return PaymentMethodResource::collection($paymentMethods->paginate());
    }

    public function store(Request $request)
    {
        $request->validate([
            'title_translations' => 'required|json|translation',
            'slug' => 'required|slug|unique:categories',
            'enabled' => 'required|boolean',
            'meta' => 'sometimes|json|nullable',
            'type' => 'required|in:prepaid,postpaid'
        ]);

        request()->merge([
            "title" => request()->input('_title')
        ]);

        if ($request->meta) {
            request()->merge([
                "meta" => json_decode($request->meta)
            ]);
        }

        $paymentMethod = PaymentMethod::create($request->only(['title', 'meta', 'enabled', 'slug', 'type']));

        return new PaymentMethodResource($paymentMethod->fresh());
    }

    public function show($id)
    {
        return new PaymentMethodResource(PaymentMethod::find($id));
    }

    public function update(PaymentMethod $paymentmethod, Request $request)
    {
        $request->validate([
            'title_translations' => 'required|translation',
            'slug' => ['required', 'slug', Rule::unique('payment_methods')->ignore($paymentmethod->id)],
            'enabled' => 'required|boolean',
            'meta' => 'sometimes|json|nullable',
            'type' => 'required|in:prepaid,postpaid'
        ]);

        request()->merge([
            "title" => request()->input('_title')
        ]);

        if ($request->meta) {
            request()->merge([
                "meta" => json_decode($request->meta)
            ]);
        }

        $paymentmethod->fill($request->only(['title', 'meta', 'enabled', 'slug', 'type']));
        $paymentmethod->save();
        
        return new PaymentMethodResource($paymentmethod->fresh());
    }

    public function destroy($id)
    {
        Gate::authorize('delete');

        PaymentMethod::findOrFail($id)->delete();

        return response()->json([], 200);
    }
}