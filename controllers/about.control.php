<?php
function run(){
  $datosPersonales = array(
    "nombre" => "Orlando Betancourth",
    "correo" => "obetancourthunicah@gmail.com",
    "telefono" => "not Available",
    "pais" => "Honduras",
    "job" => "Senior Full Stack Web Developer",
    "proyectos" => array()
  );
  $datosPersonales["proyectos"][] = array(
    "descripcion"=>"Proyecto 1",
    "codigo"=>"Pry01"
  );
  $datosPersonales["proyectos"][] = array(
    "descripcion"=>"Proyecto 2",
    "codigo"=>"Pry02"
  );
  $datosPersonales["proyectos"][] = array(
    "descripcion"=>"Proyecto 3",
    "codigo"=>"Pry03"
  );

  renderizar("about", $datosPersonales);
}

run();

?>
