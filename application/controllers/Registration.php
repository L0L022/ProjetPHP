<?php if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Registration extends CI_Controller
{
    private $data = array("page" => "registration");

    public function __construct()
    {
        parent::__construct();
        $this->load->model('user_model');
    }

    public function index()
    {
        $data = &$this->data;

        $this->load->helper(array('form', 'url'));
        $this->load->library('form_validation');

        $rules = array(
            array(
                'field' => 'login',
                'label' => 'Login',
                'rules' => 'required'
            ),
            array(
                'field' => 'mail',
                'label' => 'Email',
                'rules' => 'required|valid_email'
            ),
            array(
                'field' => 'name',
                'label' => 'Name',
                'rules' => 'required'
            ),
            array(
                'field' => 'firstname',
                'label' => 'Firstname',
                'rules' => 'required'
            ),
            array(
                'field' => 'avatar',
                'label' => 'Avatar',
                'rules' => 'required'
            ),
            array(
                'field' => 'pass',
                'label' => 'Password',
                'rules' => 'required'
            ),
            array(
                'field' => 'pass2',
                'label' => 'Password confirmation',
                'rules' => 'required|matches[pass]'
            )
        );
        $this->form_validation->set_rules($rules);

        if ($this->form_validation->run()) {
            foreach (array('login', 'mail', 'name', 'firstname', 'pass', 'avatar') as $v) {
                $user[$v] = $this->input->post($v);
            }
            $user['level'] = 1;

            if ($this->user_model->register($user)) {
                $data['errors'] = array('Tout est ok');
            } else {
                $data['errors'] = array('Prob de BDD');
            }
        } else {
            $data['errors'] = $this->form_validation->error_array();
        }

        $this->parser->parse("modules/registration.tpl", $data);
    }
}
