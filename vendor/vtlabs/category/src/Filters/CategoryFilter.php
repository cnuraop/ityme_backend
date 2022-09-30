<?php

namespace Vtlabs\Category\Filters;

use EloquentFilter\ModelFilter;
use Illuminate\Support\Facades\App;
use Vtlabs\Core\Helpers\CoreHelper;

class CategoryFilter extends ModelFilter
{
    public function setup()
    {
    }

    public function slug($slug)
    {
        return $this->where('slug', 'like', '%' . $slug . '%');
    }

    public function title($title)
    {
        return CoreHelper::searchTranslated($this, 'title', App::getLocale(), $title);
    }

    public function category($id)
    {
        return $this->related('category', 'id', '=', $id);
    }

    public function parent()
    {
        return $this->doesntHave('category');
    }

    public function scope($scope)
    {
        return $this->where('meta->scope', $scope);
    }

    public function categories($categories)
    {
        $categories = explode(',', $categories);

        return $this->whereHas('category', function($query) use ($categories) {
            return $query->whereIn('id', $categories);
        });
    }
}
