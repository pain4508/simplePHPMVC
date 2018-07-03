<?php
/* Home Controller
 * 2014-10-14
 * Created By OJBA
 * Last Modification 2014-10-14 20:04
 */
  require_once "libs/template_engine.php";
  require_once "models/adress.model.php";

  function run(){
    $datos_cuenta = array();
    $datos_cuenta["cuenta"] = "0801198412349";
    $datos_cuenta["nombre"] = "Orlando J Betancourth";
    $datos_cuenta["carrera"] = "IG03002 Ingeniería en Ciencias de la Computación";
    $datos_cuenta["addresses"] = obtenerAllAddress();
    //print_r($datos_cuenta); die();
    renderizar("cuenta",$datos_cuenta);
  }


  run();
?>
