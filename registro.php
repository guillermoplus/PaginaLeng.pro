<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <title>LOGIN</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="estilos2.css">


</head>
<body>

<h1>FORMULARIO DE REGISTRO</h1>
<h2 class="form-titulo">CREAR CUENTA</h2>
<form action="registrar.php" method="post"
      class="form-registrar">
    <div class="contenedor-inputs">
        <input type="text" name="nombre" placeholder="nombre" class="input-48" required>
        <input type="text" name="apellidos" placeholder="apellidos" class="input-48" required>
        <input type="text" name="cedula" placeholder="cedula" class="input-48" required>
        <input type="email" name="correo" placeholder="correo" class="input-100" required>
        <input type="text" name="celular" placeholder="telefono" class="input-48" required>
        <input type="text" name="barrio" placeholder="barrio" class="input-100" required>
        <input type="password" name="contraseña" placeholder="contraseña" class="input-100" required>
        <input type="submit" value="check in" class="btn-enviar">
        <p>¿ya tienes una cuenta? <a href="#">ingresa aqui</a></p>
    </div>
</form>
</body>
</html>