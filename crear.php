<?php
 try{
 
    include("conexion.php");
     if($_POST){
        $codCliente = $_POST['codCliente'];
        $cedula = $_POST['cedula'];
        $nombre = $_POST['nombre'];
        $apellido1 = $_POST['apellido1'];
        $apellido2 = $_POST['apellido2'];
        $direccion = $_POST['direccion'];
        $email = $_POST['email'];
        $save = "INSERT INTO clientes (codCliente, cedula, nombre, apellido1, apellido2, direccion, email) VALUES(?, ?, ?, ?, ?, ?, ?)";
        $guardarDatos = $conexion->prepare($save);
        $guardarDatos->execute(array($codCliente, $cedula, $nombre, $apellido1, $apellido2, $direccion, $email)); 
     }

     $_SESSION['message'] = 'date saved succesfully';
     $_SESSION['message_type'] = 'succes';

     header("location: index.php");
 }catch(Exception $e){
    echo "Se ha producido un error".$e;

}

?>
