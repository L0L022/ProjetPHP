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

    public function get_recipe($id)
    {
        $this->load->model('user_model');

        $this->db->select($this->get_select());
        $this->db->select($this->user_model->get_select('user_'));
        $this->db->from($this->table);
        $this->db->join($this->user_model->get_table(), $this->user_model->get_table().'.'.$this->user_model->get_columns()['id'].'='.$this->table.'.'.$this->columns['creator']);
        $this->db->where($this->to_real_name(array('id' => $id))); // NON
        $query = $this->db->get();
        return $query->result_array()[0];
    }

    public function get_rand_recipe($number)
    {
        $this->db->select($this->get_select());
        $this->db->order_by('', 'RANDOM');
        $this->db->limit($number);
        $this->db->from($this->table);
        $query = $this->db->get();
        return $query->result_array();
    }

    public function get_comments($id)
    {
        $this->load->model('comment_model');
        $this->load->model('user_model');

        $this->db->select($this->comment_model->get_select());
        $this->db->select($this->user_model->get_select('user_'));
        $this->db->order_by($this->comment_model->get_columns()['date'], 'DESC');
        $this->db->from($this->comment_model->table);
        $this->db->join($this->user_model->get_table(), $this->user_model->get_table().'.'.$this->user_model->get_columns()['id'].'='.$this->comment_model->table.'.'.$this->comment_model->columns['creator']);
        $this->db->where($this->comment_model->to_real_name(array('recipe' => $id)));
        $query = $this->db->get();
        return $query->result_array();
    }

    public function get_categories($id)
    {
        $this->load->model('category_model');
        $this->load->model('join_category_recipe_model', 'jcr');

        $this->db->select($this->category_model->get_select());
        $this->db->from($this->category_model->table);
        $this->db->join($this->jcr->get_table(), $this->jcr->get_table().'.'.$this->jcr->get_columns()['category'].'='.$this->category_model->table.'.'.$this->category_model->columns['id']);
        $this->db->where($this->jcr->to_real_name(array('recipe' => $id)));
        $query = $this->db->get();
        return $query->result_array();
    }

    public function get_ingredients($id)
    {
        $this->load->model('ingredient_model');
        $this->load->model('unit_model');
        $this->load->model('join_ingredient_recipe_unit_model', 'jiru_model');

        $this->db->select($this->ingredient_model->get_select());
        $this->db->select($this->unit_model->get_select('unit_'));
        $this->db->select($this->jiru_model->get_select('jiru_'));
        $this->db->from($this->jiru_model->table);
        $this->db->join($this->ingredient_model->get_table(), $this->ingredient_model->get_table().'.'.$this->ingredient_model->get_columns()['id'].'='.$this->jiru_model->table.'.'.$this->jiru_model->columns['ingredient']);
        $this->db->join($this->unit_model->get_table(), $this->unit_model->get_table().'.'.$this->unit_model->get_columns()['id'].'='.$this->jiru_model->table.'.'.$this->jiru_model->columns['unit']);
        $this->db->where($this->jiru_model->to_real_name(array('recipe' => $id)));
        $query = $this->db->get();
        return $query->result_array();
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
