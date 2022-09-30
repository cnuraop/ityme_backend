<?php

namespace Vtlabs\Payment\Http\Controllers\Api;

use Yabacon\Paystack;
use Illuminate\Http\Request;
use Vtlabs\Core\Models\User\User;
use Vtlabs\Payment\Models\Payment;
use Vtlabs\Payment\Models\PaymentMethod;
use Vtlabs\Payment\Events\OnWalletPayment;
use Vtlabs\Core\Http\Controllers\Controller;
use Vtlabs\Payment\Filters\PaymentMethodFilter;
use Vtlabs\Payment\Http\Resources\PaymentMethodResource;
use Vtlabs\Payment\Services\PaymentGateway\StripeGateway;
use net\authorize\api\contract\v1 as AnetAPI;
use net\authorize\api\controller as AnetController;

class PaymentController extends Controller
{
    public function paymentMethods(Request $request)
    {
        $paymentMethods = PaymentMethod::filter(array_merge(["enabled" => true], $request->all()), PaymentMethodFilter::class)->get();

        return PaymentMethodResource::collection($paymentMethods);
    }

    public function makeStripePayment(Payment $payment, Request $request)
    {
        $request->validate([
            'token' => 'required'
        ]);

        $parameters = [
            'amount' => $payment->amount,
            'currency' => 'usd',
            'token' => $request->token
        ];

        $stripeGateway = new StripeGateway();

        try {
            $stripeResponse = $stripeGateway->purchase($payment, $parameters);
            if ($stripeResponse->isSuccessfull()) {
                return response(["success" => true, "message" => "Payment succesfull"]);
            }
        } catch (\Exception $ex) {
            return response()->json(["success" => false, "message" => $ex->getMessage()], 400);
        }
    }

    public function makePayuPayment(Payment $payment, Request $request)
    {
        $request->validate([
            'result' => 'required|in:success,failed'
        ]);

        if ($request->result == 'success') {
            $payment->setStatus('paid');
            $payment->save();

            return response(["success" => true, "message" => "Payment succesfull"]);
        }

        if ($request->result == 'failed') {
            $payment->setStatus('failed');
            $payment->save();

            return response(["success" => false, "message" => "Payment failed"]);
        }
    }

    public function makePaystackPayment(Payment $payment, Request $request)
    {
        $paystack = new Paystack(env('PAYSTACK_SECURE_KEY'));
        try {
            $tranx = $paystack->transaction->initialize([
                'amount' => $payment->amount * 100,
                'email' => $payment->payer->email,         // unique to customers
                'reference' => (string)time(), // unique to transactions,
                'callback_url' => url('/api/payment/paystack/callback/' . $payment->payer->id . '?amount=' . $payment->amount)
            ]);
        } catch (\Yabacon\Paystack\Exception\ApiException $e) {
            die($e->getMessage());
        }

        // store transaction reference so we can query in case user never comes back
        // perhaps due to network issue
        // save_last_transaction_reference($tranx->data->reference);

        // redirect to page so User can pay
        header('Location: ' . $tranx->data->authorization_url);
    }


    public function paystackCallback(Payment $payment, Request $request)
    {
        $reference = isset($_GET['reference']) ? $_GET['reference'] : '';
        if (!$reference) {
            header('Location: ' . url('/api/payment/paystack/status/' . $payment->id . '?result=error'));
        }

        // initiate the Library's Paystack Object
        $paystack = new Paystack(env('PAYSTACK_SECURE_KEY'));
        try {
            // verify using the library
            $tranx = $paystack->transaction->verify([
                'reference' => $reference, // unique to transactions
            ]);
        } catch (\Yabacon\Paystack\Exception\ApiException $e) {
            header('Location: ' . url('/api/payment/paystack/status/' . $payment->id . '?result=error'));
        }

        if ('success' === $tranx->data->status) {
            $payment->setStatus('paid');
            $payment->save();
            header('Location: ' . url('/api/payment/paystack/status/' . $payment->id . '?result=success'));
        }
    }

    public function paystackStatus(Request $request)
    {
        echo $request->result;
    }

    public function makeWalletPayment(Payment $payment, Request $request)
    {
        $user = User::find($payment->payer_id);

        if ($user->canWithdraw($payment->amount)) {
            $payment->setStatus('paid');
            $payment->save();

            // withdraw from wallet is responsibility of listerner because we want to attach the payble_type object in
            // transaction meta
            event(new OnWalletPayment($payment->fresh()));

            return response(["success" => true, "message" => "Payment succesfull"]);
        }

        $payment->setStatus('failed');
        $payment->save();

        return response(["success" => false, "message" => "Insufficient balance in wallet"], 400);
    }

    public function makeAuthorizeNetPayment(Payment $payment, Request $request)
    {
        $request->validate([
            'name' => 'required',
            'card_number' => 'required',
            'exp_month' => 'required',
            'exp_year' => 'required',
            'cvv' => 'required'
        ]);

        $input = $request->input();
        $errorMessage = 'There were some issue with the payment. Please try again later.';

        /* Create a merchantAuthenticationType object with authentication details
          retrieved from the constants file */
        $merchantAuthentication = new AnetAPI\MerchantAuthenticationType();
        $merchantAuthentication->setName(env('ANET_MERCHANT_LOGIN_ID'));
        $merchantAuthentication->setTransactionKey(env('ANET_MERCHANT_TRANSACTION_KEY'));

        // Set the transaction's refId
        $refId = 'ref-' . $payment->id . '-' . time();
        $cardNumber = preg_replace('/\s+/', '', $input['card_number']);

        // Create the payment data for a credit card
        $creditCard = new AnetAPI\CreditCardType();
        $creditCard->setCardNumber($cardNumber);
        $creditCard->setExpirationDate($input['exp_year'] . "-" . $input['exp_month']);
        $creditCard->setCardCode($input['cvv']);

        // Add the payment data to a paymentType object
        $paymentOne = new AnetAPI\PaymentType();
        $paymentOne->setCreditCard($creditCard);

        // Create a TransactionRequestType object and add the previous objects to it
        $transactionRequestType = new AnetAPI\TransactionRequestType();
        $transactionRequestType->setTransactionType("authCaptureTransaction");
        $transactionRequestType->setAmount($payment->amount);
        $transactionRequestType->setPayment($paymentOne);

        // Assemble the complete transaction request
        $requests = new AnetAPI\CreateTransactionRequest();
        $requests->setMerchantAuthentication($merchantAuthentication);
        $requests->setRefId($refId);
        $requests->setTransactionRequest($transactionRequestType);

        // Create the controller and get the response
        $controller = new AnetController\CreateTransactionController($requests);
        $response = $controller->executeWithApiResponse(\net\authorize\api\constants\ANetEnvironment::SANDBOX);

        if ($response != null) {
            // Check to see if the API request was successfully received and acted upon
            if ($response->getMessages()->getResultCode() == "Ok") {
                // Since the API request was successful, look for a transaction response
                // and parse it to display the results of authorizing the card
                $tresponse = $response->getTransactionResponse();

                if ($tresponse != null && $tresponse->getMessages() != null) {
                    $payment->setStatus('paid');
                    $payment->save();

                    return response(["success" => true, "message" => "Payment succesfull"]);
                } else {
                    if ($tresponse->getErrors() != null) {
                        $errorMessage = $tresponse->getErrors()[0]->getErrorText();
                    }
                }
            } else {
                $tresponse = $response->getTransactionResponse();

                if ($tresponse != null && $tresponse->getErrors() != null) {
                    $errorMessage = $tresponse->getErrors()[0]->getErrorText();
                } else {
                    $errorMessage = $response->getMessages()->getMessage()[0]->getText();
                }
            }
        } else {
            $errorMessage = "No response returned";
        }

        $payment->setStatus('failed');
        $payment->save();

        return response(["success" => false, "message" => $errorMessage]);
    }
}
