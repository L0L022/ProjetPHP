<?php  if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

abstract class DB_model extends CI_Model
{
    protected $table = 'table name';
    protected $columns = array('user column name' => 'real column name');

    public function __construct($table, $columns)
    {
        $this->table = $table;
        $this->columns = $columns;

        $this->load->database();
    }

    public function get_table()
    {
        return $this->table;
    }

    public function get_columns()
    {
        return $this->columns;
    }

    public function id_exists($id)
    {
        $this->db->select($this->columns['id']);
        $this->db->from($this->table);
        $this->db->where($this->columns['id'], $id);
        $query = $this->db->get();

        if ($query->num_rows() > 1) {
            show_error('id is not unique.');
        }
        return $query->num_rows() === 1;
    }

    public function to_real_name($data)
    {
        $d = array();
        foreach ($data as $key => $value) {
            if (array_key_exists($key, $this->columns)) {
                $d[$this->table.'.'.$this->columns[$key]] = $value;
            }
        }
        return $d;
    }

    public function get_select($prefix = '')
    {
        $select = '';
        foreach ($this->columns as $key => $value) {
            $select .= "$this->table.$value as $prefix$key,";
        }
        return $select;
    }

    public function get($data = array())
    {
        $this->db->select($this->get_select());
        $this->db->from($this->table);
        $this->db->where($this->to_real_name($data));
        $query = $this->db->get();
        return $query->result_array();
    }

    public function insert($data)
    {
        print_r($data);
        $this->db->set($this->to_real_name($data));
        if ($this->db->insert($this->table) === false) {
            show_error('Model, impossible de rajouter la bdd.');
        }
    }

    public function update($data)
    {
        if (!$this->id_exists($data['id'])) {
            show_error('Model, impossible de mettre à jour, id existe pas.');
        }
        $this->db->set($this->to_real_name($data));
        $this->db->where($this->columns['id'], $data['id']);
        if ($this->db->update($this->table) === false) {
            show_error('Model, impossible de mettre à jour la bdd.');
        }
    }

    public function delete($data = array())
    {
        $this->db->where($this->to_real_name($data));
        if ($this->db->delete($this->table) === false) {
            show_error('Model, impossible de supprimer une ligne de la bdd.');
        }
    }
}
