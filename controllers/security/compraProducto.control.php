<?php

require_once 'models/security/lubricantes.model.php';


function run(){
    $viewData = Array();
    $viewData["producto"] =  obtenerProductos();
    $viewData["nombre"] = "Productos Disponibles";
    renderizar("security/compraProducto", $viewData);
}

run();

// añadir al carrito
$p = new Producto();
$p->id = $_POST["idProducto"];
$p->id = $_POST["nombreProducto"];
$p->id = $_POST["descripcion"];
$p->id = $_POST["idCategoria"];
$p->id = $_POST["precio"];

    session_start();

    if(isset($_SESSION["carrito"])){
        $carrito = $_SESSION["carrito"];
    }else{  
        $carrito = array();
    }
array_push($carrito, $p);
$_SESSION["carrito"] = $carrito;


?>