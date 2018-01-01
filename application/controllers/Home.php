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
        $alea = array();

        for ($i=0; $i < 3; $i++) {
            $alea[$i]=rand()*100;
        }

        $data = &$this->data;
        $data['alea']=$alea;
        $this->parser->parse("modules/home.tpl", $data);
    }
}
