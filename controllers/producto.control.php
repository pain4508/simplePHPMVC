<?php
/* Home Controller
 * 2014-10-14
 * Created By OJBA
 * Last Modification 2014-10-14 20:04
 */
  require_once "libs/template_engine.php";
  require_once "models/productos.model.php";

  function run(){
    $view_data = array();
    $view_data["errors"] = array();
    $mode = (isset($_GET["mode"])) ? $_GET["mode"] :  'NVM';
    $modeDesc= array(
      "INS" => "Nuevo ",
      "UPD" => "Editar ",
      "DEL" => "Eliminar",
      "DSP" => "Datos de "
    );
    $modeBtn= array(
      "INS" => "Guardar",
      "UPD" => "Actualizar",
      "DEL" => "Eliminar",
      "DSP" => ""
    );

    $tipoProd = array(
      array("tipocod"=>"INT","tipodsc"=>"Producto Extranjero" ),
      array("tipocod"=>"RFG","tipodsc"=>"Producto Refrigerado" ),
      array("tipocod"=>"PAS","tipodsc"=>"Marca País" )
    );
    $view_data["productoTipo"] = "PAS";

    $estProd = array(
      array("cod"=>"VND","dsc"=>"Vendible" ),
      array("cod"=>"CMP","dsc"=>"Solo Para Compras" ),
      array("cod"=>"RTR","dsc"=>"Retirar" ),
      array("cod"=>"DSC","dsc"=>"Descontinuado" )
    );
    $view_data["productoEstado"] = "VND";

    $view_data["mode"] = $mode;
    $view_data["modedsc"] = $modeDesc[$mode];

    if(isset($_POST["productocod"])){
        $view_data["mode"] = $_POST["mode"];
        switch ($view_data["mode"]) {
        case 'INS':
          // code...
          $nuevo = agregarProducto(
             $_POST['productobarra'], $_POST['productoCodInt'], $_POST['productoNombre'],
             $_POST['productoTipo'], $_POST['productoEstado'], $_POST['productoPrecio'],
             $_POST['productoStock'], $_POST['productoIva']
           );
           if( $nuevo && true){
              redirectWithMessage("Producto Agregado Satisfactoriamente", "index.php?page=productos");
           }
           $view_data["errors"][] = "Error al insertar nuevo producto.";
          break;
          case 'UPD':
          $afectado = actualizarProducto(
             $_POST['productobarra'], $_POST['productoCodInt'], $_POST['productoNombre'],
             $_POST['productoTipo'], $_POST['productoEstado'], $_POST['productoPrecio'],
             $_POST['productoStock'], $_POST['productoIva'], $_POST['productocod']
           );
           if( $afectado >= 0){
              redirectWithMessage("Producto Actualizado Satisfactoriamente", "index.php?page=productos");
           }
           $view_data["errors"][] = "Error al actualizar producto.";
            // code...
            break;
          case 'DEL':
          $afectado = eliminarProducto(
              $_POST['productocod']
           );
           if( $afectado >= 0){
              redirectWithMessage("Producto Eliminado Satisfactoriamente", "index.php?page=productos");
           }
           $view_data["errors"][] = "Error al eliminar producto.";
            break;
          default:
            // code...
            break;
        }
    }

    if($mode !== "INS"){
      $producto =  obtenerProductoPorCodigo($_GET["cod"]);
      fullMergeArrayTo($producto, $view_data);
    }

    $view_data["tipoarray"] = addSelectedCmbArray(
        $tipoProd,
        "tipocod",
        $view_data["productoTipo"],
        "tiposel");

      $view_data["estadoarray"] = addSelectedCmbArray(
          $estProd,
          "cod",
          $view_data["productoEstado"],
          "selected");

    $view_data["btnMode"] = $modeBtn[$mode];
    if ( count($view_data["errors"]) && true) {
        $view_data["has_errors"] = true;
    }
    $view_data["readonly"] = ($mode == "DSP" || $mode == "DEL") ? "readonly":"";
    $view_data["showbtn"] = !($mode == "DSP") ;
    renderizar("producto", $view_data);
  }


  run();
?>
