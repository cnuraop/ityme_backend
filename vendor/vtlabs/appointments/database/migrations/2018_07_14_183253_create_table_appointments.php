<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTableAppointments extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('appointments', function (Blueprint $table) {
            $table->increments('id');
            
            $table->integer('appointee_id');
            $table->string('appointee_type');

            $table->integer('appointer_id')->nullable();
            $table->string('appointer_type')->nullable();

            $table->json('meta')->nullable();
            
            $table->decimal('amount', 9, 2)->default(0);
            $table->json('amount_meta')->nullable();

            // address
            $table->string('address')->nullable();
            $table->json('address_meta')->nullable();
            $table->decimal('longitude', 15, 7)->default(0.0);
            $table->decimal('latitude', 15, 7)->default(0.0);

            // date and time
            $table->date('date');
            $table->time('time_from');
            $table->time('time_to');

            $table->boolean('is_guest')->default(false);
            $table->string('customer_name')->nullable();
            $table->string('customer_email')->nullable();
            $table->string('customer_mobile')->nullable();

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
        Schema::dropIfExists('appointments');
    }
}
