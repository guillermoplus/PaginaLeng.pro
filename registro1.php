


<?php include("conexion.php") ?>
    <!----botstrap 4--->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<div class="contenedor">
    <div class="row">
        <div class="col-md-3">
 
              
         <?php if(isset($_SESSION['message'])) { ?>
            <div class="alert alert-<?= $_SESSION['message_type']?> alert-dismissible fade show" role="alert">
                <?= $_SESSION['message']?>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

         <?php session_unset();} ?>

         <div class="card card-body"> 
             <form action="crear.php" method= "POST">

                 <div class="form-group">
                     <input type="text" name ='cedula' class="form-control"
                     placeholder ="cedula" autofocus >
                 </div>
                 <div class = " form-group">
                     <input type="text" name ="nombres" class="form-control"
                     placeholder ="nombres" autofocus >
                     <input type="password" name ="contraseña" class="form-control"
                     placeholder ="contraseña" autofocus >
                 </div>
                  <div class= "form-group">
                   <input type="text" name ='apellidos' class="form-control"
                     placeholder ="apellidos" autofocus >                    </div>
                 <div class= "form-group">
                   <input type="email" name ="correo" class="form-control"
                     placeholder ="correo" autofocus >                    </div>
                 <div class= "form-group">
                   <input type="text" name ="celular" class="form-control"
                     placeholder ="celular" autofocus >                    </div>
                 <div class= "form-group">
                   <input type="text" name ="barrio" class="form-control"
                     placeholder ="barrio" autofocus >                    </div>
                 <div class= "form-group">
                    </div>
                  <input type="submit" class= "btn btn-success btn-block" name="save" value="save">
             </form>
         </div>
         </div>
         <div class="col-md-6">
          <table class= "table table-bordered " style= "width:100%">
              <thead>
                  <tr>
                     <th>cedula </th>
                     <th>nombres </th>
                     <th>apellidos </th>  
                     <th>correo </th>  
                     <th>celular</th>  
                     <th>barrio </th>
                     <th>contraseña </th>     
                     <th>accion </th>                   
                  </tr>
              </thead>
     <tbody>
         <?php
                 $query =$conexion->query("SELECT * FROM skatebicy");
                 $resultado = $query->fetch();

                 while ($row = $query->fetch()){?>

                     <tr>
                         <td><?php echo $row['codCliente'] ?></td>
                         <td><?php echo $row['cedula'] ?></td>
                         <td><?php echo $row['nombre'] ?></td>
                         <td><?php echo $row['apellido1'] ?></td>
                         <td><?php echo $row['apellido2'] ?></td>
                         <td><?php echo $row['direccion'] ?></td>
                         <td><?php echo $row['email'] ?></td>
                         <td><a href="editar.php?id=<?php echo $row['codCliente']?>">edit</a></td>
                         <td><a href="borrar.php">borrar</a></td>
                     </tr>
                 <?php }?>
             </tbody>

         </table> 
     </div>
 </div>
</div>
