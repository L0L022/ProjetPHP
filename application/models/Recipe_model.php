<?php  if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}
require_once('DB_model.php');

class Recipe_model extends DB_model
{
    public function __construct()
    {
        parent::__construct('T_RECIPE_RCP', array('id' => 'RCP_ID', 'title' => 'RCP_TITLE', 'description' => 'RCP_DESCRIPTION', 'illustration' => 'RCP_ILLUSTRATION', 'creator' => 'USR_ID'));
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
