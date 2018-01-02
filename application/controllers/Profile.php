<?php if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Profile extends CI_Controller
{
    private $data = array("page" => "profile");

    public function index()
    {
        $recettes = array(array("id" => 0,"illustration" => "starter.jpg", "name" => "Ratatouille", "description" => "Pour commencer avec le sourire !"),
        array("id" => 10,"illustration" => "starter.jpg", "name" => "Galette", "description" => "Pour commencer avec le sourire !"),
        array("id" => 5,"illustration" => "starter.jpg", "name" => "Salade de France", "description" => "Pour commencer avec le sourire !"));
        $user = array('name' => 'Laurent', 'firstname' => 'DOITEAU', 'login' => 'napoleon789', 'mail' => 'laurentdoiteau@free.fr','pwd' => '#phpcestchiant', 'avatar' => 'Grosboule' , 'recettes' => $recettes );

        $data = &$this->data;
        $data['user']=$user;
        $this->parser->parse("modules/profile.tpl", $data);
    }
}
