<?php

require_once 'models/security/paises.model.php';
    function run(){
        $viewData = Array();
        /**
         *  idpais char(3)
         *  nombrePais varchar(60)
         *  paisGeoJson mediumtext
         *  fechaCreacion datetime
         *  usuarioCreador varchar(45)
         */
        $viewData["mode"] = "";
        $viewData["modeDsc"] = "";
        $viewData["tocken"] = "";
        $viewData["errores"] = Array();
        $viewData["haserrores"] = false;
        $viewData["readonly"] = false;
        $viewData["isupdate"] = false;
        $viewData["isinsert"] = false;


        $viewData["idpais"] = "";
        $viewData["nombrePais"] = "";
        $viewData["paisGeoJson"] = "";
        $viewData["fechaCreacion"] = "";
        $viewData["usuarioCreador"] = "";

        if($_SERVER["REQUEST_METHOD"] === "GET"){
            if(isset($_GET["mode"])){
                $viewData["mode"] = $_GET["mode"];
                $viewData["idpais"] = $_GET["idpais"];
                switch ($viewData["mode"]) {
                    case 'INS':
                        $viewData["modeDsc"] = "Ingresando Nuevo Pais...";
                        $viewData["isinsert"] = true;
                        break;
                    case 'UPD' :
                        $viewData["modeDsc"] = "Actualizando Pais...";
                          if(isset($_GET["idpais"])){
                          $viewData["idpais"] = $_GET["idpais"];
                            }else{
                            redirectWithMessage(
                                "Código de pais no Valido",
                                "index.php?page=paises"
                          );
                          die();
                    }
                        break;
                     case 'DEL' :
                          $viewData["modeDsc"] = "Eliminando...";
                          $viewData["readonly"] = "readonly";
                          if (isset($_GET["idpais"])) {
                          $viewData["idpais"] =  $_GET["idpais"];
                          } else {
                          redirectWithMessage(
                           "Código de Pais no Válido",
                           "index.php?page=paises"
                            );
                            die();
                          }
                          break;
                    case 'DSP' :
                          $viewData["modeDsc"] = "Detalle:";
                          $viewData["readonly"] = "readonly";
                          if(isset($_GET["idpais"])){
                            $viewData["idpais"] = $_GET["idpais"];
                            }else{
                            redirectWithMessage(
                                "Código de pais no Valido",
                                "index.php?page=paises"
                              );
                              die();
                        }
                        break;
                }
                $viewData["tocken"] = md5(time().'paises');
                $_SESSION["pais_tocken"] = $viewData["tocken"];
            }
        }
        if($_SERVER["REQUEST_METHOD"] === "POST"){
            if(isset($_POST["tocken"]) && $_POST["tocken"] === $_SESSION["pais_tocken"])
                {
                $viewData["mode"] = $_POST["mode"];
                $viewData["idpais"] = $_POST["idpais"];
                $viewData["tocken"] = md5(time().'paises');
                $_SESSION["pais_tocken"] = $viewData["tocken"];

                switch ($viewData["mode"]) {
                    case 'INS':
                        $viewData["modeDsc"] = "Nuevo Pais";
                        $viewData["isinsert"] = true;
                        ///Validar la Data
                        ///llamamos al modelo de datos para insertar el producto
                            $lastID = agregarNuevoPais($_POST);
                            if($lastID){
                                redirectWithMessage("Pais Agregado Satisfactoriamente", "index.php?page=paises");
                                die();
                            }else{
                                $viewData["errores"][] = "No se puedo agregar el pais";
                                $viewData["haserrores"] = true;
                            }
                        break;
                        case 'UPD':
                          $result = actualizarPais($_POST);
                          if($result){
                            redirectWithMessage("Pais Actualizado Satisfactoriamente", "index.php?page=paises");
                            die();
                        }else{
                            $viewData["errores"][] = "No se puedo actualizar el pais";
                            $viewData["haserrores"] = true;
                          }
                          break;
                          case 'DEL':
                            $result = eliminarPais($_POST["idpais"]);
                            if ($result) {
                                redirectWithMessage("Pais Eliminado Satisfactorimente", "index.php?page=productos");
                                  die();
                                }else{
                                  $viewData["errores"][] = "No se pudo Eliminar el pais";
                                  $viewData["haserrores"] = true;
                                }
                                break;

                      }

                }else{
                $viewData["tocken"] = md5(time().'paises');
                $_SESSION["pais_tocken"] = $viewData["tocken"];
                $viewData["errores"][] = "No se puedo Validar la Información";
                $viewData["haserrores"] = true;
            }
        }
        if($viewData["idpais"]!==''){
            $dbPais = obtienePaisPorId($viewData["idpais"]);
            mergeFullArrayTo($dbPais, $viewData);


            /*
            $viewData["idpais"] = $dbPais[""];
            $viewData["nombrePais"] = $dbPais[""];
            $viewData["paisGeoJson"] = $dbPais[""];
            $viewData["fechaCreacion"] = $dbPais[""];
            $viewData["usuarioCreador"] = $dbPais[""];
            */
        }
        renderizar("/security/pais",$viewData);
    
    
    run();

?>
