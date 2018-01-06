<?php if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Profile extends MY_Controller
{
    public function __construct()
    {
        parent::__construct('profile');
        $this->load->model('user_model');
    }

    public function view($id)
    {
        $this->load->model('recipe_model');

        $user = $this->user_model->get_user($id);
        $user['recettes'] = $this->recipe_model->get(array('creator' => $id));

        $data = &$this->data;
        $data['id'] = $id;
        $data['user'] = $user;
        $this->parser->parse('modules/profile_view.tpl', $data);
    }

    public function edit($id)
    {
        $new_profile = $id === 'new';

        $data = &$this->data;
        $data['id'] = $id;
        $data['new_profile'] = $new_profile;

        if (!$new_profile and count($_POST) === 0) {
            $user = $this->user_model->get_user($id);
            foreach (array('login', 'mail', 'name', 'firstname', 'level') as $v) {
                $_POST[$v] = $user[$v];
            }
        }

        $this->load->helper('form');
        $this->load->library('form_validation');
        $this->_load_lang('form_validation');

        $rules = array(
             array(
                 'field' => 'login',
                 'label' => 'Login',
                 'rules' => "required|callback_login_check[$id]"
             ),
             array(
                 'field' => 'mail',
                 'label' => 'Email',
                 'rules' => "required|valid_email|callback_mail_check[$id]"
             ),
             array(
                 'field' => 'name',
                 'label' => 'Name',
                 'rules' => 'required'
             ),
             array(
                 'field' => 'firstname',
                 'label' => 'Firstname',
                 'rules' => 'required'
             )
         );

        if ($new_profile) {
            $rules += array(
                'field' => 'pass',
                'label' => 'Password',
                'rules' => 'required'
            );
            $rules += array(
                'field' => 'pass2',
                'label' => 'Password confirmation',
                'rules' => 'required|matches[pass]'
            );
        }

        // si admin check le niveau

        $this->form_validation->set_rules($rules);

        if ($this->form_validation->run()) {
            foreach (array('login', 'mail', 'name', 'firstname') as $v) {
                $user[$v] = $this->input->post($v);
            }

            if ($new_profile) {
                $user['level'] = 1;
                $user['pass'] = $this->input->post('pass');
                $this->user_model->register($user);
                $data['success'] = 'Profil créé.';
            } else {
                $user['id'] = $id;
                $this->user_model->update($user);
                $data['success'] = 'Profil mis à jour.';
            }
        } else {
            $data['errors'] = $this->form_validation->error_array();
        }

        $this->parser->parse('modules/profile_edit.tpl', $data);
    }

    public function login_check($str, $id)
    {
        if ($this->user_model->login_unique($str, $id)) {
            $this->form_validation->set_message('login_check', 'The {field} field is not unique.');
            return false;
        } else {
            return true;
        }
    }

    public function mail_check($str, $id)
    {
        if ($this->user_model->mail_unique($str, $id)) {
            $this->form_validation->set_message('mail_check', 'The {field} field is not unique.');
            return false;
        } else {
            return true;
        }
    }

    public function avatar($id)
    {
        $user = $this->user_model->get_user($id);
        $avatar = $user['avatar'];

        $data = &$this->data;
        $data['id'] = $id;
        $data['avatar'] = &$avatar;

        if ($avatar !== '' and $this->input->post('remove') !== null) {
            if (file_exists('./media/avatars/'.$avatar)) {
                unlink('./media/avatars/'.$avatar);
            }
            $avatar = '';
            $this->user_model->update(array('id' => $id, 'avatar' => ''));
        }

        if ($this->input->post('upload') !== null) {
            $config['upload_path']          = './media/avatars/';
            $config['allowed_types']        = 'gif|jpg|png';
            $config['overwrite']            = true;
            $config['max_size']             = 1000;
            $config['encrypt_name']         = true;

            $this->load->library('upload', $config);

            if ($this->upload->do_upload('avatar')) {
                if ($avatar !== '' and file_exists('./media/avatars/'.$avatar)) {
                    unlink('./media/avatars/'.$avatar);
                }
                $avatar = $this->upload->data()['file_name'];
                $this->user_model->update(array('id' => $id, 'avatar' => $avatar));
                $data['success'] = 'Avatar mis à jour.';
            } else {
                $data['errors'] = array($this->upload->display_errors('', ''));
            }
        }

        $this->parser->parse('modules/profile_avatar.tpl', $data);
    }

    public function password($id)
    {
        $data = &$this->data;
        $data['id'] = $id;

        $this->load->helper('form');
        $this->load->library('form_validation');
        $this->_load_lang('form_validation');

        $rules = array(
            array(
                'field' => 'pass',
                'label' => 'Password',
                'rules' => 'required'
            ),
            array(
                'field' => 'pass2',
                'label' => 'Password confirmation',
                'rules' => 'required|matches[pass]'
            )
        );
        $this->form_validation->set_rules($rules);

        if ($this->form_validation->run()) {
            $this->user_model->update_pass($id, $this->input->post('pass'));
            $data['success'] = 'Mot de passe mis à jour.';
        } else {
            $data['errors'] = $this->form_validation->error_array();
        }

        $this->parser->parse('modules/profile_password.tpl', $data);
    }

    public function delete($id)
    {
        $data = &$this->data;
        $data['id'] = $id;

        $this->load->helper('form');
        $this->load->library('form_validation');
        $this->_load_lang('form_validation');

        $rules = array(
            array(
                'field' => 'confirmation',
                'label' => 'Confirmation',
                'rules' => 'required'
            )
        );
        $this->form_validation->set_rules($rules);

        if ($this->form_validation->run()) {
            $this->user_model->delete(array('id' => $id));
            $data['success'] = 'Compte supprimé.';
        } else {
            $data['errors'] = $this->form_validation->error_array();
        }

        $this->parser->parse('modules/profile_delete.tpl', $data);
    }
}
