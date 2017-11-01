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

 ?>
