<?php
/* Productos Controller
 * 2019-02-19
 * Created By OJBA
 * Last Modification 2019-02-19 19:36
 */

require_once 'models/productos.model.php';
/**
 * Run controller function
 *
 * @return void
 */
function run()
{
    $viewData = Array();
    $viewData["productos"] =  obtenerProductos();
    $viewData["nombre"] = "Productos ABC";
    renderizar("productos", $viewData);
}
  run();

?>
