<?php
    require_once("libs/dao.php");

    function obtenerTodosMensajes(){
        $sqlstr = "Select * from mensajes;";
        return obtenerRegistros($sqlstr);
    }

    function NuevoUsuario($correo, $contrasenia){
      $insSql = "Insert into usuario (usuarioemail,usuariopswd,usuariofching) values('%s','%s','%s');";
      $fchIngreso = date('Y-m-d H:i:s');
      $contrasenia = getPasswordFromPlain($contrasenia,substr($fchIngreso,-1));
      //die(sprintf($insSql,$correo,$contrasenia,$fchIngreso));
      $result = ejecutarNonQuery(sprintf($insSql,$correo,$contrasenia,$fchIngreso));
      if($result > 0) return getLastInserId();
      return false;
    }
    function AutenticarUsuario($email, $contrasenia){
      $sqlstr = "select * from usuario where usuarioemail = '%s';";
      $userToVerify = obtenerUnRegistro(sprintf($sqlstr,$email));
      if(count($userToVerify)){
        // verificar el estado
        // verificar el estado de la contraseña
        // verificar la vigencia de la contraseña
        // verificar los intentos fallidos
          $seed = substr($userToVerify["usuariofching"],-1);
          $passwordToCompare = getPasswordFromPlain($contrasenia,$seed);
          if($passwordToCompare === $userToVerify["usuariopswd"]){
            // actualizar fallidas a 0, y la fecha de ultimo login a la actual
            return array(
              "usuarioemail" => $userToVerify["usuarioemail"],
              "usuariocod" => $userToVerify["usuariocod"],
              "usuarionom" => $userToVerify["usuarionom"],
            );
          }else{
            //actualizar el contrador de contraseña fallidas
            return 2 ;// contraseña no coincide
          }
      }else{
        return 1; // 1 No se encontro el usuario
      }
    }

    $seedValues = array(
      "0"=>"abc",
      "1"=>"o5w",
      "2"=>"zah",
      "3"=>"abc",
      "4"=>"014",
      "5"=>"kye",
      "6"=>"csd",
      "7"=>"ahs",
      "8"=>"age",
      "9"=>"l4#",
    );

    function getPasswordFromPlain($password, $seed){
      global $seedValues;
      $saltedPassword = "";
      if($seed % 2 == 0){
        $saltedPassword = $seedValues[$seed] . $password;
      }else{
        $saltedPassword = $password . $seedValues[$seed] ;
      }
      return (hash('sha256',$saltedPassword));
    }
?>
