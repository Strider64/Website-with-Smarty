<?php

require_once '../private/initialize.php';

use Library\Database\Database as DB;
use Library\Email\Email;

$username = \NULL;
$success = "Contact Form";
$token = $_SESSION['token'];
$db = DB::getInstance();
$pdo = $db->getConnection();

if (!isset($_SESSION['user']->id)) {
    $smarty->assign('security_level', \NULL);
    $login_status = FALSE;
} else {
    $smarty->assign('security_level', $_SESSION['user']->security_level);
    $login_status = TRUE;
    $username = $_SESSION['user']->username;
}

$submit = filter_input(INPUT_POST, 'submit', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
if (isset($submit) && $submit === 'submit') {
    $token = filter_input(INPUT_POST, 'token', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    if (!empty($token)) {
        if (hash_equals($_SESSION['token'], $token)) {
            /* The Following to get response back from Google recaptcah */
            $url = "https://www.google.com/recaptcha/api/siteverify";

            $remoteServer = filter_input(INPUT_SERVER, 'REMOTE_ADDR', FILTER_SANITIZE_URL);
            $response = file_get_contents($url . "?secret=" . PRIVATE_KEY . "&response=" . \htmlspecialchars($_POST['g-recaptcha-response']) . "&remoteip=" . $remoteServer);
            $recaptcha_data = json_decode($response);
            /* The actual check of the recaptcha */
            if (isset($recaptcha_data->success) && $recaptcha_data->success === TRUE) {
                $data['name'] = filter_input(INPUT_POST, 'name', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
                $data['email'] = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
                $data['phone'] = filter_input(INPUT_POST, 'phone', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
                $data['website'] = filter_input(INPUT_POST, 'website', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
                $data['reason'] = filter_input(INPUT_POST, 'reason', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
                $data['comments'] = filter_input(INPUT_POST, 'comments', FILTER_SANITIZE_FULL_SPECIAL_CHARS);

                $send = new Email($data);
            } else {
                $success = "You're not a human!"; // Not of a production server:
            }
        } else {
            // Log this as a warning and keep an eye on these attempts
        }
    }
}
$smarty->assign('username', $username);
$smarty->assign('login_status', $login_status); // Login Status:
$smarty->assign('token', $token);
$smarty->assign('success', $success);
$smarty->caching = 1;
$smarty->display('contact_template.tpl');


