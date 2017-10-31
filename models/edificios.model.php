<?php
    require_once("libs/dao.php");
    function obtenerEdificios($fltCodigo = '%', $fltDsc = '%'){
        $strsql  = "select * from edificios
                      where edfcod like '%s' and edfdsc like '%s';";

        $edificios = array();
        $edificios = obtenerRegistros(sprintf($strsql
                                                  , $fltCodigo.'%'
                                                  , $fltDsc .'%' ));
        return $edificios;
    }

 ?>
