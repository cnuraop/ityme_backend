<?php

namespace Vtlabs\Banner\Filters;

use EloquentFilter\ModelFilter;
use Illuminate\Support\Facades\App;

class BannerFilter extends ModelFilter
{
    public function setup()
    {
    }

    public function title($title)
    {
        $locale = App::getLocale();
        return $this->where('title->' . $locale, 'like', $title);
    }
    
    public function scope($scope)
    {
        return $this->where('meta->scope', $scope);
    }
}
