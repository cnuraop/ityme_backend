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

Route::middleware('api')->prefix('api')->name('api')->namespace('Vtlabs\Doctor\Http\Controllers\Api')->group(function () {

    // admin api
    Route::namespace('Admin')->name('admin')->prefix('admin/doctor')->group(function () {
        Route::middleware('auth:api')->group(function () {
            Route::apiResource('hospitals', 'HospitalController');
            Route::apiResource('doctorprofiles', 'DoctorProfileController');
            Route::apiResource('appointments', 'AppointmentController')->except(['create']);
        });
    });

    Route::prefix('doctor')->group(function () {

        Route::get('hospitals', 'HospitalController@index');

        Route::get('profile/list', 'DoctorProfileController@index');
        Route::get('profile/{profile}', 'DoctorProfileController@show');
        Route::get('profile/schedule/{doctor}', 'DoctorProfileController@schedule');

        Route::middleware('auth:api')->group(function () {
            // doctor
            Route::get('profile', 'DoctorProfileController@showMyProfile');
            Route::put('profile', 'DoctorProfileController@update');
            Route::get('profile/ratings/{doctor}', 'DoctorProfileController@ratingList');
            Route::post('profile/ratings/{doctor}', 'DoctorProfileController@ratingStore');
            Route::get('profile/ratings/summary/{doctor}', 'DoctorProfileController@ratingSummary');
            Route::get('profile/favourites/list', 'DoctorProfileController@favourites');
            Route::post('profile/favourites/{doctor}', 'DoctorProfileController@toggleFavourite');

            // hospital
            Route::get('hospitals/ratings/{hospital}', 'HospitalController@ratingList');
            Route::post('hospitals/ratings/{hospital}', 'HospitalController@ratingStore');
            Route::get('hospitals/ratings/summary/{hospital}', 'HospitalController@ratingSummary');
            Route::get('hospitals/favourites/list', 'HospitalController@favourites');
            Route::post('hospitals/favourites/{hospital}', 'HospitalController@toggleFavourite');

            // appointment
            Route::get('appointments', 'AppointmentController@index');
            Route::post('appointments/{doctorProfile}', 'AppointmentController@store');
            Route::put('appointments/{appointment}', 'AppointmentController@update');
            Route::get('appointments/{doctorProfile}/summary', 'AppointmentController@appointmentSummary');
        });
    });
});
