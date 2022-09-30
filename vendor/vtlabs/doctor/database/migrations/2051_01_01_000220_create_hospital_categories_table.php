<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHospitalCategoriesTable extends Migration
{
    public function up()
    {
        Schema::create('doctor_hospital_categories', function (Blueprint $table) {
            $table->integer('hospital_id')->unsigned();
            $table->integer('category_id')->unsigned();
            $table->foreign('hospital_id')->references('id')->on('doctor_hospitals')->onDelete('cascade');
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
        Schema::table('doctor_hospital_categories', function (Blueprint $table) {
            $table->dropForeign(['hospital_id']);
            $table->dropForeign(['category_id']);
        });
        Schema::dropIfExists('doctor_hospital_categories');
    }
}
