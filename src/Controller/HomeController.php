<?php

namespace App\Controller;

use App\Repository\ContinentRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    /**
     * @Route("/", name="home")
     */
    public function index(ContinentRepository $continentRepository)
    {
        return $this->render(
            'home/index.html.twig', [
                'continents' => $continentRepository->findAll(),
            ]
        );
    }
}
