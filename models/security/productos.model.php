<?php
    require_once("libs/dao.php");

/**
 * Obtiene todos los productos de la tabla Productos
 * Creado By PAIN
 * Fecha de Creacion 13-03-2019
 * 
 * @return Array
 */
    function obtenerProductos(){

        $sqlstr = "select * from productos;";
        $productos = array();
        $productos = obtenerRegistros($sqlstr);
        return $productos;
    }
/**
 * Obtiene un Producto a partir del código suministrado
 *
 * @param integer  $idpais Código del Producto
 *
 * @return  Array
 */
function obtieneProductoPorId($idproductos){

    $sqlstr = "select * from productos where idproductos=%d;";
    return obtenerUnRegistro(sprintf($sqlstr, $idpais));

}

/**
 * Agrega Nuevo Pais a la tabla de Pais
 *
 * @param Array $data arreglo con los campos del formulario
 *
 */
function agregarNuevoPais($data)
{
    $insSql = "INSERT INTO `pais`
        (`idpais`, `nombrePais`, `paisGeoJson`, `fechaCreacion`, `usuarioCreador`)
    VALUES ( %d,'%s', '%s', '%s', '%s');";
        $result = ejecutarNonQuery(
            sprintf(
                $insSql,
                $data["idpais"],
                $data["nombrePais"],
                $data["paisGeoJson"],
                $data["fechaCreacion"],
                $data["usuarioCreador"]
        )
    );
    if($result){
        return getLastInserId();
    }
    return false;
}

/**
 * Agrega Nuevo Pais a la tabla de Pais
 *
 * @param Array $data arreglo con los campos del formulario
 *
 */
function agregarNuevoProducto($data)
{
    $insSql = "INSERT INTO `productos`
        (`idproductos`, `nombreProducto`, `precioProducto`, `descripcionProducto`)
    VALUES ( %d,'%s', %d, '%s');";
        $result = ejecutarNonQuery(
            sprintf(
                $insSql,
                $data["idproductos"],
                $data["nombreProducto"],
                $data["precioProducto"],
                $data["descripcionProducto"]
        )
    );
    if($result){
        return getLastInserId();
    }
    return false;
}
 ?>