<?php

session_start();

class Conexion
{
    private $servidor = "localhost";
    private $base_datos = "skatebicy";
    private $usuario = "root";
    private $password = "root";

    private $conexion;

    public function __construct()
    {
        $this->crearConexion();
    }

    public function crearConexion()
    {
        $cadena_mysql = "mysql:host=" . $this->servidor . ";dbname=" . $this->base_datos;

        try {
            $this->conexion = new PDO($cadena_mysql, $this->usuario, $this->password);
        } catch (PDOExcemption $e) {
            echo "Error al intentar conectar con la base de datos: " . $e->getMessage();
        }
    }

    public function getConexion()
    {
        return $this->conexion;
    }

    public function consulta($sql)
    {
        return $this->getConexion()->query($sql);
    }

    public function cerrarConexion()
    {
        $this->conexion = null;
    }
}

?>