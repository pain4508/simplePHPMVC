<?php
 require_once "libs/dao.php";

function obtenerProductos(){
  $sqlstr = "select * from productos;";
  return obtenerRegistros($sqlstr);
}
//ACT INA DES RET WRK
function obtenerEstados(){
  return array(
    "ACT" =>"Activo",
    "INA" =>"Inactivo",
    "DES" => "Descontinuado",
    "RET" => "Retirado",
    "WRK" => "En proceso"
  );
}
function obtenerEstadosAssoc(){
  $arrEstado = array();
  foreach(obtenerEstados() as $codigo=>$desc){
    $arrEstado[] = array(
      "codigo" => $codigo,
      "descripcion" => $desc
    );
  }
}

?>
