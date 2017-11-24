<?php

$_PAGES = array('home', 'connection', 'profile', 'recipe');

define('DB_HOST', 'mysql-laurent.alwaysdata.net');
define('DB_PORT', '3306');
define('DB_DATABASE', 'laurent_cuisine');
define('DB_USERNAME', 'laurent');
define('DB_PASSWORD', '2309014416d');

try {
    $PDO_BDD = new PDO('mysql:host='.DB_HOST.';port='.DB_PORT.';dbname='.DB_DATABASE, DB_USERNAME, DB_PASSWORD);
    $PDO_BDD->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $PDO_BDD->exec("SET NAMES 'utf8'");
} catch (Exception $e) {
    echo "Erreur : ".$e->getMessage()."<br/>";
    echo "N° : ".$e->getCode();
    exit();
}
$HOME_PAGE = 'home';
$ERROR_404 = 'home';
