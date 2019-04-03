<?php

require_once 'models/security/productos.model.php';
function run(){
    $viewData = Array();
    $viewData["productos"] =  obtenerProductos();
    $viewData["nombre"] = "Productos Disponibles";
    renderizar("security/productos", $viewData);
}
run();
?>