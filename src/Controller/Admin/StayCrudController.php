<?php

namespace App\Controller\Admin;

use App\Entity\Stay;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class StayCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Stay::class;
    }

    /*
    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id'),
            TextField::new('title'),
            TextEditorField::new('description'),
        ];
    }
    */
}
