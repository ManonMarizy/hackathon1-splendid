<?php

namespace App\Controller;

use App\Model\PoisonManager;
use App\Model\SearchManager;

class SearchController extends AbstractController
{
    public function index()
    {
        $searchManager = new SearchManager();
        $symptoms = $searchManager->selectAll();
        return $this->twig->render('Search/index.html.twig', ['symptoms' => $symptoms]);
    }

    public function show()
    {
        $symptom = intval($_POST['symptom']);

        $poisonManager = new PoisonManager();
        $poisons = $poisonManager->selectPoisonBySymptomId($symptom);
        $searchManager = new SearchManager();
        $symptom = $searchManager->selectOneById($symptom);

        return $this->twig->render("Search/show.html.twig", [
            'symptom' => $symptom,
            'poisons' => $poisons
        ]);
    }
}
