<?php  if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class User_model extends CI_Model
{
    public function __construct()
    {
        $this->load->database();
    }

    public function get_user($id)
    {
        $sql = "SELECT USR_ID AS 'id', USR_LOGIN AS 'login', USR_MAIL AS 'mail',
                       USR_NAME AS 'name', USR_FIRSTNAME AS 'firstname',
                       USR_LEVEL AS 'level', USR_AVATAR AS 'avatar'
                FROM T_USER_USR WHERE USR_ID = ?";
        $query = $this->db->query($sql, array($id));
        return $row = $query->row_array();
    }

    public function get_user_id($login, $pass)
    {
        $sql = "SELECT USR_ID AS 'id' FROM T_USER_USR WHERE USR_PASS = ? AND (USR_LOGIN = ? OR USR_MAIL = ?)";
        $query = $this->db->query($sql, array(hash('sha1', $pass), $login, $login));

        if ($query->num_rows() === 1) {
            return $query->row()->id;
        } else {
            return null;
        }
    }

    public function register($data)
    {
        $sql = "INSERT INTO T_USER_USR VALUES(DEFAULT,?,?,?,?,?,?,?)";
        $query = $this->db->query($sql, array($data['login'], $data['mail'], $data['name'], $data['firstname'], hash('sha1', $data['pass']), $data['level'], $data['avatar']));
    }
}
