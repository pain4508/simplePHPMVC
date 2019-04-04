<?php

require_once("libs/dao.php");

function obtenerProductos(){

$sqlstr = "select * from producto;";
$producto = array();
$producto = obtenerRegistros($sqlstr);
return $producto;
}

?>