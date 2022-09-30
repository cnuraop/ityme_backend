<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDoctorsTable extends Migration
{
    public function up()
    {
        Schema::create('doctor_profiles', function (Blueprint $table) {
            $table->increments('id');
            $table->json('name')->nullable();
            $table->json('tagline')->nullable();
            $table->json('details')->nullable();
            $table->json('meta')->nullable();
            $table->integer('experience_years')->default(0);
            $table->string('address')->nullable();
            $table->decimal('longitude', 15, 7)->default(0.0);
            $table->decimal('latitude', 15, 7)->default(0.0);
            $table->boolean('is_verified')->default(config('vtlabs_doctor.doctor.verify_default'));
            
            $table->integer('user_id')->unsigned();
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            
            $table->timestamps();
        });

        Schema::create('doctor_profiles_hospitals', function (Blueprint $table) {
            $table->decimal('fee', 8, 2)->unsigned();
            $table->integer('doctor_profile_id')->unsigned();
            $table->integer('hospital_id')->unsigned();
            $table->foreign('doctor_profile_id')->references('id')->on('doctor_profiles')->onDelete('cascade');
            $table->foreign('hospital_id')->references('id')->on('doctor_hospitals')->onDelete('cascade');
        });

        Schema::create('doctor_profiles_degrees', function (Blueprint $table) {
            $table->integer('doctor_profile_id')->unsigned();
            $table->integer('category_id')->unsigned();
            $table->foreign('doctor_profile_id')->references('id')->on('doctor_profiles')->onDelete('cascade');
            $table->foreign('category_id')->references('id')->on('categories')->onDelete('cascade');
        });

        Schema::create('doctor_profiles_services', function (Blueprint $table) {
            $table->integer('doctor_profile_id')->unsigned();
            $table->integer('category_id')->unsigned();
            $table->foreign('doctor_profile_id')->references('id')->on('doctor_profiles')->onDelete('cascade');
            $table->foreign('category_id')->references('id')->on('categories')->onDelete('cascade');
        });

        Schema::create('doctor_profiles_specializations', function (Blueprint $table) {
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
        Schema::table('doctor_profiles_degrees', function (Blueprint $table) {
            $table->dropForeign(['doctor_profile_id']);
            $table->dropForeign(['category_id']);
        });
        Schema::dropIfExists('doctor_profiles_degrees');

        Schema::table('doctor_profiles_services', function (Blueprint $table) {
            $table->dropForeign(['doctor_profile_id']);
            $table->dropForeign(['category_id']);
        });
        Schema::dropIfExists('doctor_profiles_services');

        Schema::table('doctor_profiles_specializations', function (Blueprint $table) {
            $table->dropForeign(['doctor_profile_id']);
            $table->dropForeign(['category_id']);
        });
        Schema::dropIfExists('doctor_profiles_specializations');

        Schema::table('doctor_profiles_hospitals', function (Blueprint $table) {
            $table->dropForeign(['doctor_profile_id']);
            $table->dropForeign(['hospital_id']);
        });
        Schema::dropIfExists('doctor_profiles_hospitals');

        Schema::table('doctor_profiles', function (Blueprint $table) {
            $table->dropForeign(['user_id']);
        });
        Schema::dropIfExists('doctor_profiles');
    }
}
