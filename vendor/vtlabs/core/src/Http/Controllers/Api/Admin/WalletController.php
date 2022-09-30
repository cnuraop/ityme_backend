<?php

namespace Vtlabs\Core\Http\Controllers\Api\Admin;

use Illuminate\Http\Request;
use Depsimon\Wallet\Transaction;
use Vtlabs\Core\Http\Controllers\Controller;
use Vtlabs\Core\Http\Resources\Admin\TransactionAdminResource;

class WalletController extends Controller
{
    public function transactions(Request $request)
    {
        $transactions = Transaction::query();

        return TransactionAdminResource::collection($transactions->latest()->paginate());
    }
}
