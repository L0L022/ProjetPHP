<?php  if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}
require_once('DB_model.php');

class Recipe_model extends DB_model
{
    public function __construct()
    {
        parent::__construct('T_RECIPE_RCP', array('id' => 'RCP_ID',
        'date_create' => 'RCP_DATE_CREATE', 'date_modif' => 'RCP_DATE_MODIF',
        'date_validation' => 'RCP_DATE_VALIDATION', 'title' => 'RCP_TITLE',
        'description' => 'RCP_DESCRIPTION', 'explanation' => 'RCP_EXPLANATION',
        'time_preparation' => 'RCP_TIME_PREPARATION',
        'time_cooking' => 'RCP_TIME_COOKING', 'time_rest' => 'RCP_TIME_REST',
        'difficulty' => 'RCP_DIFFICULTY', 'cost' => 'RCP_COST', 'reviewed' => 'RCP_REVIEWED',
        'illustration' => 'RCP_ILLUSTRATION', 'creator' => 'USR_ID',
        'result_type' => 'RCP_RESULT_TYPE', 'result_amount' => 'RCP_RESULT_AMOUNT'));
    }

    public function in_category($category)
    {
        $this->load->model('join_category_recipe_model', 'jcr');

        $this->db->select($this->get_select());
        $this->db->from($this->table);
        $this->db->join($this->jcr->get_table(), $this->jcr->get_table().'.'.$this->jcr->get_columns()['recipe'].'='.$this->table.'.'.$this->columns['id']);
        $this->db->where($this->jcr->to_real_name(array('category' => $category)));
        $query = $this->db->get();
        return $query->result_array();
    }
}
