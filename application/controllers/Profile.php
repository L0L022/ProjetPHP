<?php if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Profile extends MY_Controller
{
    public function __construct()
    {
        parent::__construct('profile');
        $this->load->model('user_model');
    }

    public function index()
    {
        if ($_SESSION['user_id'] === null) {
            redirect('connection');
        } else {
            $recettes = array(array('id' => 0, 'name' => 'Galette'),array('id' => 1, 'name' => 'Ratatouille'),array('id' => 3, 'name' => 'Salade de france'));

            $user = $this->user_model->get_user($_SESSION['user_id']);
            $user['recettes'] = $recettes;

            $data = &$this->data;
            $data['user']=$user;
            $this->parser->parse("modules/profile.tpl", $data);
        }
    }
}
