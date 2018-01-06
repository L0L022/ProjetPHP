<?php  if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}
require_once('DB_model.php');

class Unit_model extends DB_model
{
    public function __construct()
    {
        parent::__construct('T_UNIT_UNT', array('id' => 'UNT_ID', 'label' => 'UNT_LABEL', 'short_label' => 'UNT_SHORT_LABEL', 'creator' => 'USR_ID'));
    }
}
