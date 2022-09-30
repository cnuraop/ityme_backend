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

Route::middleware('api')->prefix('api')->name('api')->namespace('Vtlabs\Category\Http\Controllers\Api')->group(function () {

    // admin api
    Route::namespace('Admin')->name('admin')->prefix('admin')->group(function () {
        Route::get('categories/download-template-file', 'CategoryController@downloadTemplateFile');
        Route::post('categories/import-file', 'CategoryController@importFromFile');
        Route::middleware('auth:api')->group(function () {
            Route::apiResource('categories', 'CategoryController');
        });
    });

    // app/web api
    Route::get('categories', 'CategoryController@index');
});
