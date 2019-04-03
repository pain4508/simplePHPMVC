<?php
require_once 'libs/dao.php';
/**
 * ObtenerPaises
 * Obtiene todos los paises de la Tabla Pais.
 *
 * @return array
 */
function obtenerPaises()
{
    $sqlstr = "select * from pais;";
    $pais = array();
    $pais = obtenerRegistros($sqlstr);
    return $pais;
}

/**
 * Agrega Nuevo Pais a la tabla de Pais
 *
 * @param Array $data arreglo con los campos del formulario
 *
 */
function agregarNuevoPais($data)
{
    $insSql = "INSERT INTO `pais`
        (`idpais`, `nombrePais`, `paisGeoJson`, `fechaCreacion`, `usuarioCreador`)
    VALUES ( %d,'%s', '%s', '%s', '%s');";
        $result = ejecutarNonQuery(
            sprintf(
                $insSql,
                $data["idpais"],
                $data["nombrePais"],
                $data["paisGeoJson"],
                $data["fechaCreacion"],
                $data["usuarioCreador"]
        )
    );
    if($result){
        return getLastInserId();
    }
    return false;
}

/**
* Actualiza el Registro de Pais
*/
  function actualizarPais($data){

       $updSql = "UPDATE `pais` set
                 `nombrePais` = '%s', `paisGeoJson` = '%s',
                 `fechaCreacion` = '%s', `usuarioCreador` = '%s'
                  where idpais = %d;";
          $result = ejecutarNonQuery(
           sprintf(
               $updSql,
               $data["nombrePais"],
               $data["paisGeoJson"],
               $data["fechaCreacion"],
               $data["usuarioCreador"],
               $data["idpais"]
       )
   );
    return $result;
  }

  /**
   * Eliminando un Pais de la Base de Datos
   *
   * @param integer $idpais Código del Pais a Eliminar
   *
   * @return boolean Resultado de la eliminación
   */
  function eliminarPais($idpais)
  {
      $delSql = "delete from `pais` where idpais = %d;";
      return ejecutarNonQuery(
          sprintf(
              $delSql,
              $idpais
          )
      );
  }

/**
 * Obtiene un Pais a partir del código suministrado
 *
 * @param integer  $idpais Código del Pais
 *
 * @return  Array
 */
function obtienePaisPorId($idpais){

        $sqlstr = "select * from pais where idpais=%d;";
        return obtenerUnRegistro(sprintf($sqlstr, $idpais));

}

?>
