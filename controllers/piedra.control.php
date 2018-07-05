<?php
/* Piedra Controller
 * 2014-10-14
 * Created By OJBA
 * Last Modification 2014-10-14 20:04
 */
  require_once "libs/template_engine.php";
  require_once "models/piedras.model.php";

  function run(){
    $data_view = array();
    $data_view["tipo"] = "";
    $data_view["categoria"] = "";
    $data_view["tipos"] = array(
        array("cod"=>"IGN", "value"=>"Ignea"),
        array("cod"=>"SED", "value"=>"Sedimentaria"),
        array("cod"=>"MRF", "value"=>"Morfica")
    );

    $data_view["categorias"] = array(
        array("cod"=>"PRC", "value"=>"Preciosa"),
        array("cod"=>"CNS", "value"=>"Construcción"),
        array("cod"=>"CLC", "value"=>"Colección")
    );
    $modos = array(
      "DSP" => "Detalle de ",
      "INS" => "Nuevo ",
      "UPD" => "Editar ",
      "DEL" => "Eliminar "
    );

    $modosBtn = array(
      "DSP" => "",
      "INS" => "Guardar",
      "UPD" => "Actualizar",
      "DEL" => "Eliminar"
    );


    $mode = "DSP";
    $codigo = 0;
    if(isset($_GET["mode"])){
        $mode = $_GET["mode"];
        $codigo = $_GET["id"];
    }
    if(isset($_POST["id"])){
      $mode = $_POST["mode"];
      $codigo = $_POST["id"];
      switch ($mode){
        case "INS":
            agregarPiedra(
                $_POST["nombre"],
                $_POST["tipo"],
                $_POST["categoria"]
            );
            redirectWithMessage("Piedra Guardada", "index.php?page=piedras");
            break;
        case "UPD";
              actualizarPiedra(
                  $_POST["nombre"],
                  $_POST["tipo"],
                  $_POST["categoria"],
                  $_POST["id"]
              );
              redirectWithMessage("Piedra Actualizada", "index.php?page=piedras");
            break;
        case "DEL":
                eliminarPiedra(
                    $_POST["id"]
                );
                redirectWithMessage("Piedra Eliminada", "index.php?page=piedras");
            break;
      }
    }
    $piedra = obtenerPiedraPorCodigo($codigo);
    fullMergeArrayTo( $piedra, $data_view);

    $data_view["tipos"] = addSelectedCmbArray($data_view["tipos"],
          "cod",
          $data_view["tipo"],
          "selected");
    $data_view["categorias"] = addSelectedCmbArray($data_view["categorias"],
          "cod",
          $data_view["categoria"],
          "selected");
    $data_view["modedsc"] = $modos[$mode];
    $data_view["modebtn"] = $modosBtn[$mode];
    $data_view["readonly"] = ($mode == "DSP" || $mode == "DEL")?"readonly":"";
    $data_view["showbtn"] = $mode !="DSP";
    $data_view["mode"] = $mode;

    renderizar("piedra", $data_view);
  }


  run();
?>
