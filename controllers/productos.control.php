<?php
/* Listado de Productos
 */
  require_once "libs/template_engine.php";
  require_once "models/productos.model.php";

  function run(){

    $view_data = array();
    $view_data["productos"] = obtenerProductos();

    renderizar("productos", $view_data);
  }


  run();
?>
