<?php
/**
 * Control Producto
 * 
 * Fecha de Creacion 13-03-2019
 * Creado By PAIN
 */

require_once 'models/security/lubricantes.model.php';

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

        $viewData["idProducto"] = "";
        $viewData["nombreProducto"] = "";
        $viewData["descripcion"] = "";
        $viewData["idCategoria"] = "";
        $viewData["precio"] = "";
       
        if($_SERVER["REQUEST_METHOD"] === "GET"){
            if(isset($_GET["mode"])){
                $viewData["mode"] = $_GET["mode"];
                $viewData["idProducto"] = $_GET["idProducto"];
                switch ($viewData["mode"]){  
                    case 'INS' :
                    $viewData["modeDsc"] = "Producto Nuevo";
                    $viewData["isinsert"] = true;
                    break;
                    case 'UDP':
                    break;

                    case 'DEL':
                    
                    break;
                    case 'DSP':
                        $viewData["modeDsc"] = "Detalle del Producto:";
                         $viewData["readonly"] = "readonly";
                        
                        if(isset($_GET["idProducto"])){
                         $viewData["idProducto"] = $_GET["idProducto"];
                             }else{
                                redirectWithMessage(
                                  "Código de Producto no Valido",
                                  "index.php?page=compraProducto"
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
                $viewData["idProducto"] = $_POST["idProducto"];
                $viewData["tocken"] = md5(time().'productos');
                $_SESSION["producto_tocken"] = $viewData["tocken"];

                switch ($viewData["mode"]) {
                    case 'INS':
                        $viewData["modeDsc"] = "Nuevo Producto";
                        $viewData["isinsert"] = true;
                        ///Validar la Data
                        ///llamamos al modelo de datos para insertar el producto
                        $lastID = insertarProductoFactura($_POST);
                        if($lastID){
                            redirectWithMessage("Producto Agregado Satisfactoriamente", "index.php?page=compraProducto");
                            die();
                        }else{
                            $viewData["errores"][] = "No se puedo agregar el pais";
                            $viewData["haserrores"] = true;
                        }
                        break;
                        
                }
            }else {
                $viewData["tocken"] = md5(time().'productos');
                $_SESSION["producto_tocken"] = $viewData["tocken"];
                $viewData["errores"][] = "No se pudo validar la información";
                $viewData["haserrores"] = true;
            }
           
        }
        if($viewData["idProducto"]!==''){
            $Producto = obtieneProductoxId($viewData["idProducto"]);
            mergeFullArrayTo($Producto, $viewData);
        }   
    
  
    
    renderizar("security/producto",$viewData);
}
    run();
?>