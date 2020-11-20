<?php

namespace App\Model;

class PoisonManager extends AbstractManager
{

    const TABLE = 'poison';

    /**
     *  Initializes this class.
     */
    public function __construct()
    {
        parent::__construct(self::TABLE);
    }

    /**
     * @param int $id
     * @return array
     */
    public function selectSymptomsById(int $id)
    {
        $query = "SELECT * FROM symptom JOIN poison_has_symptom phs ON poison.id = phs.poison_id
        WHERE poison_id = :id";
        $statement = $this->pdo->prepare($query);
        $statement->bindValue(':id', $id, \PDO::PARAM_STR);
        $statement->execute();
        return $statement->fetchAll();
    }
}
