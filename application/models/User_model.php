<?php
class User_model extends CI_Model
{
    public function __construct()
    {
        $this->load->database();
    }

    public function get_user($id)
    {
        $query = $this->db->get_where('T_USER_USR', array('USR_ID' => $id));
        return $row = $query->row();
    }

    public function is_valid_login($login, $pass)
    {
        $sql = "SELECT COUNT(*) AS 'result' FROM T_USER_USR WHERE USR_PASS = ? AND (USR_LOGIN = ? OR USR_MAIL = ?)";
        $query = $this->db->query($sql, array(hash('sha1', $pass), $login, $login));
        return $query->row()->result == 1;
    }

    public function register($data)
    {
        $sql = "INSERT INTO T_USER_USR VALUES(DEFAULT,?,?,?,?,?,?,?)";
        $query = $this->db->query($sql, array($data['login'], $data['mail'], $data['name'], $data['firstname'], hash('sha1', $data['pass']), $data['level'], $data['avatar']));
    }
}
