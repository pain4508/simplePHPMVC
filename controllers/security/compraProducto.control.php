<?php

require_once 'models/security/lubricantes.model.php';

function run(){
    $viewData = Array();
    $viewData["producto"] =  obtenerProductos();
    $viewData["nombre"] = "Productos Disponibles";
    renderizar("security/compraProducto", $viewData);
}
run();
?>