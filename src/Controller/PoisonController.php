<?php

namespace App\Controller;

use App\Model\PoisonManager;
use App\Model\CureManager;

class PoisonController extends AbstractController
{
    private $poisonManager;

    public function __construct()
    {
        parent::__construct();
        $this->poisonManager = new PoisonManager();
    }

    /**
     * @return string
     * @throws \Twig\Error\LoaderError
     * @throws \Twig\Error\RuntimeError
     * @throws \Twig\Error\SyntaxError
     */
    public function list(): string
    {
        $poisons = $this->poisonManager->selectAll();

        return $this->twig->render('Poison/list.html.twig', ['poisons' => $poisons]);
    }

    /**
     * @param int $getId
     * @return string
     * @throws \Twig\Error\LoaderError
     * @throws \Twig\Error\RuntimeError
     * @throws \Twig\Error\SyntaxError
     */
    public function show(int $getId): string
    {
        $getById = filter_var($getId, FILTER_VALIDATE_INT, ["options" => ["min_range" => 1]]);
        $cureManager = new CureManager();
        $poisonManager = new PoisonManager();
        $cureInformations = $cureManager->selectOneCureById($getById);
        $poisonInformations = $poisonManager->selectOneById($getById);
        $poisonSymptoms = $poisonManager->selectSymptomsById($getById);
        if (!isset($poisonInformations['name'])) {
            header("Location: /");
        }

        return $this->twig->render('Poison/show.html.twig', [
            'cureInformations' => $cureInformations,
            'poisonInformations' => $poisonInformations,
            'poisonSymptoms' => $poisonSymptoms
        ]);
    }
}
