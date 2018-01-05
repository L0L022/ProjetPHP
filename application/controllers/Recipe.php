<?php if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Recipe extends MY_Controller
{
    public function __construct()
    {
        parent::__construct('recipe');
        $this->load->model('category_model');
        $this->load->model('recipe_model');
    }

    public function index()
    {
        $data = &$this->data;
        $data['categories'] = $this->category_model->get();
        $this->parser->parse("modules/recipe.tpl", $data);
    }

    public function id($id = null)
    {
        $data = &$this->data;
        if (is_numeric($id)) {
            // $recipe=array("id" => 6, "date_create" => "6/12/2017", "date_modif" => "6/12/2017", "date_validation" => "6/12/2017"
            //              ,"title" => "Ratatouille", "description" => "Pour commencer avec le sourire !"
            //              ,"difficulty" => 3, "result_label" => "personnes", "result_amount" => 5, "time_preparation" => 560
            //              ,"explanation" => "LOL","illustration" => "main_course.jpg","time_cooking" => 260, "time_rest" => 0);
            $data['idr'] = $id;
            $data['recipe'] = $this->recipe_model->get(array('id' => $id))[0];
        }
        $this->parser->parse("modules/recipe.tpl", $data);
    }

    public function category($id = null)
    {
        $data = &$this->data;
        $data['idc'] = $id;
        $data['recipes'] = $this->recipe_model->in_category($id);
        $this->parser->parse("modules/recipe.tpl", $data);
    }
}
