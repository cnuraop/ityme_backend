<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHospitalsTable extends Migration
{
    public function up()
    {
        Schema::create('doctor_hospitals', function (Blueprint $table) {
            $table->increments('id');
            $table->string('slug');
            $table->json('name');
            $table->json('tagline')->nullable();
            $table->json('details')->nullable();
            $table->json('meta')->nullable();
            $table->string('address')->nullable();
            $table->decimal('longitude', 15, 7)->default(0.0);
            $table->decimal('latitude', 15, 7)->default(0.0);
            $table->integer('sort_order')->default(1);

            $table->timestamps();
        });
    }
    
    /**
    * Reverse the migrations.
    *
    * @return void
    */
    public function down()
    {
        Schema::dropIfExists('doctor_hospitals');
    }
}
