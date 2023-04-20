<?php
define('host', 'localhost');
define('name', 'root');
define('password','');
define('db','bankdatabase');

$conn=mysqli_connect(host,name,password,db) or die('Connection failed' .mysqli_error($conn));

?>
