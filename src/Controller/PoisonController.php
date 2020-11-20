<?php

namespace App\Controller;

use App\Model\PoisonManager;

class PoisonController extends AbstractController
{
    private $poisonManager;

    public function __construct()
    {
        parent::__construct();
        $this->poisonManager = new PoisonManager();
    }

    public function list()
    {
        $poisons = $this->poisonManager->selectAll();

        return $this->twig->render('Poison/list.html.twig', ['poisons' => $poisons]);
    }
}
