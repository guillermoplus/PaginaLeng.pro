<?php

include('conexion.php');
include('usuario.php');
$db = new Conexion();
$login = new Usuario($db);

if (!empty($_POST['email']) and !empty($_POST['password'])) {
    $login->iniciarSesion($_POST['email'], $_POST['password']);
}

if (!empty($_SESSION['user_id'])) {
    echo "Estás logueado!!";
} else {
    echo "No estás logueado.";
}

?>


<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <title>Iniciar sesión</title>

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
    <link href="css/login.css" rel="stylesheet">
</head>
<body class="text-center">
<form class="form-signin" method="post" action="login.php">
    <h1 class="h1">Skatebicy</h1>
    <h1 class="h3 mb-3 font-weight-normal">Iniciar sesión</h1>
    <label for="inputEmail" class="sr-only">Email</label>
    <input name="email" type="email" id="inputEmail" class="form-control" placeholder="Email" required autofocus>
    <label for="inputPassword" class="sr-only">Contraseña</label>
    <input name="password" type="password" id="inputPassword" class="form-control" placeholder="Contraseña" required>
    <div class="checkbox mb-3">
        <label>
            <input name="rememberme" type="checkbox" value="remember-me"> Recordarme
        </label>
    </div>
    <button class="btn btn-lg btn-primary btn-block" type="submit">Iniciar sesión</button>
    <p class="mt-5 mb-3 text-muted">&copy; 2019</p>
</form>
<?php
include('scripts.php');
?>
</body>
</html>
