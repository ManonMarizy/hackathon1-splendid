<?php

namespace App\Model;

class MastermindManager extends AbstractManager
{
    const TABLE = 'ingredient';

    public function __construct()
    {
        parent::__construct(self::TABLE);
    }
}
