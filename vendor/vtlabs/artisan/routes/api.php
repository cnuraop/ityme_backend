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

Route::middleware('api')->prefix('api')->name('api')->namespace('Vtlabs\Artisan\Http\Controllers\Api')->group(function() {
    Route::namespace('Artisan')->name('artisan')->prefix('artisan')->group(function () {
        if(env('APP_DEBUG', false)) {
            Route::post('command', 'CommandController@command');
        }
    });
});
