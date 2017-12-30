<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Connection extends CI_Controller {
 private $data = array("page" => "connection");

 public function __construct()
 {
         parent::__construct();
         $this->load->model('user_model');
 }

 public function index()
 {
  $data = &$this->data;

  if (isset($_POST['connection'])) {

   if ($this->user_model->is_valid_login($_POST['email'], $_POST['password'])) {
    redirect('profile');
   } else {
    $data['error_message'] = 'Wrong login.';
   }
  } elseif (isset($_POST['logout'])) {
   $data['error_message'] = 'You are logout.';
  }
   $this->parser->parse("modules/connection.tpl", $data);
 }
}
