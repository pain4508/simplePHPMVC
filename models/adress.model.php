<?php
    require_once "libs/dao.php" ;
    /*
    function obtenerTodosMensajes(){
        $sqlstr = "Select * from mensajes;";
        return obtenerRegistros($sqlstr);
    }
    */
    function obtenerAllAddress(){
      $registros = obtenerRegistros("select * from address;");
      return $registros;
    }
 ?>
