<?php
require_once 'libs/dao.php';

function agregarFactura($data)
{
    $insSql = "INSERT INTO `factura`
        (`codUsuario`, `idFormaPago`, `idPaisDestino`)
    VALUES (4, %d, %d);";
        $result = ejecutarNonQuery(
            sprintf(
                $insSql,
                $data["idFormaPago"],
                $data["idPaisDestino"]

            )
    );
    if($result){
        return getLastInserId();
    }
    return false;
}
function agregarDetalleFactura($idfactura, $idproducto)
{
    $insSql = "INSERT INTO `detallefactura`
        (`idfactura`, `idProducto`)
    VALUES (%d, %d);";
        $result = ejecutarNonQuery(
            sprintf(
                $insSql,
                $idfactura,
                $idproducto

            )
    );
    if($result){
        return getLastInserId();
    }
    return false;
}

?>