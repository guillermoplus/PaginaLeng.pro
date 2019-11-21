<?php

session_start();

//$connect = mysqli_connect('localhost', 'root', '', 'skatebicy') or die('no se pudo conectar: ' . mysql_error());
$link = "mysql:host=localhost;dbname=skatebicy";
$userName = "root";
$password = "";

try{
  $conexion = new PDO($link, $userName, $password);
  //echo "conexion con base de datos exitosa";

}catch(PDOExcemption $e){
  //echo "Se ha producido un error".$e;

}

?>