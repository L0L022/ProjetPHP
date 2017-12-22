<?php
class User_model extends CI_Model
{
    public function __construct()
    {
        $this->load->database();
    }

    public function get_AllUser()
    {
        $query = $this->db->query('SELECT * FROM `T_USER_USR`');
        return $row = $query->row();
    }
}
