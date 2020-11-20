<?php

namespace App\Model;

class PoisonManager extends AbstractManager
{
    /**
     *
     */
    const TABLE = 'poison';
    //TODO:mettre le bon nom de table

    /**
     *  Initializes this class.
     */
    public function __construct()
    {
        parent::__construct(self::TABLE);
    }

    public function selectAllPoison()
    {
        return $this->pdo->query("select poison.id, poison.name, poison.description, 
    poison.image, p.poison_id, p.symptom_id, s.name as symptom, s.id from poison 
    INNER JOIN poison_has_symptom p ON p.poison_id=poison.id 
    INNER JOIN symptom s ON s.id=p.symptom_id
    WHERE s.id = 1;")->fetchAll();
    }
}
