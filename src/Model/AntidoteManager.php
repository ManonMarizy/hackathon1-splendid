<?php

namespace App\Model;

class AntidoteManager extends AbstractManager
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
        $query = "select i.id, i.name, i.image from " . self::TABLE . " as i ";
        $query .= " inner join poison_has_ingredient as pi ON pi.ingredient_id = i.id";
        $query .= " where pi.poison_id = :id";
        $statement = $this->pdo->prepare($query);
        $statement->bindValue('id', $idPoison, \PDO::PARAM_INT);
        $statement->execute();
        return $statement->fetchAll();
    }
    public function symptoms($idPoison)
    {
        // prepared request
        $query = "SELECT s.id, s.name FROM " . self::TABLE2 . "  as s ";
        $query .= "inner join poison_has_symptom as ps ON s.id = ps.poison_id ";
        $query .= "WHERE ps.poison_id = :id";
        $statement = $this->pdo->prepare($query);
        $statement->bindValue('id', $idPoison, \PDO::PARAM_INT);
        $statement->execute();
        return $statement->fetchAll();
    }

    public function selectPoisonById($id)
    {
        // prepared request
        $statement = $this->pdo->prepare("SELECT * FROM " . self::TABLE3 . " WHERE id=:id");
        $statement->bindValue('id', $id, \PDO::PARAM_INT);
        $statement->execute();
        return $statement->fetch();
    }
}
