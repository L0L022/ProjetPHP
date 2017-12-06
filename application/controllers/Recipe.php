<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Recipe extends CI_Controller {
 private $data = array("page" => "recipe");

 public function index($id = null)
 {
  $data = &$this->data;
  if (is_numeric($id)) {
   $data['idr'] = $id;
  } else {
   $categories = array(array("id" => 0, "illustration" => "starter.jpg", "name" => "Entrées", "description" => "Pour commencer avec le sourire !")
   , array("id" => 1, "illustration" => "main_course.jpg", "name" => "Plats", "description" => "Pour avoir le ventre bien plein !")
   , array("id" => 2, "illustration" => "dessert.jpg", "name" => "Desserts", "description" => "Pour finir en beauté !"));
   $data['categories'] = $categories;
  }
  $this->parser->parse("modules/recipe.tpl", $data);
 }

 public function category($id = null)
 {
  $data = &$this->data;
  $data['idc'] = $id;
  $this->parser->parse("modules/recipe.tpl", $data);
 }
}
