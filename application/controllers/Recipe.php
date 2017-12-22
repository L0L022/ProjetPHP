<?php if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Recipe extends CI_Controller
{
    private $data = array("page" => "recipe");

    public function index()
    {
        $categories = array(array("id" => 0, "illustration" => "starter.jpg", "name" => "Entrées", "description" => "Pour commencer avec le sourire !")
                           ,array("id" => 1, "illustration" => "main_course.jpg", "name" => "Plats", "description" => "Pour avoir le ventre bien plein !")
                           ,array("id" => 2, "illustration" => "dessert.jpg", "name" => "Desserts", "description" => "Pour finir en beauté !"));

        $data = &$this->data;
        $data['categories'] = $categories;
        $this->parser->parse("modules/recipe.tpl", $data);
    }

    public function id($id = null)
    {
        $data = &$this->data;
        if (is_numeric($id)) {
            $recipe=array("id" => 6, "date_create" => "6/12/2017", "date_modif" => "6/12/2017", "date_validation" => "6/12/2017"
                         ,"title" => "Ratatouille", "description" => "Pour commencer avec le sourire !"
                         ,"difficulty" => 3, "result_label" => "personnes", "result_amount" => 5, "time_preparation" => 560
                         ,"explanation" => "LOL","illustration" => "main_course.jpg","time_cooking" => 260, "time_rest" => 0);
            $data['idr'] = $id;
            $data['recipe'] = $recipe;
        }
        $this->parser->parse("modules/recipe.tpl", $data);
    }

    public function category($id = null)
    {
        $starter = array(array("id" => 5,"illustration" => "starter.jpg", "name" => "Salade", "description" => "Pour commencer avec le sourire !")
                        ,array("id" => 1, "illustration" => "starter.jpg", "name" => "Fromage & salade", "description" => "Pour commencer avec le sourire !")
                        ,array("id" => 0, "illustration" => "starter.jpg", "name" => "Cake olive", "description" => "Pour commencer avec le sourire !"));

        $main_course = array(array("id" => 6,"illustration" => "main_course.jpg", "name" => "Ratatouille", "description" => "Pour commencer avec le sourire !")
                            ,array("id" => 1, "illustration" => "main_course.jpg", "name" => "Frite & steak", "description" => "Pour commencer avec le sourire !")
                            ,array("id" => 0, "illustration" => "main_course.jpg", "name" => "Pizza", "description" => "Pour commencer avec le sourire !"));

        $dessert = array(array("id" => 7,"illustration" => "dessert.jpg", "name" => "Mugcake", "description" => "Pour commencer avec le sourire !")
                        ,array("id" => 1, "illustration" => "dessert.jpg", "name" => "Crème aux oeufs", "description" => "Pour commencer avec le sourire !")
                        ,array("id" => 0, "illustration" => "dessert.jpg", "name" => "Chococo", "description" => "Pour commencer avec le sourire !"));

        $recipes = array(0 => $starter, 1 => $main_course, 2 => $dessert);

        $data = &$this->data;
        $data['idc'] = $id;
        $data['recipes'] = $recipes;
        $this->parser->parse("modules/recipe.tpl", $data);
    }
}
