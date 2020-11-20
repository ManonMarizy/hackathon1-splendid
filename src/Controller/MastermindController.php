<?php

namespace App\Controller;

use App\Model\MastermindManager;

class MastermindController extends AbstractController
{
    public function index($idPoison)
    {

        $mastermindManager = new MastermindManager();
        $poison = $mastermindManager->selectPoisonById($idPoison);
        $ingredients = $mastermindManager->ingredients($idPoison);
        $symptoms = $mastermindManager->symptoms($idPoison);
        $allIngredients = $mastermindManager->selectAll();

        return $this->twig->render('Mastermind/index.html.twig', [
            'symptoms' => $symptoms,
            'ingredients' => $ingredients,
            'allIngredients' => $allIngredients,
            'poison' => $poison,
        ]);
    }

    public function antidote()
    {
        $idIngredients = [];
        $badIngredients = null;

        if ($_SERVER['REQUEST_METHOD'] == 'POST' && !empty($_POST)) {
            $idPoison = $_POST['idPoison'];
            $mastermindManager = new MastermindManager();
            $poison = $mastermindManager->selectPoisonById($idPoison);
            $ingredients = $mastermindManager->ingredients($idPoison);
            $symptoms = $mastermindManager->symptoms($idPoison);
            $allIngredients = $mastermindManager->selectAll();

            foreach ($ingredients as $ingredient) {
                $idIngredients[] = $ingredient['id'];
            }

            $selectedIngredients = $_POST['ingredients'];
            $result = array_diff($selectedIngredients, $idIngredients);


            if (count($result)) {
                $goodIngredients = array_intersect($selectedIngredients, $idIngredients);
                $badIngredients = $result;
                $phase = "It's the wrong combination of ingredients";

                return $this->twig->render('Mastermind/index.html.twig', [
                    'goodIngredients' => $goodIngredients,
                    'badIngredients' => $badIngredients,
                    'phase' => $phase,
                    'allIngredients' => $allIngredients,
                    'poison' => $poison,
                    'symptoms' => $symptoms,

                    'idIngredients' => $idIngredients,
                    'selectedIngredients' => $selectedIngredients,
                    'result' => $result,
                ]);
            } else {
                $goodIngredients = $selectedIngredients;
                $phase = "congratulations, you managed to find the antidote!";

                return $this->twig->render('Mastermind/index.html.twig', [
                    'goodIngredients' => $goodIngredients,
                    'badIngredients' => $badIngredients,
                    'phase' => $phase,
                    'allIngredients' => $allIngredients,
                    'poison' => $poison,

                    'idIngredients' => $idIngredients,
                    'selectedIngredients' => $selectedIngredients,
                    'result' => $result,
                ]);
            }
        }
    }
}
