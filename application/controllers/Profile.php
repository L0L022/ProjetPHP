<?php if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Profile extends CI_Controller
{
    private $data = array("page" => "profile");

    public function index()
    {
        $recettes = array(array('id' => 0, 'name' => 'Galette'),array('id' => 1, 'name' => 'Ratatouille'),array('id' => 3, 'name' => 'Salade de france'));
        $user = array('name' => 'Laurent', 'firstname' => 'DOITEAU', 'login' => 'napoleon789', 'mail' => 'laurentdoiteau@free.fr','pwd' => '#phpcestchiant', 'avatar' => 'Grosboule' , 'recettes' => $recettes );

        $data = &$this->data;
        $data['user']=$user;
        $this->parser->parse("modules/profile.tpl", $data);
    }
}
