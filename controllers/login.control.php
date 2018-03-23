<?php
/* SignIN Controller
 * 2018-03-20
 * Created By OJBA

 */
  require_once("libs/template_engine.php");
  require_once("models/users.model.php");
  function run(){
    if(isset($_POST["email"])){
      $data = AutenticarUsuario($_POST["email"],$_POST["password"]);
      if($data == 1 || $data ==2){
        die($data." Credenciales no validas");
      }else{
        mw_setEstaLogueado($data["usuarionom"],$data["usuarioemail"],$data["usuariocod"],true);
        redirectToUrl("index.php");
      }
    }
    renderizar("login",array());
  }


  run();
?>
