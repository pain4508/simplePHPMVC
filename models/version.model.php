<?php
require_once 'libs/dao.php';

function obtenerVersion(){
  $sqlstr = "select * from version order by version desc limit 1;";
  $versionArray = obtenerUnRegistro($sqlstr);
  return $versionArray;
}

?>
