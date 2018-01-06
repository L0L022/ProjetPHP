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
        $this->load->model('comment_model');
    }

    public function view($id)
    {
        $data = &$this->data;
        $data['id'] = $id;
        $data['recipe'] = $this->recipe_model->get(array('id' => $id))[0];
        $data['comments'] = $this->comment_model->get(array('recipe' => $id));
        $this->parser->parse('modules/recipe/view.tpl', $data);
    }

    public function edit($id)
    {
        $data = &$this->data;
        $data['id'] = $id;
        $data['recipe'] = $this->recipe_model->get(array('id' => $id))[0];
        $this->parser->parse('modules/recipe/edit.tpl', $data);
    }

    public function categories()
    {
        $data = &$this->data;
        $data['categories'] = $this->category_model->get();
        $this->parser->parse('modules/recipe/categories.tpl', $data);
    }

    public function category($id)
    {
        $data = &$this->data;
        $data['id'] = $id;
        $data['category'] = $this->category_model->get(array('id' => $id))[0];
        $data['recipes'] = $this->recipe_model->in_category($id);
        $this->parser->parse("modules/recipe/category.tpl", $data);
    }
}
