<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDoctorsTypesTable extends Migration
{
    public function up()
    {
        Schema::create('doctor_profiles_types', function (Blueprint $table) {
            $table->integer('doctor_profile_id')->unsigned();
            $table->integer('category_id')->unsigned();
            $table->foreign('doctor_profile_id')->references('id')->on('doctor_profiles')->onDelete('cascade');
            $table->foreign('category_id')->references('id')->on('categories')->onDelete('cascade');
        });
    }
    
    /**
    * Reverse the migrations.
    *
    * @return void
    */
    public function down()
    {
        Schema::table('doctor_profiles_types', function (Blueprint $table) {
            $table->dropForeign(['doctor_profile_id']);
            $table->dropForeign(['category_id']);
        });
        Schema::dropIfExists('doctor_profiles_types');
    }
}
