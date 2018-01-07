<?php if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Connection extends MY_Controller
{
    public function __construct()
    {
        parent::__construct('connection');
        $this->load->model('user_model');
    }

    public function index()
    {
        // regarder si il est déjà connecté

        $data = &$this->data;

        $this->load->helper('form');

        if ($this->input->post('disable_form_validation') === null) {
            $this->load->library('form_validation');
            $rules = array(
                array(
                    'field' => 'login',
                    'label' => 'identifiant',
                    'rules' => 'required'
                ),
                array(
                    'field' => 'password',
                    'label' => 'mot de passe',
                    'rules' => 'required'
                )
            );
            $this->form_validation->set_rules($rules);

            if ($this->form_validation->run()) {
                $user_id = $this->user_model->get_user_id($this->input->post('login'), $this->input->post('password'));
                if ($user_id !== null) {
                    $_SESSION['user_id'] = $user_id;
                    $this->_redirect();
                } else {
                    $data['errors'] = array('Identifiant ou mot de passe incorrect.');
                }
            } else {
                $data['errors'] = $this->form_validation->error_array();
            }
        }
        $this->parser->parse("modules/connection.tpl", $data);
    }

    public function logout()
    {
        $_SESSION['user_id'] = null;
        $this->_redirect();
    }
}
