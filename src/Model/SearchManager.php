<?php

namespace App\Model;

class SearchManager extends AbstractManager
{
    const TABLE = "symptom";

    public function __construct()
    {
        parent::__construct(self::TABLE);
    }
}
