<?php
/* Edificios Controller
 * 2017-10-30
 * Created By OJBA
 * Last Modification 2017-10-30 19:028
 */
  require_once("libs/template_engine.php");
  require_once("models/edificios.model.php");

  function run(){
    $modeDsc = array(
      "INS"=> "Nuevo Registro de Edificio",
      "UPD"=> "Editar Registro de Edificio",
      "DEL"=> "Eliminar Registro de Edificio",
      "DSP"=> "Registro de Edificio"
    );
    //addCssRef("public/css/home.css");
    $data = array();
    $data["mode"] = $_GET["mode"];
    $data["modedsc"] = $modeDsc[$data["mode"]];
    if(isset($_GET["edfcod"])){
        $edfcod = $_GET["edfcod"];
      }else{
        $edfcod= '';
      }
    $edfdsc = '';
    $edfubc = '';
    $data["isNotInsert"] = false;
    $data["isDisplay"] = false;
    if(isset($_POST["btnGuardar"])){
      $edfcod = $_POST["edfcod"];
      $edfdsc = $_POST["edfdsc"];
      $edfubc = $_POST["edfubc"];

      switch($data["mode"]){
        case 'INS':

            //realizar las validaciones

            // --------------
            if(insertarNuevoEdificio($edfcod, $edfdsc, $edfubc)){
              redirectWithMessage("Edificio Ingresado Satisfactoriamente.",
              "index.php?page=edificios");
            }
            break;
        case 'UPD':
            if(actualizarNuevoEdificio($edfcod, $edfdsc, $edfubc)){
              redirectWithMessage("Edificio Actualizado Satisfactoriamente.",
              "index.php?page=edificios");
            }
            break;
        case 'UPD':
            if(eliminarNuevoEdificio($edfcod)){
              redirectWithMessage("Edificio Eliminado Satisfactoriamente.",
              "index.php?page=edificios");
            }
            break;
      }
    }
    if($data["mode"]!= 'INS' ){
      $reg = obtenerEdificio($edfcod);
      $data["edfcod"] = $reg["edfcod"];
      $data["edfdsc"] = $reg["edfdsc"];
      $data["edfubc"] = $reg["edfubc"];
      $data["isNotInsert"] = true;
    }
    if($data["mode"]== 'DSP' ){
      $data["isDisplay"] = true;
    }

    renderizar("edificios/edificio",$data);
  }


  run();
?>
