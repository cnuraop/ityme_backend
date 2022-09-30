<?php

use Illuminate\Support\Str;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Vtlabs\Category\Models\Category;

class CategoryTableSeeder extends Seeder
{
    public function run()
    {
        $faker = Faker\Factory::create();

        $categories = [
            [
                'slug' => 'personal-care',
                'title' => ['en' => 'Personal Care'],
                'meta' => ['scope' => 'ecommerce'],
                'sort_order' => 1,
                "subcategories" => [
                    ['title' => ['en' => 'Skin Care'], 'slug' => Str::slug('Skin Care'), 'sort_order' => 1, 'meta' => ['scope' => 'ecommerce']],
                    ['title' => ['en' => 'Baby Care'], 'slug' => Str::slug('Baby Care'), 'sort_order' => 2, 'meta' => ['scope' => 'ecommerce']],
                    ['title' => ['en' => 'Hair Care'], 'slug' => Str::slug('Hair Care'), 'sort_order' => 3, 'meta' => ['scope' => 'ecommerce']]
                ]
            ],
            [
                'slug' => 'otc-medicines',
                'title' => ['en' => 'OTC Medicines'],
                'meta' => ['scope' => 'ecommerce'],
                'sort_order' => 1,
                "subcategories" => [
                    ['title' => ['en' => 'First Aid'], 'slug' => Str::slug('First Aid'), 'sort_order' => 1, 'meta' => ['scope' => 'ecommerce']],
                    ['title' => ['en' => 'Fever'], 'slug' => Str::slug('Fever'), 'sort_order' => 2, 'meta' => ['scope' => 'ecommerce']],
                    ['title' => ['en' => 'Pain'], 'slug' => Str::slug('Pain'), 'sort_order' => 3, 'meta' => ['scope' => 'ecommerce']]
                ]
            ]
        ];

        foreach ($categories as $category) {
            $categoryObject = Category::create([
                'slug' => $category['slug'],
                'title' => $category['title'],
                'meta' => $category['meta'],
                'sort_order' => $category['sort_order']
            ]);

            // category images
            $categoryObject->addMediaFromUrl('https://via.placeholder.com/200')->toMediaCollection("images");

            $categoryObject->subcategories()->createMany($category['subcategories']);
        }

        // degrees 
        $degrees = [
            [
                'slug' => 'mbbs',
                'title' => ['en' => 'MBBS'],
                'meta' => ['scope' => 'degree'],
                'sort_order' => 1
            ]
        ];
        foreach($degrees as $degree) {
            Category::create($degree);
        }

        // services 
        $services = [
            [
                'slug' => 'hypertension-treatment',
                'title' => ['en' => 'Hypertension Treatment'],
                'meta' => ['scope' => 'services'],
                'sort_order' => 1
            ],
            [
                'slug' => 'diabetes-treatment',
                'title' => ['en' => 'Diabetes Treatment'],
                'meta' => ['scope' => 'services'],
                'sort_order' => 1
            ]
        ];
        foreach($services as $service) {
            Category::create($service);
        }

        // specializations
        $specializations = [
            [
                'slug' => 'general-physician',
                'title' => ['en' => 'General Physician'],
                'meta' => ['scope' => 'specializations'],
                'sort_order' => 1
            ],
            [
                'slug' => 'cardialogist',
                'title' => ['en' => 'Cardialogist'],
                'meta' => ['scope' => 'specializations'],
                'sort_order' => 1
            ]
        ];
        foreach($specializations as $specialization) {
            Category::create($specialization);
        }

        // type
        $doctorTypes = [
            [
                'slug' => 'doctor',
                'title' => ['en' => 'Doctor'],
                'meta' => ['scope' => 'type'],
                'sort_order' => 1
            ],
            [
                'slug' => 'dentist',
                'title' => ['en' => 'Dentist'],
                'meta' => ['scope' => 'type'],
                'sort_order' => 1
            ]
        ];
        foreach($doctorTypes as $doctorType) {
            Category::create($doctorType);
        }
    }
}
