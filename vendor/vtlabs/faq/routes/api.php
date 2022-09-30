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

Route::middleware('api')->prefix('api')->name('api')->namespace('Vtlabs\Faq\Http\Controllers\Api')->group(function () {

    // admin api
    Route::namespace('Admin')->name('admin')->prefix('admin')->group(function () {
        Route::middleware('auth:api')->group(function () {
            Route::apiResource('faqs', 'FaqController');
        });
    });

    // app/web api
    Route::prefix('faq')->group(function () {
        Route::get('/', 'FaqController@index');
    });
});
