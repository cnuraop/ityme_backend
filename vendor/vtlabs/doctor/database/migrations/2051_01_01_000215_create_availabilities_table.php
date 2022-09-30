<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAvailabilitiesTable extends Migration
{
    public function up()
    {
        Schema::create('doctor_availabilities', function (Blueprint $table) {
            $table->increments('id');
            $table->enum('days', ['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat']);
            $table->time('from');
            $table->time('to');
            $table->integer('doctor_profile_id')->unsigned();
            $table->foreign('doctor_profile_id')->references('id')->on('doctor_profiles')->onDelete('cascade');
        });
    }
    
    /**
    * Reverse the migrations.
    *
    * @return void
    */
    public function down()
    {
        Schema::table('doctor_availabilities', function (Blueprint $table) {
            $table->dropForeign(['doctor_profile_id']);
        });
        Schema::dropIfExists('doctor_availabilities');
    }
}
