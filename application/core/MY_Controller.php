<?php  if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class MY_Controller extends CI_Controller
{
    protected $data = array();
    protected $user_id;

    public function __construct($page)
    {
        parent::__construct();
        $this->user_id = &$_SESSION['user_id'];

        $data = &$this->data;
        $data['page'] = $page;
        $data['user_id'] = &$_SESSION['user_id'];

        // $this->output->enable_profiler();
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
