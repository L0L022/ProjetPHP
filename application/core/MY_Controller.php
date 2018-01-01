<?php  if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class MY_Controller extends CI_Controller
{
    protected $data = array();

    public function __construct($page)
    {
        parent::__construct();

        $req_lang = $this->input->post('language');
        if ($req_lang !== null) {
            if (in_array($req_lang, array('english', 'french'))) {
                $_SESSION['language'] = $req_lang;
            } else {
                $_SESSION['language'] = $req_lang;
            }
        }

        $data = &$this->data;
        $data['page'] = $page;
        $data['user_id'] = &$_SESSION['user_id'];
        $data['language'] = &$_SESSION['language'];

        if (!isset($_SESSION['language'])) {
            if ($this->agent->accept_lang('fr')) {
                $_SESSION['language'] = 'french';
            } else {
                $_SESSION['language'] = 'english';
            }
        }
        $this->config->set_item('language', $_SESSION['language']);

        $this->_load_lang('profiler');
        $this->output->enable_profiler();
    }

    protected function _load_lang($langfile)
    {
        $this->lang->load($langfile, $_SESSION['language']);
    }

    protected function _redirect()
    {
        $uri = $this->input->post('redirect');
        if ($uri === null) {
            redirect('home');
        } else {
            redirect($uri);
        }
    }
}
