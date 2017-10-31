<?php
/* Edificios Controller
 * 2017-10-30
 * Created By OJBA
 * Last Modification 2017-10-30 19:028
 */
  require_once("libs/template_engine.php");
  require_once("models/edificios.model.php");

  function run(){
    //addCssRef("public/css/home.css");
    $data = array("edificios"=>obtenerEdificios('%','%'));
    renderizar("edificios/edificios",$data);
  }


  run();
?>
