<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Connection extends CI_Controller {
 private $data = array("page" => "connection");

 public function index()
 {
  $data = &$this->data;
  $this->parser->parse("modules/connection.tpl", $data);
 }
}
