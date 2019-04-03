<?php
/* Pais Controller
 * 2019-03-11
 * Created By PAIN
 */
require_once 'models/security/paises.model.php';
/**
 * Run controller function
 *
 * @return void
 */
function run()
{
    $viewData = Array();
    $viewData["paises"] =  obtenerPaises();
    $viewData["Nombre"] = "Paises CentroAmericanos";
    renderizar("security/paises", $viewData);
}
  run();
?>