<?php
session_start();
//header("Content-Type: text/html; charset=utf-8");
define("DBHOST", "arctos.dima.hu");
define("DBUSER", "fere");
define("DBPASS", "Anima680");
define("DBNAME", "fotos");
$dbconn = @mysqli_connect(DBHOST, DBUSER, DBPASS, DBNAME) or die('Kapcsolódási hiba (' . mysqli_connect_errno() . ') ' . mysqli_connect_error());
mysqli_query($dbconn, "SET NAMES utf8");

define ('ROOT_PATH', realpath(dirname(__FILE__)));
//define('DEFAULT_URL', 'http://iskola/_fotos/');
?>