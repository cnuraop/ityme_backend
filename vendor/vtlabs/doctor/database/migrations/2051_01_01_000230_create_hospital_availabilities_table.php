<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHospitalAvailabilitiesTable extends Migration
{
    public function up()
    {
        Schema::create('doctor_hospital_availabilities', function (Blueprint $table) {
            $table->increments('id');
            $table->enum('days', ['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat']);
            $table->time('from');
            $table->time('to');
            $table->integer('hospital_id')->unsigned();
            $table->foreign('hospital_id')->references('id')->on('doctor_hospitals')->onDelete('cascade');
        });
    }
    
    /**
    * Reverse the migrations.
    *
    * @return void
    */
    public function down()
    {
        Schema::table('doctor_hospital_availabilities', function (Blueprint $table) {
            $table->dropForeign(['hospital_id']);
        });
        Schema::dropIfExists('doctor_hospital_availabilities');
    }
}
