<?php

namespace App\Model;

class PoisonManager extends AbstractManager
{
    /**
     *
     */
    const TABLE = 'poison';

    /**
     *  Initializes this class.
     */
    public function __construct()
    {
        parent::__construct(self::TABLE);
    }
}
