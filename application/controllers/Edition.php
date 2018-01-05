<?php if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Edition extends MY_Controller
{
    public function __construct()
    {
        parent::__construct('edition');
        $this->load->model('user_model');
    }

    public function index()
    {
        $data = &$this->data;
        $this->parser->parse("modules/edition.tpl", $data);
    }
}
