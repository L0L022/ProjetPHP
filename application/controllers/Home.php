<?php  if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Home extends MY_Controller
{
    public function __construct()
    {
        parent::__construct('home');
    }

    public function index()
    {
        $this->load->model('recipe_model');

        $data = &$this->data;
        $data['recipes'] = $this->recipe_model->get_rand_recipe(3);
        $this->parser->parse("modules/home.tpl", $data);
    }
}
