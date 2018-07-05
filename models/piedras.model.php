<?php
    require_once("libs/dao.php");

    function obtenerPiedras(){
        $sqlstr = "SELECT * FROM piedras;";
        return obtenerRegistros($sqlstr);
    }

    function obtenerPiedraPorCodigo($codigo){
      $sqlstr = "SELECT * FROM piedras where id=%d;";
      return obtenerUnRegistro(sprintf($sqlstr, $codigo));
    }

    function actualizarPiedra($nombre , $tipo ,$categoria , $codigo){
        $sqlUpd = "update `piedras` set
            nombre = '%s',
            tipo = '%s',
            categoria = '%s'
            where id = %d;
        ";
        return ejecutarNonQuery(
            sprintf(
                $sqlUpd,
                $nombre,
                $tipo,
                $categoria,
                $codigo
            )
        );
    }

    function eliminarPiedra($codigo){
        $sqldel = "delete from `piedras` where id=%d;";
        return ejecutarNonQuery(sprintf($sqldel, $codigo));
    }
    function agregarPiedra($nombre , $tipo ,$categoria){
        $sqlIns = "INSERT INTO `piedras`
              (`nombre`,`tipo`,`categoria`)
              VALUES
              ('%s','%s','%s');
        ";
        $sqlIns = sprintf($sqlIns, $nombre , $tipo ,$categoria);
        return ejecutarNonQuery($sqlIns);
    }
 ?>
