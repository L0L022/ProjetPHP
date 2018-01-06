<?php  if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}
require_once('DB_model.php');

class Ingredient_model extends DB_model
{
    public function __construct()
    {
        parent::__construct('T_INGREDIENT_IGD', array('id' => 'IGD_ID', 'label' => 'IGD_LABEL', 'description' => 'IGD_DESCRIPTION', 'illustration' => 'IGD_ILLUSTRATION', 'creator' => 'USR_ID'));
    }
}
