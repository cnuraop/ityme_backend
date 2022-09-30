<?php

use Illuminate\Database\Seeder;
use Vtlabs\Doctor\Models\Hospital;

class HospitalTableSeeder extends Seeder
{
    public function run()
    {
        $faker = Faker\Factory::create();

        $hospitals = [
            [
                'slug' => 'apollo-hospitals',
                'name' => ['en' => 'Apollo Hospitals'],
                'tagline' => ['en' => 'Apollo Hospitals Tagline'],
                'details' => ['en' => 'Apollo Hospitals Details'],
                'address' => 'Test Address',
                'sort_order' => 1
            ],
            [
                'slug' => 'max-hospitals',
                'name' => ['en' => 'Max Hospitals'],
                'tagline' => ['en' => 'Max Hospitals Tagline'],
                'details' => ['en' => 'Max Hospitals Details'],
                'address' => 'Test Address',
                'sort_order' => 1
            ]
        ];

        
        foreach($hospitals as $hospital) {
            Hospital::create($hospital);
        }
    }
}
