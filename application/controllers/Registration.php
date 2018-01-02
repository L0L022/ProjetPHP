<?php if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Registration extends MY_Controller
{
    public function __construct()
    {
        parent::__construct('registration');
        $this->load->model('user_model');
    }

    public function index()
    {
        $data = &$this->data;

        $this->load->helper('form');
        $this->load->library('form_validation');
        $this->_load_lang('form_validation');

        $rules = array(
            array(
                'field' => 'login',
                'label' => 'Login',
                'rules' => 'required|callback_login_check'
            ),
            array(
                'field' => 'mail',
                'label' => 'Email',
                'rules' => 'required|valid_email|callback_mail_check'
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

    public function login_check($str)
    {
        if ($this->user_model->login_exists($str)) {
            $this->form_validation->set_message('login_check', 'The {field} field is not unique.');
            return false;
        } else {
            return true;
        }
    }

    public function mail_check($str)
    {
        if ($this->user_model->mail_exists($str)) {
            $this->form_validation->set_message('mail_check', 'The {field} field is not unique.');
            return false;
        } else {
            return true;
        }
    }
}
