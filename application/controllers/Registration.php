<?php if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Registration extends CI_Controller
{
    private $data = array("page" => "registration");

    public function index()
    {
        $user = array('name' => 'Laurent', 'firstname' => 'DOITEAU');

        $data = &$this->data;
        $data['user']=$user;
        $this->parser->parse("modules/profile.tpl", $data);
    }
}
