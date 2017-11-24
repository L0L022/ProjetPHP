<?php

if (!empty($_GET['idc']))
{
 $data['idc'] = $_GET['idc'];
} else {
 $categories = array(array("id" => 0, "illustration" => "starter.jpg", "name" => "Entrées", "description" => "Pour commencer avec le sourire !")
 , array("id" => 1, "illustration" => "main_course.jpg", "name" => "Plats", "description" => "Pour avoir le ventre bien plein !")
 , array("id" => 2, "illustration" => "dessert.jpg", "name" => "Desserts", "description" => "Pour finir en beauté !"));
 $data['categories'] = $categories;
}
