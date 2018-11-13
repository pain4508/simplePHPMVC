<?php
require_once "models/productos.model.php";

function run(){
      $viewData = array();
      $tmpProductos = obtenerProductos();
      $estados = obtenerEstados();
      foreach($tmpProductos as $producto){
          $producto["productoest"] = $estados[$producto["productoest"]];
          $viewData["productos"][] = $producto;
      }
      renderizar("catalogo", $viewData);
}

  run();
?>
