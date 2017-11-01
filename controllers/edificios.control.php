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
    $edfcod = "";
    $edfdsc = "";
    if(isset($_SESSION["edificios_edfcod"])){
      $edfcod = $_SESSION["edificios_edfcod"];
      $edfdsc = $_SESSION["edificios_edfdsc"];
    }

    if(isset($_POST["btnFiltrar"])){
      $edfcod = $_POST["fltCodEdificio"];
      $edfdsc = $_POST["fltDscEdificio"];
      $_SESSION["edificios_edfcod"] = $edfcod;
      $_SESSION["edificios_edfdsc"] = $edfdsc;
    }

    $data = array("edificios"=>obtenerEdificios($edfcod,$edfdsc),
                  "edfcod" => $edfcod,
                  "edfdsc" => $edfdsc
                  ); // end array
    
    renderizar("edificios/edificios",$data);
  }


  run();
?>
