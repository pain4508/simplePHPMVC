<?php
require_once 'libs/dao.php';
require_once 'models/security/productos.model.php';

function agregarACarrito($data)
{
    $insSql = "INSERT INTO `detallecarrito`
        (`idcarrito`, `idProducto`)
    VALUES (1, %d);";
        $result = ejecutarNonQuery(
            sprintf(
                $insSql,
                $data["idProducto"]
            )
    );
    if($result){
        return getLastInserId();
    }
    return false;
}
function obtenerCarrito(){

    $sqlstr = "select idProducto from detallecarrito WHERE idcarrito = 1;";
    $productos = array();
    $prods = array();
    $productos = obtenerRegistros($sqlstr);
    foreach ($productos as $p) {
        $prods[] = obtieneProductoPorId($p['idProducto']);
    }
    return $prods;
}
?>