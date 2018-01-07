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

        if ($this->user_id !== null) {
            $this->load->helper('form');
            $this->load->library('form_validation');

            $rules = array(
                array(
                    'field' => 'comment',
                    'label' => 'Comment',
                    'rules' => 'required'
                )
            );
            $this->form_validation->set_rules($rules);

            if ($this->form_validation->run()) {
                $this->comment_model->insert(array('recipe' => $id, 'creator' => $this->user_id, 'text' => $this->input->post('comment')));
                redirect(current_url());
            } else {
                $data['errors'] = $this->form_validation->error_array();
            }
        }

        $data['id'] = $id;
        $data['recipe'] = $this->recipe_model->get_recipe($id);
        $data['categories'] = $this->recipe_model->get_categories($id);
        $data['ingredients'] = $this->recipe_model->get_ingredients($id);
        $data['comments'] = $this->recipe_model->get_comments($id);
        $this->parser->parse('modules/recipe/view.tpl', $data);
    }

    public function edit($id)
    {
        $this->load->model('join_category_recipe_model', 'jcr');
        $this->load->model('ingredient_model');
        $this->load->model('unit_model');
        $this->load->model('join_ingredient_recipe_unit_model', 'jiru_model');

        $new = $id === 'new';
        $model = &$this->recipe_model;

        if ($new) {
            $model_data['creator'] = $this->user_id;
        }

        $data = &$this->data;
        $data['id'] = $id;
        $data['new'] = $new;
        $data['categories'] = $this->category_model->get();
        $date['ingredients'] =  $this->ingredient_model->get();
        $data['units'] =  $this->unit_model->get();

        $columns_keys = array_keys($model->get_columns());
        $columns_keys[] = 'categories';
        $columns_keys[] = 'ingredients';

        $model_data['categories'] = array();
        $model_data['ingredients'] = array();

        if (!$new and count($_POST) === 0) {
            $model_data = $model->get(array('id' => $id))[0];

            foreach ($this->jcr->get(array('recipe' => $id)) as $r) {
                $model_data['categories'][] = $r['category'];
            }

            foreach ($this->jiru_model->get(array('recipe' => $id)) as $r) {
                $model_data['ingredients'][] = array('ingredient' => $r['ingredient'], 'unit' => $r['unit'], 'quantity' => $r['quantity']);
            }

            foreach ($columns_keys as $v) {
                $_POST[$v] = $model_data[$v];
            }
        }

        $this->load->helper('form');
        $this->load->library('form_validation');

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
                $id = $this->db->insert_id();
            } else {
                $model_data['id'] = $id;
                $model->update($model_data);
            }

            $this->jcr->delete(array('recipe' => $id));
            foreach ($model_data['categories'] as $c) {
                $this->jcr->insert(array('recipe' => $id, 'category' => $c));
            }

            $this->jiru_model->delete(array('recipe' => $id));
            foreach ($model_data['ingredients'] as $i) {
                $this->jiru_model->insert(array('recipe' => $id,
                'ingredient' => $i['ingredient'], 'unit' => $i['unit'],
                'quantity' => $i['quantity']));
            }

            $data['success'] = true;
        } else {
            $data['errors'] = $this->form_validation->error_array();
        }

        $this->parser->parse('modules/recipe/edit.tpl', $data);
    }

    public function illustration($id)
    {
        $model = &$this->recipe_model;
        $upload_path = './media/illustrations/';
        $illustration = $model->get(array('id' => $id))[0]['illustration'];

        $data = &$this->data;
        $data['id'] = $id;
        $data['illustration'] = &$illustration;

        if ($illustration !== '' and $this->input->post('remove') !== null) {
            if (file_exists($upload_path.$illustration)) {
                unlink($upload_path.$illustration);
            }
            $illustration = '';
            $model->update(array('id' => $id, 'illustration' => ''));
        }

        if ($this->input->post('upload') !== null) {
            $config['upload_path']          = $upload_path;
            $config['allowed_types']        = 'gif|jpg|jpeg|png|bmp|svg';
            $config['overwrite']            = true;
            $config['max_size']             = 1000;
            $config['encrypt_name']         = true;

            $this->load->library('upload', $config);

            if ($this->upload->do_upload('illustration')) {
                if ($illustration !== '' and file_exists($upload_path.$illustration)) {
                    unlink($upload_path.$illustration);
                }
                $illustration = $this->upload->data()['file_name'];
                $model->update(array('id' => $id, 'illustration' => $illustration));
                $data['success'] = true;
            } else {
                $data['errors'] = array($this->upload->display_errors('', ''));
            }
        }

        $this->parser->parse('modules/recipe/illustration.tpl', $data);
    }

    public function delete($id)
    {
        $model = &$this->recipe_model;

        $data = &$this->data;
        $data['id'] = $id;

        $this->load->helper('form');
        $this->load->library('form_validation');

        $rules = array(
            array(
                'field' => 'confirmation',
                'label' => 'Confirmation',
                'rules' => 'required'
            )
        );
        $this->form_validation->set_rules($rules);

        if ($this->form_validation->run()) {
            $model->delete(array('id' => $id));
            $data['success'] = true;
        } else {
            $data['errors'] = $this->form_validation->error_array();
        }

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
