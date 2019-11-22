<?php

include('conexion.php');
$db = new Conexion();

$result = $db->consulta("SELECT * FROM clientes");

?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <title>SkateBicy Rental</title>

    <?php
    include('estilos.php');
    ?>
</head>
<body>

<header>
    <p class="logo">SkateBicy Rental</p>
    <nav class="navegacion">
        <ul class="menu">
            <li><a href="">inicio</a></li>
            <li><a href="">Sobre Nosotros</a>
                <ul class="smenu">
                    <li><a href="">Quienes Somos</a></li>
                    <li><a href="">Porque Elegir Nuestros Servicios</a></li>
                </ul>
            </li>
            <li><a href="">Nuestros Servicios</a>
                <ul class="smenu">
                    <li><a href="">Bicicletas</a></li>
                    <li><a href="">Patinetas</a></li>
                </ul>
            </li>
            <li><a href="">contactanos</a>
                <ul class="smenu">
                    <li><a href="">Correo</a></li>
                    <li><a href="">Telefono de Contacto</a></li>
                </ul>
            </li>
        </ul>
    </nav>

    <div class="contenedor" id="contenedor-titulo-flex">
        <div class="contenedor-titulo">
            <h1>Skatebicy Rental</h1>
            <h2>Siempre a tu servicio</h2>
            <a href="registro.php">Regístrate</a>
            <a href="login.php">Iniciar sesión</a>
        </div>
    </div>

</header>

<?php
include('scripts.php');
?>

</body>
</html>
