<?php

namespace Vtlabs\Doctor\Filters;

use EloquentFilter\ModelFilter;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\App;
use Vtlabs\Core\Helpers\CoreHelper;

class HospitalFilter extends ModelFilter
{
    public function setup()
    {
        if ($this->input('long') && $this->input('lat')) {
            $settings = CoreHelper::settingsAsDictionary();

            $subqueryDistance = "ST_Distance_Sphere(Point(longitude,"
                . " latitude),"
                . " Point(" . $this->input('long') . ", " . $this->input('lat') . "))"
                . " as distance";

            $subqueryDistanceWhere = "ST_Distance_Sphere(Point(longitude,"
                . " latitude),"
                . " Point(" . $this->input('long') . ", " . $this->input('lat') . "))"
                . " < " . $settings['doctor_distance'];

            $this->select('*', DB::raw($subqueryDistance))
                ->whereRaw($subqueryDistanceWhere)->orderBy('distance');
        }
    }

    public function name($name)
    {
        $locale = App::getLocale();
        return CoreHelper::searchTranslated($this, 'name', $locale, $name);
    }

    public function service($id)
    {
        return $this->whereHas('services', function ($query) use ($id) {
            return $query->where('id', $id);
        });
    }

    public function category($id)
    {
        return $this->whereHas('categories', function ($query) use ($id) {
            return $query->where('id', $id);
        });
    }
}
