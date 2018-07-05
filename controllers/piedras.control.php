<?php
/* Piedras Controller
 * 2014-10-14
 * Created By OJBA
 * Last Modification 2014-10-14 20:04
 */
  require_once "libs/template_engine.php";
  require_once "models/piedras.model.php";

  function run(){
    $data_view = array();
    $data_view["piedras"] = obtenerPiedras();
    renderizar("piedras", $data_view);
  }


  run();
?>
