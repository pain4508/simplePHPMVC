<?php
/* SignIN Controller
 * 2018-03-20
 * Created By OJBA

 */
  require_once("libs/template_engine.php");

  function run(){
    if(isset($_POST["email"])){
      print_r($_POST);
      die();
    }
    renderizar("sigin",array());
  }


  run();
?>
