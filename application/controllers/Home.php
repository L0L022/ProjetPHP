<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {
	private $data = array("page" => "home");

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
