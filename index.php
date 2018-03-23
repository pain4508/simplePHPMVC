<?php

    session_start();
    //Para poner la zona horaria independiente de SO de los script en DB
    date_default_timezone_set ('America/Tegucigalpa' );

    require_once("libs/utilities.php");

    $pageRequest = "home";

    if(isset($_GET["page"])){
        $pageRequest = $_GET["page"];
    }

    //Incorporando los midlewares son codigos que se deben ejecutar
    //Siempre
    require_once("controllers/verificar.mw.php");
    require_once("controllers/site.mw.php");


    //Este switch se encarga de todo el enrutamiento
    switch($pageRequest){
        case "home":
            //llamar al controlador
            require_once("controllers/home.control.php");
            die();
          case "signin":
            require_once("controllers/signin.control.php");
            die();
          case "login":
            require_once("controllers/login.control.php");
            die();
          case "logout":
            mw_setEstaLogueado("","","",false);
            redirectToUrl('index.php');
            die();
    }

      switch($pageRequest){
            case "micuenta":
              if(mw_estaLogueado()) {
                  require_once("controllers/micuenta.control.php");
              }else{
                  redirectToUrl('index.php?page=login');
              }
              die();
            case "cursos":
            if(mw_estaLogueado()) {
                require_once("controllers/cursos/cursos.control.php");
              }else{
                  redirectToUrl('index.php?page=login');
              }
              die();
              case "curso":
              if(mw_estaLogueado()) {
                  require_once("controllers/cursos/curso.control.php");
                }else{
                    redirectToUrl('index.php?page=login');
                }
                die();
          }

    //Si no muere antes no hay recurso
    require_once("controllers/error.control.php");
    die();
?>
