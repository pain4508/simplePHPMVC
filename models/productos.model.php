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

/**
 * Agrega Nuevo Producto a la tabla de productos
 *
 * @param Array $data arreglo con los campos del formulario
 *
 * @return integer Devuelve el id del producto generado.
 */
function agregarNuevoProducto($data)
{
    $insSql = "INSERT INTO `productos`
( `prddsc`, `prdcodbrr`, `prdSKU`, `prdStock`,
`prdPrcVVnt`, `prdPrcCpm`, `prdImgUri`, `prdEst`, `prdBio`)
VALUES ( '%s','%s', '%s', %d, %f, %f, '%s', '%s','%s');";

    $result = ejecutarNonQuery(
        sprintf(
            $insSql,
            $data["prddsc"],
            $data["prdcodbrr"],
            $data["prdSKU"],
            $data["prdStock"],
            $data["prdPrcVVnt"],
            $data["prdPrcCpm"],
            $data["prdImgUri"],
            $data["prdEst"],
            $data["prdBio"]
        )
    );
    if ($result) {
        return getLastInserId();
    }
    return false;
}
?>
