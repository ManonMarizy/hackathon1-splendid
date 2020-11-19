<?php

namespace App\Model;

class PoisonManager extends AbstractManager
{
    /**
     *
     */
    const TABLE = '';
    //TODO:mettre le bon nom de table

    /**
     *  Initializes this class.
     */
    public function __construct()
    {
        parent::__construct(self::TABLE);
    }
}