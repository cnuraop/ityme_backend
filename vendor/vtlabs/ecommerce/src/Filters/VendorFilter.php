<?php

namespace Vtlabs\Ecommerce\Filters;

use EloquentFilter\ModelFilter;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\App;
use Vtlabs\Core\Helpers\CoreHelper;

class VendorFilter extends ModelFilter
{
    public function setup()
    {
        
        // filter blank profiles and non verified vendors
        if (!CoreHelper::isAdmin()) {
            $this->whereNotNull('name')->where('is_verified', true);
        }

        // filter vendors based on user location
        $distanceLimit = CoreHelper::settingsAsDictionary()['delivery_distance'] ?? 8000;

        if ($this->input('long') && $this->input('lat')) {
            $subqueryDistance = "ST_Distance_Sphere(Point(longitude,"
                . " latitude),"
                . " Point(" . $this->input('long') . ", " . $this->input('lat') . "))"
                . " as distance";

            $subqueryDistanceWhere = "ST_Distance_Sphere(Point(longitude,"
                . " latitude),"
                . " Point(" . $this->input('long') . ", " . $this->input('lat') . "))"
                . " < " . $distanceLimit;

            $this->select('*', DB::raw($subqueryDistance))
                ->whereRaw($subqueryDistanceWhere);
        }
    }

    public function search($search)
    {
        return CoreHelper::searchTranslated($this, 'name', App::getLocale(), $search);
    }

    public function name($name)
    {
        return CoreHelper::searchTranslated($this, 'name', App::getLocale(), $name);
    }

    public function category($id)
    {
        return $this->whereHas('categories', function ($query) use ($id) {
            return $query->where('id', $id);
        });
    }

    public function distance()
    {
    }

    public function user($id)
    {
        return $this->whereHas('user', function ($query) use ($id) {
            return $query->where('name', 'like', '%' . $id . '%')
                ->orWhere('mobile_number', 'like', '%' . $id . '%')
                ->orWhere('email', 'like', '%' . $id . '%')
                ->orWhere('id', $id);
        });
    }
}
