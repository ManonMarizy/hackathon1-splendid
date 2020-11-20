<?php

namespace App\Model;

class CureManager extends AbstractManager
{
    /**
     *
     */
    const TABLE = 'ingredient';

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
    public function selectOneCureById(int $id)
    {
        $query = "SELECT * FROM " . self::TABLE . " JOIN poison_has_ingredient phi ON ingredient.id = phi.ingredient_id
        WHERE poison_id = :id";
        $statement = $this->pdo->prepare($query);
        $statement->bindValue(':id', $id, \PDO::PARAM_STR);
        $statement->execute();
        return $statement->fetchAll();
    }
}
