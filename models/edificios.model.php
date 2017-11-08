<?php
    require_once("libs/dao.php");
    function obtenerEdificios($fltCodigo = '%', $fltDsc = '%'){
        $strsql  = "select * from edificios
                      where edfcod like '%s' and edfdsc like '%s';";

                      // $strsql  = "select * from edificios
                      //               where edfcod like '".$fltCodigo."' and edfdsc like '".$fltDsc.";";

        $edificios = array();
        $edificios = obtenerRegistros(sprintf($strsql
                                                  , valstr($fltCodigo).'%'
                                                  , valstr($fltDsc) .'%' ));
        // $edificios = obtenerRegistros($strsql);
        return $edificios;
    }
    function insertarNuevoEdificio($edfcod, $edfdsc, $edfubc){
      $insSql = "INSERT INTO `edificios`
      (`edfcod`, `edfdsc`, `edfubc`, `edfest`, `edfobs`)
VALUES('%s','%s','%s', 'ACT','');";

      $resultado = ejecutarNonQuery(sprintf($insSql,
                    valstr($edfcod),
                    valstr($edfdsc),
                    valstr($edfubc)));
        return $resultado;
    }

    function actualizarNuevoEdificio($edfcod, $edfdsc, $edfubc){
      $updSql = "update `edificios`
       set  `edfdsc` = '%s', `edfubc` = '%s'
       where `edfcod` = '%s';";

      $resultado = ejecutarNonQuery(sprintf($updSql,
                    valstr($edfdsc),
                    valstr($edfubc),
                    valstr($edfcod)));
      return $resultado;
    }

    function eliminarNuevoEdificio($edfcod){
      $dltSql = "delete `edificios`
       where `edfcod` = '%s';";
      $resultado = ejecutarNonQuery(sprintf($dltSql,
                    valstr($edfdsc)));

      return $resultado;
    }


    function obtenerEdificio($edfcod){
      $sqlstr = "select * from edificios where edfcod = '%s';";
      return obtenerUnRegistro(sprintf($sqlstr,$edfcod));
    }
 ?>
