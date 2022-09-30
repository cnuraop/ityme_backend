<?php

namespace Vtlabs\Payment\Models;

class GatewayResponse
{
    private $data;
    private $success;
    private $error;

    public function __construct($data, bool $success, $error=null)
    {
        $this->data = $data;
        $this->success = $success;
        $this->error = $error;
    }

    public function getData()
    {
        return $this->data;
    }

    public function isSuccessfull()
    {
        return $this->success;
    }

    public function error()
    {
        return $this->error;
    }
}
