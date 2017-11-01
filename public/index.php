<?php

require_once '../private/initialize.php';

use Library\Read\Read;

$username = "";

$cms = new Read();

if (!isset($_SESSION['user']->id)) {
    $smarty->assign('security_level', \NULL);
    $login_status = FALSE;
    $online_id = \NULL;
    $smarty->assign('user_id', NULL);
} else {
    $online_id = $_SESSION['user']->id;
    $login_status = TRUE;
    $smarty->assign('user_id', $_SESSION['user']->id);
    $smarty->assign('security_level', $_SESSION['user']->security_level);
    $username = $_SESSION['user']->username;
}
$content = $cms->read("index.php");
$smarty->assign('online_id', $online_id);
$smarty->assign('basename', $basename); // Title of Page:
$smarty->assign('login_status', $login_status); // Login Status:
$smarty->assign('username', $username); // User's login name if logged in:
$smarty->assign('content', $content); // CMS Threads for index.php:
//$smarty->testInstall();
//$smarty->caching=1;
$smarty->display('index_template.tpl');
