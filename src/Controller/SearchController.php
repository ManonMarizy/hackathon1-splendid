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
        $symptom1 = intval($_POST['symptom-1']);
        $symptom2 = intval($_POST['symptom-2']);
        $symptom3 = intval($_POST['symptom-3']);
        $symptom4 = intval($_POST['symptom-4']);
        $symptoms = [
            'symp1ID' => $symptom1,
            'symp2ID' => $symptom2,
            'symp3ID' => $symptom3,
            'symp4ID' => $symptom4
        ];

        $poisonManager = new PoisonManager();
        $poisons = $poisonManager->selectAll();

        return $this->twig->render("Search/show.html.twig", [
            'symptoms' => $symptoms,
            'poisons' => $poisons
        ]);
    }
}
