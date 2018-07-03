<?php
    require_once "libs/dao.php";
    /*
    function obtenerTodosMensajes(){
        $sqlstr = "Select * from mensajes;";
        return obtenerRegistros($sqlstr);
    }
    */
    function obtenerProductos($nombre = "%%%", $estado = '%%%' )
    {
      $sqlstr = "select * from productos
            where productoNombre like '%s'
            and productoEstado like '%s';";
      return obtenerRegistros(
          sprintf(
              $sqlstr,
              $nombre,
              $estado
          )
      );
    }

    function obtenerProductoPorCodigo($codigo = 0)
    {
        $sqlstr = "select * from productos where productocod=%d;";
        return obtenerUnRegistro(
            sprintf(
                $sqlstr,
                $codigo
            )
        );
    }

    function agregarProducto(
      $productobarra, $productoCodInt, $productoNombre,
       $productoTipo, $productoEstado, $productoPrecio,
       $productoStock, $productoIva
      )
    {
        $sqlins = "INSERT INTO `productos`
            (`productobarra`,`productoCodInt`,`productoNombre`,
            `productoTipo`,`productoEstado`,`productoPrecio`,
            `productoStock`,`productoIva`)
            VALUES
            ('%s', '%s' , '%s',
             '%s', '%s', %f ,
              %f, %f);";
      $sqlins = sprintf(
          $sqlins, $productobarra, $productoCodInt, $productoNombre,
           $productoTipo, $productoEstado, $productoPrecio,
           $productoStock, $productoIva
      );

      ejecutarNonQuery($sqlins);
      return getLastInserId();
    }

    function actualizarProducto(
      $productobarra, $productoCodInt, $productoNombre,
       $productoTipo, $productoEstado, $productoPrecio,
       $productoStock, $productoIva, $productocod
    ){
        $sqlupd = "UPDATE `productos`
              SET
              `productobarra` = '%s',
              `productoCodInt` = '%s',
              `productoNombre` = '%s',
              `productoTipo` = '%s',
              `productoEstado` = '%s',
              `productoPrecio` = %f,
              `productoStock` = %f,
              `productoIva` = %f
              WHERE `productocod` = %d;";
        $sqlupd = sprintf(
          $sqlupd, $productobarra, $productoCodInt, $productoNombre,
           $productoTipo, $productoEstado, $productoPrecio,
           $productoStock, $productoIva, $productocod
        );

        return ejecutarNonQuery($sqlupd);
    }

    function eliminarProducto($productocod){
      $sqldel = "delete from productos where productocod=%d;";
      return ejecutarNonQuery(sprintf($sqldel, $productocod));
    }

 ?>
