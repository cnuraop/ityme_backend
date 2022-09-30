<?php

namespace Vtlabs\Faq\Http\Controllers\Api;

use Illuminate\Http\Request;
use Vtlabs\Faq\Models\Faq;
use Vtlabs\Core\Http\Controllers\Controller;
use Vtlabs\Faq\Http\Resources\FaqResource;

/**
 * @group Faq
 *
 * APIs for FAQs
 */
class FaqController extends Controller
{
    /**
     * List of faq
     * 
     * @responseFile responses/faq/faq.list.get.200.json
     */
    public function index(Request $request)
    {
        return FaqResource::collection(Faq::ordered()->get());
    }
}
