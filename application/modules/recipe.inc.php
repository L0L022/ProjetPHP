<?php

if (is_numeric($_GET['idc'])) {
    $data['idc'] = $_GET['idc'];

    $entree = array(array("id" => 5,"illustration" => "starter.jpg", "name" => "Salade", "description" => "Pour commencer avec le sourire !"),
    array("id" => 1, "illustration" => "starter.jpg", "name" => "Fromage & salade", "description" => "Pour commencer avec le sourire !"),
    array("id" => 0, "illustration" => "starter.jpg", "name" => "Cake olive", "description" => "Pour commencer avec le sourire !"));

    $plat = array(array("id" => 6,"illustration" => "main_course.jpg", "name" => "Ratatouille", "description" => "Pour commencer avec le sourire !"),
    array("id" => 1, "illustration" => "main_course.jpg", "name" => "Frite & steak", "description" => "Pour commencer avec le sourire !"),
    array("id" => 0, "illustration" => "main_course.jpg", "name" => "Pizza", "description" => "Pour commencer avec le sourire !"));

    $dessert = array(array("id" => 7,"illustration" => "dessert.jpg", "name" => "Mugcake", "description" => "Pour commencer avec le sourire !"),
    array("id" => 1, "illustration" => "dessert.jpg", "name" => "Crème aux oeufs", "description" => "Pour commencer avec le sourire !"),
    array("id" => 0, "illustration" => "dessert.jpg", "name" => "Chococo", "description" => "Pour commencer avec le sourire !"));

    $recipesl = array(0 => $entree,1 => $plat,2 => $dessert);

    $data['recipesl'] = $recipesl;
} else {
    $categories = array(array("id" => 0, "illustration" => "starter.jpg", "name" => "Entrées", "description" => "Pour commencer avec le sourire !")
 , array("id" => 1, "illustration" => "main_course.jpg", "name" => "Plats", "description" => "Pour avoir le ventre bien plein !")
 , array("id" => 2, "illustration" => "dessert.jpg", "name" => "Desserts", "description" => "Pour finir en beauté !"));
    $data['categories'] = $categories;
}
