<?php  if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}
require_once('DB_model.php');

class Comment_model extends DB_model
{
    public function __construct()
    {
        parent::__construct('T_COMMENT_COM', array('id' => 'COM_ID', 'text' => 'COM_TEXT', 'date' => 'COM_DATE', 'creator' => 'USR_ID', 'recipe' => 'RCP_ID'));
    }
}
