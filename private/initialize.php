<?php

define("APP_ROOT", dirname(dirname(__FILE__)));
define("PRIVATE_PATH", APP_ROOT . "/private");
define("PUBLIC_PATH", APP_ROOT . "/public");
define("SMARTY_PATH", APP_ROOT . "/Smarty");

require_once PRIVATE_PATH . "/vendor/autoload.php";
require_once PRIVATE_PATH . "/security/security.php";
require_once PRIVATE_PATH . "/throttle/throttle_functions.php";
require_once PRIVATE_PATH . "/config/config.php";
require_once PRIVATE_PATH . '/pdo_blog/pdo_blog_functions.php';
require_once SMARTY_PATH . '/libs/Smarty.class.php';



$smarty = new Smarty();
