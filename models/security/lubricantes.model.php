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
//Insertar producto en factura

function insertarProductoFactura($data)
{
    $insSql = "INSERT INTO `producto` (`idProducto`, `nombreProducto`, `descripcion`, `idCategoria`, `precio`) VALUES ( %d, '%s', '%s', %d, %f);";
        $result = ejecutarNonQuery(
            sprintf(
                $insSql,
                $data["idProducto"],
                $data["nombreProducto"],
                $data["descripcion"],
                $data["idCategoria"],
                $data["precio"]
        )
    );
    if($result){
        return getLastInserId();
    }
    return false;
}
?>