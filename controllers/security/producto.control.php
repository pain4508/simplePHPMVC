<?php
/**
 * Control Producto
 * 
 * Fecha de Creacion 13-03-2019
 * Creado By PAIN
 */

require_once 'models/security/productos.model.php';

    function run(){
        $viewData = Array();
        /**
         * idproductos int(11) PK
         * nombreProducto varchar(45)
         * precioProducto int(11)
         * descripcionProducto varchar(300)
         */

        $viewData["mode"] = "";
        $viewData["modeDsc"] = "";
        $viewData["tocken"] = "";
        $viewData["errores"] = Array();
        $viewData["haserrores"] = false;
        $viewData["readonly"] = false;
        $viewData["isupdate"] = false;
        $viewData["isinsert"] = false;

        $viewData["idproductos"] = "";
        $viewData["nombreProducto"] = "";
        $viewData["precioProducto"] = "";
        $viewData["descripcionProducto"] = "";
       
        if($_SERVER["REQUEST_METHOD"] === "GET"){
            if(isset($_GET["mode"])){
                $viewData["mode"] = $_GET["mode"];
                $viewData["idproductos"] = $_GET["idproductos"];
                switch ($viewData["mode"]){  
                    case 'INS' :
                        $viewData["modeDsc"] = "Ingresando Nuevo Producto";
                        $viewData["isinsert"] = true;
                        break;
                    case 'UDP':
                    break;

                    case 'DEL':
                    break;
                    case 'DSP':
                        $viewData["modeDsc"] = "Detalle:";
                         $viewData["readonly"] = "readonly";

                        if(isset($_GET["idproductos"])){
                         $viewData["idproductos"] = $_GET["idproductos"];
                             }else{
                                redirectWithMessage(
                                  "Código de Producto no Valido",
                                  "index.php?page=productos"
                              );
                        die();
                  }
                    break;
                }
                $viewData["tocken"] = md5(time().'productos');
                $_SESSION["producto_tocken"] = $viewData["tocken"];
            }   
        }

        if($_SERVER["REQUEST_METHOD"] === "POST"){
            if(isset($_POST["tocken"]) && $_POST["tocken"] === $_SESSION["producto_tocken"])
                {
                $viewData["mode"] = $_POST["mode"];
                $viewData["idproductos"] = $_POST["idproductos"];
                $viewData["tocken"] = md5(time().'productos');
                $_SESSION["producto_tocken"] = $viewData["tocken"];

                switch ($viewData["mode"]) {
                    case 'INS':
                        $viewData["modeDsc"] = "Nuevo Producto";
                        $viewData["isinsert"] = true;
                        break;
                        
                }
            }else {
                $viewData["tocken"] = md5(time().'productos');
                $_SESSION["producto_tocken"] = $viewData["tocken"];
                $viewData["errores"][] = "No se pudo validar la información";
                $viewData["haserrores"] = true;
            }
           
        }
        if($viewData["idproductos"]!==''){
            $dbProducto = obtieneProductoPorId($viewData["idproductos"]);
            mergeFullArrayTo($dbProducto, $viewData);
        }   
    
  
    
    renderizar("security/producto",$viewData);
}
    run();
?>