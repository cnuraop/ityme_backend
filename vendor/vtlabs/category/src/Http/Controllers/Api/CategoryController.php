<?php

namespace Vtlabs\Category\Http\Controllers\Api;

use Illuminate\Http\Request;
use Vtlabs\Category\Filters\CategoryFilter;
use Vtlabs\Core\Http\Controllers\Controller;

/**
 * @group  Category
 *
 * APIs for category
 */
class CategoryController extends Controller
{
    private $categoryModel;
    private $categoryResource;

    public function __construct() {
        $this->categoryModel = config('vtlabs_category.models.category');
        $this->categoryResource = config('vtlabs_category.resources.category');
    }

    /**
     * List of categories
     *
     * @queryParam  pagination boolean If requires paginated data. Example: 1
     * @queryParam  title string Search by category title. Example: Category-name
     * @queryParam  parent string Categories by parent id. Example: 1
     * @queryParam  scope string Scope or type of category.
     * @queryParam  slug string Catgory by slug.
     * 
     * @responseFile responses/category/list.get.200.json
     */
    public function index(Request $request)
    {
        $request->validate([
            'pagination' => 'sometimes|boolean',
            'title' => 'sometimes|string',
            'parent' => 'sometimes|numeric',
            'scope' => 'sometimes|string',
            'slug' => 'sometimes|string',
        ]);

        $categories = $this->categoryModel::filter($request->all(), CategoryFilter::class)->ordered();
        
        if($request->pagination == '0') {
            $categories = $categories->get();
        } else {
            $categories = $categories->paginate();
        }
        
        return $this->categoryResource::collection($categories);
    }
}