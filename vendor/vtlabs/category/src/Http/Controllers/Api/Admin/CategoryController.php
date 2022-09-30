<?php

namespace Vtlabs\Category\Http\Controllers\Api\Admin;

use ZipArchive;
use League\Csv\Reader;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Vtlabs\Core\Helpers\CoreHelper;
use Illuminate\Support\Facades\Gate;
use Vtlabs\Category\Models\Category;
use Illuminate\Support\Facades\Storage;
use Vtlabs\Category\Filters\CategoryFilter;
use Vtlabs\Core\Http\Controllers\Controller;
use Vtlabs\Category\Http\Resources\Admin\CategoryAdminResource;

class CategoryController extends Controller
{
    public function index(Request $request)
    {
        $request->validate([
            'pagination' => 'sometimes|boolean',
            'title' => 'sometimes|string',
            'scope' => 'sometimes|string',
            'parent' => 'sometimes|string'
        ]);

        $categories = Category::filter($request->all(), CategoryFilter::class);

        if ($request->pagination == '0') {
            $categories = $categories->get();
        } else {
            $categories = $categories->paginate();
        }
        return CategoryAdminResource::collection($categories);
    }

    public function store(Request $request)
    {
        $request->validate([
            'title_translations' => 'required|json|translation',
            'slug' => 'required|slug|unique:categories',
            'sort_order' => 'required',
            'meta' => 'sometimes|json|nullable',
            'image' => 'sometimes|image',
            'parent_id' => 'sometimes|exists:categories,id'
        ]);

        request()->merge([
            "title" => request()->input('_title')
        ]);

        if ($request->meta) {
            request()->merge([
                "meta" => json_decode($request->meta)
            ]);
        }

        $category = Category::create($request->only(['title', 'meta', 'parent_id', 'slug', 'sort_order']));

        if ($request->image) {
            $category->addMedia($request->image)->toMediaCollection("images");
        }

        return new CategoryAdminResource($category->fresh());
    }

    public function show($id)
    {
        return new CategoryAdminResource(Category::find($id));
    }

    public function update(Category $category, Request $request)
    {
        $request->validate([
            'title_translations' => 'required|translation',
            'slug' => ['required', 'slug', Rule::unique('categories')->ignore($category->id)],
            'sort_order' => 'required',
            'meta' => 'sometimes|json|nullable',
            'image' => 'sometimes|image',
            'parent_id' => 'sometimes|exists:categories,id|nullable'
        ]);

        request()->merge([
            "title" => request()->input('_title')
        ]);

        if ($request->meta) {
            request()->merge([
                "meta" => json_decode($request->meta)
            ]);
        }

        $category->fill($request->only(['title', 'meta', 'parent_id', 'slug', 'sort_order']));
        $category->save();

        if ($request->image) {
            $category->clearMediaCollection("images");
            $category->addMedia($request->image)->toMediaCollection("images");
        }

        return new CategoryAdminResource($category->fresh());
    }

    public function destroy($id)
    {
        Gate::authorize('delete');

        Category::findOrFail($id)->delete();

        return response()->json([], 200);
    }

    public function downloadTemplateFile(Request $request)
    {
        return response()->download(public_path('assets/vendor/category/data-template/category-data.zip'));
    }

    public function importFromFile(Request $request)
    {
        $request->validate([
            'csv' => 'required|file'
        ]);

        $zip = new ZipArchive;

        $res = $zip->open($request->file('csv')->getRealPath());

        if ($res === TRUE) {
            $zip->extractTo(storage_path('app/public'));
            $zip->close();
        }

        if (file_exists(storage_path('app/public/category-data/category.csv'))) {
            $csv = Reader::createFromPath(storage_path('app/public/category-data/category.csv'), 'r');

            $csv->setHeaderOffset(0);
            $csv->setDelimiter(',');
            $records = $csv->getRecords(); //returns all the CSV records as an Iterator object

            foreach ($records as $record) {
                $category = new Category();
                $category->slug = $record['slug'];
                $category->sort_order = $record['sort_order'];
                $category->meta = ["scope" => $record['meta_scope']];
                $parent = Category::where('slug', $record['parent_slug'])->first();
                if($parent) {
                    $category->parent_id = $parent->id;
                }
                
                CoreHelper::fillTranslation($category, ["title" => $record['title']]);

                $category->save();

                if (!empty($record['image_name'])) {
                    $category->addMedia(storage_path('app/public/category-data/image/'. $record['image_name']))->preservingOriginal()->toMediaCollection("images");
                }
            }

            // cleaning
            Storage::deleteDirectory('category-data');

            return response()->json([], 200);
        }

        return response()->json([], 400);
    }
}
