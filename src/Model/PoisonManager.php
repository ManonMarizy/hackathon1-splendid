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

    public function selectAllPoison()
    {
        return $this->pdo->query("select poison.id, poison.name, poison.description, 
    poison.image, p.poison_id, p.symptom_id, s.name as symptom, s.id from poison 
    INNER JOIN poison_has_symptom p ON p.poison_id=poison.id 
    INNER JOIN symptom s ON s.id=p.symptom_id;")->fetchAll();
    }

    /**
     * @param int $id
     * @return array
     */

    public function selectPoisonBySymptomId(int $id)
    {
        $query = "SELECT poison.id, poison.name, poison.description, poison.image, poison.antidote, 
s.name as symptom FROM poison 
JOIN poison_has_symptom phs ON phs.poison_id=poison.id 
JOIN symptom s ON s.id = phs.symptom_id 
WHERE s.id = :id;";
        $statement = $this->pdo->prepare($query);
        $statement->bindValue('id', $id, \PDO::PARAM_INT);
        $statement->execute();
        return $statement->fetchAll();
    }

    public function selectSymptomsById(int $id)
    {
        $query = "SELECT * FROM symptom JOIN poison_has_symptom phs ON symptom.id = phs.symptom_id
        WHERE poison_id = :id";
        $statement = $this->pdo->prepare($query);
        $statement->bindValue(':id', $id, \PDO::PARAM_STR);
        $statement->execute();
        return $statement->fetchAll();
    }
}
