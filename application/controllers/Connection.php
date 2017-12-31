<?php if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Connection extends CI_Controller
{
    private $data = array("page" => "connection");

    public function __construct()
    {
        parent::__construct();
        $this->load->model('user_model');
    }

    public function index()
    {
        $data = &$this->data;

        if ($this->input->post('logout') != null) {
        } else {
            $this->load->helper(array('form', 'url'));
            $this->load->library('form_validation');

            $rules = array(
                array(
                    'field' => 'email',
                    'label' => 'Email',
                    'rules' => 'required'
                ),
                array(
                    'field' => 'password',
                    'label' => 'Password',
                    'rules' => 'required'
                )
            );
            $this->form_validation->set_rules($rules);

            if ($this->form_validation->run()) {
                if ($this->user_model->is_valid_login($this->input->post('email'), $this->input->post('password'))) {
                    redirect('profile');
                } else {
                    $data['errors'] = array('Wrong login.');
                }
            } else {
                $data['errors'] = $this->form_validation->error_array();
            }
            $this->parser->parse("modules/connection.tpl", $data);
        }
    }
}
