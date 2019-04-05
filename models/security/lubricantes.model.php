<?php

require_once("libs/dao.php");

//Mostrar lista de productos en detalle

function obtenerProductos(){

$sqlstr = "select * from producto;";
$producto = array();
$producto = obtenerRegistros($sqlstr);
return $producto;
}

// Mostrar lista de productos por idProducto

function obtieneProductoxId($idProducto){

    $sqlstr = "select * from producto where idProducto=%d;";
    return obtenerUnRegistro(sprintf($sqlstr, $idProducto));

}

?>