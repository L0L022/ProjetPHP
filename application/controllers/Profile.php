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
            $recettes = array(array("id" => 0,"illustration" => "starter.jpg", "name" => "Ratatouille", "description" => "Pour commencer avec le sourire !"),
            array("id" => 10,"illustration" => "starter.jpg", "name" => "Galette", "description" => "Pour commencer avec le sourire !"),
            array("id" => 5,"illustration" => "starter.jpg", "name" => "Salade de France", "description" => "Pour commencer avec le sourire !"));

            $user = $this->user_model->get_user($_SESSION['user_id']);
            $user['recettes'] = $recettes;

            $data = &$this->data;
            $data['user']=$user;
            $this->parser->parse("modules/profile.tpl", $data);
        }
    }
}
