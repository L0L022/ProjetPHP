<?php  if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}
require_once('DB_model.php');

class Join_category_recipe_model extends DB_model
{
    public function __construct()
    {
        parent::__construct('TJ_CAT_RCP', array('category' => 'CAT_ID', 'recipe' => 'RCP_ID'));
    }
}
