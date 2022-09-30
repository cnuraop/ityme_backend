<?php

use Illuminate\Database\Seeder;
use Vtlabs\Banner\Models\Banner;

class BannerTableSeeder extends Seeder
{
    public function run()
    {
        $faker = Faker\Factory::create();

        $banners = [
            [
                'title' => ['en' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'],
                'meta' => ['scope' => 'ecommerce'],
                'sort_order' => 1,
            ],
            [
                'title' => ['en' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'],
                'meta' => ['scope' => 'ecommerce'],
                'sort_order' => 2,
            ],
            [
                'title' => ['en' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'],
                'meta' => ['scope' => 'doctor'],
                'sort_order' => 1,
            ],
            [
                'title' => ['en' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'],
                'meta' => ['scope' => 'doctor'],
                'sort_order' => 2,
            ],
            [
                'title' => ['en' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'],
                'meta' => ['scope' => 'hospital'],
                'sort_order' => 1,
            ],
            [
                'title' => ['en' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'],
                'meta' => ['scope' => 'hospital'],
                'sort_order' => 2,
            ],
        ];

        foreach ($banners as $banner) {
            $bannerObject = Banner::create([
                'title' => $banner['title'],
                'meta' => $banner['meta'],
                'sort_order' => $banner['sort_order']
            ]);

            // banner image
            $bannerObject->addMediaFromUrl('https://via.placeholder.com/200')->toMediaCollection("images");
        }
    }
}
