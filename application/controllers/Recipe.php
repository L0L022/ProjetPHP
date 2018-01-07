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
        $new = $id === 'new';
        $model = &$this->recipe_model;

        if ($new) {
            $model_data['creator'] = $this->user_id;
        }

        $data = &$this->data;
        $data['id'] = $id;
        $data['new'] = $new;

        $columns_keys = array_keys($model->get_columns());

        if (!$new and count($_POST) === 0) {
            $model_data = $model->get(array('id' => $id))[0];
            foreach ($columns_keys as $v) {
                $_POST[$v] = $model_data[$v];
            }
        }

        $this->load->helper('form');
        $this->load->library('form_validation');
        $this->_load_lang('form_validation');

        $rules = array(
                 array(
                     'field' => 'title',
                     'label' => 'Title',
                     'rules' => "required"
                 ),
                 array(
                     'field' => 'description',
                     'label' => 'Description',
                     'rules' => "required"
                 ),
                 array(
                     'field' => 'explanation',
                     'label' => 'Explanation',
                     'rules' => 'required'
                 ),
                 array(
                     'field' => 'result_amount',
                     'label' => 'Result amount',
                     'rules' => 'required'
                 )
             );

        // si admin check le niveau

        $this->form_validation->set_rules($rules);

        if ($this->form_validation->run()) {
            foreach ($columns_keys as $v) {
                if ($this->input->post($v) !== null) {
                    $model_data[$v] = $this->input->post($v);
                }
            }

            if ($new) {
                $model->insert($model_data);
            } else {
                $model_data['id'] = $id;
                $model->update($model_data);
            }
            $data['success'] = true;
        } else {
            $data['errors'] = $this->form_validation->error_array();
        }

        $this->parser->parse('modules/recipe/edit.tpl', $data);
    }

    public function delete($id)
    {
        $data = &$this->data;
        $data['id'] = $id;
        $data['recipe'] = $this->recipe_model->get(array('id' => $id))[0];
        $this->parser->parse('modules/recipe/delete.tpl', $data);
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
