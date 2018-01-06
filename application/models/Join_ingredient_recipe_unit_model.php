<?php  if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}
require_once('DB_model.php');

class Join_ingredient_recipe_unit_model extends DB_model
{
    public function __construct()
    {
        parent::__construct('TJ_IGD_RCP_UNT', array('recipe' => 'RCP_ID', 'ingredient' => 'IGD_ID', 'unit' => 'UNT_ID', 'quantity' => 'IGD_RCP_UNT_QUANTITY'));
    }
}
