<?php

namespace App\Controller;

use App\Model\MastermindManager;

class MastermindController extends AbstractController
{
    public function index()
    {
        $mastermindManager = new MastermindManager;

        $ingredients = $mastermindManager->selectAll();

        return $this->twig->render('Mastermind/index.html.twig', [
            'jeanPost' => $_POST,
            'ingredients' => $ingredients,
        ]);
    }
}
