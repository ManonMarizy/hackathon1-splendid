<?php

namespace App\Controller;

use App\Model\PoisonManager;
use App\Model\CureManager;

class PoisonController extends AbstractController
{
    public function show(int $getId)
    {
        $getById = filter_var($getId, FILTER_VALIDATE_INT, ["options" => ["min_range" => 1]]);
        $cureManager = new CureManager();
        $poisonManager = new PoisonManager();
        $cureInformations = $cureManager->selectOneCureById($getById);
        $poisonInformations = $poisonManager->selectOneById($getById);
        $poisonSymptoms = $poisonManager->selectSymptomsById($getId);
        if (!isset($cureInformations['igredient'])) {
            header("Location: /");
        }
        return $this->twig->render('CureManager/show.html.twig', [
            'cureInformations' => $cureInformations,
            'poisonInformations' => $poisonInformations,
            'poisonSymptoms' => $poisonSymptoms
        ]);
    }
}
