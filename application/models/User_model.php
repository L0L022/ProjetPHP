<?php  if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}
require_once('DB_model.php');

class User_model extends DB_model
{
    private $pass_hash_algo = 'sha1';

    public function __construct()
    {
        parent::__construct('T_USER_USR', array('id' => 'USR_ID', 'login' => 'USR_LOGIN', 'mail' => 'USR_MAIL', 'name' => 'USR_NAME', 'firstname' => 'USR_FIRSTNAME', 'pass' => 'USR_PASS', 'level' => 'USR_LEVEL', 'avatar' => 'USR_AVATAR'));
    }

    public function get_user($id)
    {
        return $this->get(array('id' => $id))[0];
    }

    public function get_user_id($login, $pass)
    {
        // utiliser build request ?
        $sql = "SELECT USR_ID AS 'id' FROM T_USER_USR WHERE USR_PASS = ? AND (USR_LOGIN = ? OR USR_MAIL = ?)";
        $query = $this->db->query($sql, array(hash($this->pass_hash_algo, $pass), $login, $login));

        if ($query->num_rows() === 1) {
            return $query->row()->id;
        } else {
            return null;
        }
    }

    public function register($data)
    {
        $data['pass'] = hash($this->pass_hash_algo, $data['pass']);
        $this->insert($data);
    }

    public function update_pass($id, $pass)
    {
        $this->update(array('id' => $id, 'pass' => hash($this->pass_hash_algo, $pass)));
    }

    public function login_exists($login)
    {
        return count($this->get(array('login' => $login))) !== 0;
    }

    public function mail_exists($mail)
    {
        return count($this->get(array('mail' => $mail))) !== 0;
    }
}
