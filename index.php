<?php

session_start();

include('conexion.php');
include('usuario.php');
$db = new Conexion();
$login = new Usuario($db);

$vehiculos = $db->consulta("SELECT * FROM vehiculo as v WHERE v.`disponibilidad` = 1");

if (isset($_SESSION['usuario'])) {
    $usuario = $_SESSION['usuario'];

    if (isset($_GET['accion']) and $_GET['accion'] == 'salir') {
        $login->cerrarSesion();
    }
}


?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.5">
    <title>Skatebicy Rental</title>

    <?php
    include('estilos.php');
    ?>


    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>
    <!-- Custom styles for this template -->
    <link href="album.css" rel="stylesheet">
</head>
<body>
<header>
    <div class="collapse bg-dark" id="navbarHeader">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-md-7 py-4">
                    <h4 class="text-white">About</h4>
                    <p class="text-muted">Add some information about the album below, the author, or any other
                        background context. Make it a few sentences long so folks can pick up some informative tidbits.
                        Then, link them off to some social networking sites or contact information.</p>
                </div>
                <div class="col-sm-4 offset-md-1 py-4">
                    <h4 class="text-white">MENÚ</h4>
                    <ul class="list-unstyled">
                        <?php
                        if (isset($usuario)) {
                            echo '<li><a href="#" class="text-white"><i class="fas fa-user-circle"></i> ' . $usuario['nombres'] . '</a></li>';
                            echo '<li><a href="index.php?accion=salir" class="text-white">Cerrar sesión</a></li>';
                        }
                        ?>
                        <li><a href="#" class="text-white">Follow on Twitter</a></li>
                        <li><a href="#" class="text-white">Like on Facebook</a></li>
                        <li><a href="#" class="text-white">Email me</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="navbar navbar-dark bg-dark shadow-sm">
        <div class="container d-flex justify-content-between">
            <a href="#" class="navbar-brand d-flex align-items-center">
                <strong>Skatebicy</strong>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarHeader"
                    aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
        </div>
    </div>
</header>

<main role="main">

    <section class="jumbotron text-center" id="banner-home">
        <div class="container">
            <h1 class="jumbotron-heading text-white">Siempre a tu servicio</h1>
            <p class="lead text-white">Somos el servicio de alquiler de patinetas y bicicletas lider del mercado.</p>
            <?php
            if (!isset($usuario)) {
                echo '<p>';
                echo '<a href="registrarse.php" class="btn btn-primary my-2">Registrarse</a>';
                echo '<a href="login.php" class="btn btn-secondary my-2">Iniciar sesión</a>';
                echo '</p>';
            }
            ?>
        </div>
    </section>

    <div class="album py-5 bg-light">
        <div class="container">

            <div class="row">

                <?php
                foreach ($vehiculos as $vehiculo) {
                    ?>
                    <div class="col-md-4">
                        <div class="card mb-4 shadow-sm">
                            <img src="<?php echo $vehiculo['img_url'] ?>" style="width: 100%;">
                            <div class="card-body">
                                <p class="card-text text-capitalize"><?php echo $vehiculo['nombre'] ?></p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                                        <a href="#" class="btn btn-sm btn-secondary">Info</a>
                                        <a href=#" class="btn btn-sm btn-primary">Alquilar</a>
                                    </div>
                                    <small class="text-muted">Hora $ <?php echo $vehiculo['precio_hora'] ?></small>
                                    <small class="text-muted">Día $ <?php echo $vehiculo['precio_dia'] ?></small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php
                }
                ?>

            </div>
        </div>
    </div>

</main>

<footer class="text-muted">
    <div class="container">
        <p class="float-right">
            <a href="#">Volver arriba</a>
        </p>
        <p>Regístrate y alquila tu vehículo fácilmente.</p>
        <p>Made with <i class="fas fa-heart" style="color: #1D8AE4"></i> by Piolín.</p>
    </div>
</footer>
<?php
include('scripts.php');
?>
</body>
</html>
