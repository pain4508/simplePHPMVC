<?php

require_once 'models/productos.model.php';
function run()
{
    $viewData = array();
    $viewData["mode"] = "INS";
    $modeDesc = array(
      "INS"=>"Nuevo",
      "UPD"=>"Edición",
      "DEL"=>"Eliminar",
      "DSP"=>""
    );
    $isPost = false;
    if (isset($_POST["btnAgregar"]) ) {
        $viewData["mode"] = "INS";
        $viewData["title"] = " Producto";
        $isPost = true;
    }
    if (isset($_POST["btnEditar"])) {
        $viewData["mode"] = "UPD";
        $isPost = true;
    }
    if (isset($_POST["btnEliminar"])) {
        $viewData["mode"] = "DEL";
        $isPost = true;
    }
    if (isset($_POST["btnVer"])) {
        $viewData["mode"] = "DSP";
        $isPost = true;
    }

    if (isset($_POST["btnGuardar"])) {
          $viewData["mode"] = $_POST["mode"];
          /*
           <!-- productocod bigint(18) AI PK
                productosbarra varchar(25)
                productodesc varchar(128)
                productodesccrt varchar(64)
                categoriacod int(5)
                productoest char(3)
                productotip char(3)
                parentcod bigint(18) 
           */
          $viewData["productocod"] = $_POST["productocod"];
          $viewData["productosbarra"] = $_POST["productosbarra"];
          $viewData["productodesc"] = $_POST["productodesc"];
          $viewData["productodesccrt"] = $_POST["productodesccrt"];
          $viewData["categoriacod"] =  intval($_POST["categoriacod"]);
          $viewData["productoest"] = $_POST["productoest"];
          $viewData["productotip"] = $_POST["productotip"];

          switch($viewData["mode"]){
              case "INS":
                  guardarNuevoProducto(
                      $viewData["productocod"],
                      $viewData["productosbarra"],
                      $viewData["productodesc"],
                      $viewData["productodesccrt"],
                      $viewData["categoriacod"],
                      $viewData["productoest"],
                      $viewData["productotip"]
                  );
                  redirectWithMessage(
                      "Producto Guardado Satosfactoriamente",
                      "index.php?page=catalogo"
                  );
                  break;
              case "UPD":
               editarProducto(
                      $viewData["productocod"],
                      $viewData["productosbarra"],
                      $viewData["productodesc"],
                      $viewData["productodesccrt"],
                      $viewData["categoriacod"],
                      $viewData["productoest"],
                      $viewData["productotip"]
                  );
                  redirectWithMessage(
                      "Producto Guardado Satosfactoriamente",
                      "index.php?page=catalogo"
                  );
                  break;
              case "DEL":
               eliminarProducto(
                      $viewData["productocod"]
                  );
                  redirectWithMessage(
                      "Producto Eliminado Satosfactoriamente",
                      "index.php?page=catalogo"
                  );
                    break;
          }
    }
    $viewData["modedsc"] = $modeDesc[$viewData["mode"]];
    if ($isPost) {
      if ($viewData["mode"] !== "INS") {
          $tmpProducto = obtenerProductoPorID($_POST["productocod"]);
          $viewData["productocod"] = $tmpProducto["productocod"];
          $viewData["productosbarra"] = $tmpProducto["productosbarra"];
          $viewData["productodesc"] = $tmpProducto["productodesc"];
          $viewData["productodesccrt"] = $tmpProducto["productodesccrt"];
          $viewData["categoriacod"] =  intval($tmpProducto["categoriacod"]);
          $viewData["productoest"] = $tmpProducto["productoest"];
          $viewData["productotip"] = $tmpProducto["productotip"];
      }
        renderizar('catalogoform', $viewData);
    } else {
        redirectWithMessage("No sea vivo", "index.php?page=catalogo");
    }
}

run();
?>
