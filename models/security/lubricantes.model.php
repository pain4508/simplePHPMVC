<?php

require_once("libs/dao.php");

//Mostrar lista de productos en detalle

function obtenerProductos(){

$sqlstr = "select p.idProducto, p.nombreProducto, p.descripcion, c.categoria, p.precio
            from producto p 
            inner join 
            categoria c 
            On p.idCategoria = c.idCategoria;";
$producto = array();
$producto = obtenerRegistros($sqlstr);
return $producto;
}

// Mostrar lista de productos por idProducto

function obtieneProductoxId($idProducto){

    $sqlstr = "select p.idProducto, p.nombreProducto, p.descripcion, c.categoria, p.precio
    from producto p 
    inner join 
    categoria c 
    On p.idCategoria = c.idCategoria
    where idProducto=%d;";
    return obtenerUnRegistro(sprintf($sqlstr, $idProducto));

}

?>