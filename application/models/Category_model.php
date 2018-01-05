<?php  if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}
require_once('DB_model.php');

class Category_model extends DB_model
{
    public function __construct()
    {
        parent::__construct('T_CATEGORY_CAT', array('id' => 'CAT_ID', 'label' => 'CAT_LABEL', 'description' => 'CAT_DESCRIPTION', 'illustration' => 'CAT_ILLUSTRATION'));
    }
}
