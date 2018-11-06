<?php
/**
 * PHP Version 7
 * About Controller
 *
 * @category Controller
 * @package  Controllers
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @license  MIT
 *
 * @version 1.0.0
 *
 * @link http://url.com
 */

 require_once 'models/version.model.php';

function run(){
  $datosPersonales = obtenerVersion();
  // $datosPersonales = array(
  //   "nombre" => "Orlando Betancourth",
  //   "correo" => "obetancourthunicah@gmail.com",
  //   "telefono" => "not Available",
  //   "pais" => "Honduras",
  //   "job" => "Senior Full Stack Web Developer",
  //   "proyectos" => array()
  // );
  // Convertimos la  cadena separada por comas en un arreglo
  $tmpProyectos = explode(",",$datosPersonales["proyectos"]);
    $datosPersonales["proyectos"] = array();
    $i = 1;
  foreach($tmpProyectos as $pry){
    $datosPersonales["proyectos"][] = array(
      "codigo" => $i,
      "descripcion" => $pry
    );
    $i ++;
  }

  // $datosPersonales["proyectos"][] = array(
  //   "descripcion"=>"Proyecto 1",
  //   "codigo"=>"Pry01"
  // );
  // $datosPersonales["proyectos"][] = array(
  //   "descripcion"=>"Proyecto 2",
  //   "codigo"=>"Pry02"
  // );
  // $datosPersonales["proyectos"][] = array(
  //   "descripcion"=>"Proyecto 3",
  //   "codigo"=>"Pry03"
  // );

  renderizar("about", $datosPersonales);
}

run();

?>
