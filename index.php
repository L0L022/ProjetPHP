<?php

require_once("application/libraries/autoload.php");

require_once("config.inc.php");

$data = array();

$current_page = $_GET['page'];
if (!in_array($current_page, $_PAGES)) {
    if ($current_page=='') {
        $current_page=$HOME_PAGE;
    } else {
        $current_page=$ERROR_404;
    }
}
require_once("application/modules/".$current_page.".inc.php");
$smarty=new Smarty();
$smarty->caching = false;
$smarty->cache_lifetime=120;
$smarty->setTemplateDir('application/views/');
foreach ($data as $key => $value) {
    $smarty->assign($key, $value);
}
$smarty->display('modules/'.$current_page.'.tpl');
//Doc display & cache optimisation
