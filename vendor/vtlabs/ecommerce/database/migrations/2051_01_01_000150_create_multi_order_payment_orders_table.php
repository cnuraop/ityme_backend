<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

class CreateMultiOrderPaymentOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ecommerce_multi_order_payment_orders', function (Blueprint $table) {
            $table->increments('id');

            $table->integer('multi_order_payment_id')->unsigned();
            $table->foreign('multi_order_payment_id', 'multi_order_payments')->references('id')->on('ecommerce_multi_order_payments')->onDelete('cascade');
            
            // order
            $table->integer('order_id')->unsigned();
            $table->foreign('order_id')->references('id')->on('ecommerce_orders')->onDelete('cascade');

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
        Schema::table('ecommerce_multi_order_payment_orders', function (Blueprint $table) {
            $table->dropForeign(['order_payment_id']);
            $table->dropForeign(['order_id']);
        });

        // delete orders
        Schema::dropIfExists('ecommerce_multi_order_payment_orders');
    }
}
