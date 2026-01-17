<?php

namespace Database\Seeders;

use App\Models\Role;
use Illuminate\Database\Seeder;

class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $roles = [
            [
                'name' => 'superadmin',
                'label' => 'Super Administrateur',
                'description' => 'Accès complet à toutes les fonctionnalités de la plateforme',
            ],
            [
                'name' => 'admin',
                'label' => 'Administrateur',
                'description' => 'Gestion de l\'école et accès aux fonctionnalités administratives',
            ],
            [
                'name' => 'teacher',
                'label' => 'Enseignant',
                'description' => 'Gestion des cours, notes et présences des élèves',
            ],
            [
                'name' => 'parent',
                'label' => 'Parent',
                'description' => 'Consultation des informations et gestion des comptes de ses enfants',
            ],
            [
                'name' => 'student',
                'label' => 'Élève',
                'description' => 'Accès aux cours, notes et informations scolaires',
            ],
            [
                'name' => 'staff',
                'label' => 'Personnel',
                'description' => 'Personnel administratif et de support',
            ],
        ];

        foreach ($roles as $roleData) {
            Role::firstOrCreate(
                ['name' => $roleData['name']],
                [
                    'label' => $roleData['label'],
                    'description' => $roleData['description'],
                ]
            );
        }
    }
}
