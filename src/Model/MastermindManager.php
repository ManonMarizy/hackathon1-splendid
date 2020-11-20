<?php

namespace App\Model;

class MastermindManager extends AbstractManager
{
    const TABLE = 'ingredient';
    const TABLE2 = 'symptom';
    const TABLE3 = 'poison';

    public function __construct()
    {
        parent::__construct(self::TABLE);
    }

    public function ingredients($idPoison)
    {
        // prepared request
        $query = "SELECT * FROM " . self::TABLE . " as i ";
        $query .= "inner join poison_has_ingredient as pi ON pi.ingredient_id = i.id ";
        $query .= "WHERE pi.poison_id = :id";
        $statement = $this->pdo->prepare($query);
        $statement->bindValue('id', $idPoison, \PDO::PARAM_INT);
        $statement->execute();
        return $statement->fetchAll();
    }

    public function symptoms($idPoison)
    {
        // prepared request
        $query = "SELECT * FROM " . self::TABLE2 . " as s ";
        $query .= "inner join poison_has_symptom as ps ON s.id = ps.poison_id ";
        $query .= "WHERE ps.poison_id = :id";
        $statement = $this->pdo->prepare($query);
        $statement->bindValue('id', $idPoison, \PDO::PARAM_INT);
        $statement->execute();
        return $statement->fetchAll();
    }

    public function selectPoison($idPoison)
    {
        $req = $this->pdo->prepare('SELECT * FROM ' . self::TABLE3 . ' WHERE id = :id');
        $req->bindValue(':id', $idPoison, \PDO::PARAM_INT);
        $req->execute();

        return $req->fetchAll(\PDO::FETCH_ASSOC);
    }
}
