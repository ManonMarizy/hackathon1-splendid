<?php

namespace App\Controller;

use App\Model\MastermindManager;

class MastermindController extends AbstractController
{
    public function index($idPoison = 2)
    {
        $mastermindManager = new MastermindManager();
        $poison = $mastermindManager->selectPoison($idPoison);
        $ingredients = $mastermindManager->ingredients($idPoison);
        $symptoms = $mastermindManager->symptoms($idPoison);
        $allIngredients = $mastermindManager->selectAll();

/*
        if ($_SERVER['REQUEST_METHOD'] == 'POST' && !empty($_POST)) {
            $selectedIngredients = $_POST;
            //comparar post com ingredientes
            $result = array_diff($ingredients, $selectedIngredients);

            if (count($result) > 0) {
                $phase = "Sorry, no ingredients found";
            } else {
            }
        }
*/

        return $this->twig->render('Mastermind/index.html.twig', [
            'poison' => $poison,
            'symptoms' => $symptoms,
            'ingredient2' => $ingredients,
            'ingredients' => $allIngredients,
            'Post' => $_POST,
        ]);
    }
}
