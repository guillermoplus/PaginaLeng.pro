<?php

session_start();

class Conexion
{
    private $servidor;
    private $base_datos;
    private $usuario;
    private $password;
    private $puerto;
    private $conexion;

    public function __construct()
    {
        $this->asignarDatosDeConexion();
        $this->crearConexion();
    }

    public function crearConexion()
    {
        $cadena_mysql = 'mysql:host=' . $this->servidor . ';port=' . $this->puerto . ';dbname=' . $this->base_datos;

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
        $this->getConexion()->query('set names utf8');

        return $this->getConexion()->query($sql);
    }

    public function cerrarConexion()
    {
        $this->conexion = null;
    }

    private function asignarDatosDeConexion()
    {
        $datos = [];

        $fp = fopen('.configuracion', 'r');
        while (!feof($fp)) {
            $linea = fgets($fp);
            $linea = str_replace(PHP_EOL, '', $linea);
            $linea = explode('=', $linea);
            $datos[$linea[0]] = $linea[1];
        }

        if (isset($datos['SERVIDOR'])) {
            $this->servidor = $datos['SERVIDOR'];
        } else {
            $this->servidor = 'localhost';
        }

        if (isset($datos['BASE_DE_DATOS'])) {
            $this->base_datos = $datos['BASE_DE_DATOS'];
        } else {
            $this->base_datos = 'NO_ESTABLECIDA';
        }

        if (isset($datos['USUARIO'])) {
            $this->usuario = $datos['USUARIO'];
        } else {
            $this->usuario = 'root';
        }

        if (isset($datos['PASSWORD'])) {
            $this->password = $datos['PASSWORD'];
        } else {
            $this->password = '';
        }

        if (isset($datos['PUERTO'])) {
            $this->puerto = $datos['PUERTO'];
        } else {
            $this->puerto = '3306';
        }
    }
}

?>