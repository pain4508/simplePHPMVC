<?php

require_once 'models/productos.model.php';
function run()
{
    $viewData = Array();
    /*
    prdcod bigint(18) UN AI PK
    prddsc varchar(128)
    prdcodbrr varchar(45)
    prdSKU varchar(45)
    prdStock int(8)
    prdPrcVVnt decimal(13,4)
    prdPrcCpm decimal(13,4)
    prdImgUri varchar(255)
    prdEst char(3)
    prdBio mediumtext
     */
    $viewData["mode"] = "";
    $viewData["modeDsc"] = "";
    $viewData["tocken"] = "";
    $viewData["errores"] = Array();
    $viewData["haserrores"] = false;
    $viewData["readonly"] = false;
    $viewData["isupdate"] = false;
    $viewData["isinsert"] = false;


    $viewData["prdcod"] = "";
    $viewData["prddsc"] = "";
    $viewData["prdcodbrr"] = "";
    $viewData["prdSKU"] = "";
    $viewData["prdStock"] = "";
    $viewData["prdPrcVVnt"] = "";
    $viewData["prdPrcCpm"] = "";
    $viewData["prdImgUri"] = "";
    $viewData["prdEst"] = "";
    $viewData["prdBio"] = "";

    if ($_SERVER["REQUEST_METHOD"] === "GET") {
        if (isset($_GET["mode"])) {
            $viewData["mode"] = $_GET["mode"];
            $viewData["prdcod"] = $_GET["prdcod"];
            switch($viewData["mode"])
            {
            case 'INS':
                $viewData["modeDsc"] = "Nuevo Producto";
                $viewData["isinsert"] = true;
                break;
            case 'UPD':
                break;
            case 'DEL':
                break;
            case 'DSP':
                break;
            }
            $viewData["tocken"] = md5(time().'productos');
            $_SESSION["producto_tocken"] = $viewData["tocken"];
        }
    }
    if ($_SERVER["REQUEST_METHOD"] === "POST") {
        if (isset($_POST["tocken"])
            && $_POST["tocken"] === $_SESSION["producto_tocken"]
        ) {
            $viewData["mode"] = $_POST["mode"];
            $viewData["prdcod"] = $_POST["prdcod"];
            $viewData["tocken"] = md5(time().'productos');
            $_SESSION["producto_tocken"] = $viewData["tocken"];
           
            switch($viewData["mode"])
            {
            case 'INS':
                $viewData["modeDsc"] = "Nuevo Producto";
                $viewData["isinsert"] = true;
                /// validar la data
                /// llamamos al modelo de datos para insertar el producto
                $lastID = agregarNuevoProducto($_POST);
                if ($lastID) {
                    redirectWithMessage("Producto Agregado Satisfactorimente", "index.php?page=productos");
                    die();
                } else {
                     $viewData["errores"][] = "No se pudo agregar el producto";
                     $viewData["haserrores"] = true;
                }
                break;
            }
        } else {
            $viewData["tocken"] = md5(time().'productos');
            $_SESSION["producto_tocken"] = $viewData["tocken"];
            $viewData["errores"][] = "No se pudo validar la información";
            $viewData["haserrores"] = true;
        }
    }

    renderizar("producto", $viewData);
}

run();

?>
