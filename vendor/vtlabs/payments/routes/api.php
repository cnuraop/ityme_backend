<?php

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


use Illuminate\Http\Request;

Route::middleware('api')->prefix('api')->name('api')->namespace('Vtlabs\Payment\Http\Controllers\Api')->group(function () {

    // admin api
    Route::namespace('Admin')->name('admin')->prefix('admin')->group(function () {
        Route::middleware('auth:api')->group(function () {
            Route::apiResource('paymentmethods', 'PaymentMethodController');
        });
    });

    Route::prefix('payment')->group(function () {

        Route::get('methods', 'PaymentController@paymentMethods');

        Route::get('stripe/{payment}', 'PaymentController@makeStripePayment');

        Route::post('payu/{payment}', 'PaymentController@makePayuPayment');

        Route::get('paystack/callback/{payment}', 'PaymentController@paystackCallback');
        Route::get('paystack/status/{payment}', 'PaymentController@paystackStatus');
        Route::get('paystack/{payment}', 'PaymentController@makePaystackPayment');

        Route::get('wallet/{payment}', 'PaymentController@makeWalletPayment');

        Route::post('authorize-net/{payment}', 'PaymentController@makeAuthorizeNetPayment');
    });
});
