<?php
require_once 'libs/dao.php';

/**
 * ObtenerProductos
 * Obtiene todos los productos de la tabla productos.
 *
 * @return array
 */
function obtenerProductos()
{
    $sqlstr = "select * from productos;";
    $productos = array();
    $productos = obtenerRegistros($sqlstr);
    return $productos;
}

?>
