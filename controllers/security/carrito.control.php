<?php
require_once 'models/security/lubricantes.model.php';
require_once 'models/security/carrito.model.php';
    
function run(){
  if($_SERVER["REQUEST_METHOD"] === "GET"){
    if(isset($_GET["mode"])){
        $viewData["mode"] = $_GET["mode"];
        $viewData["idProducto"] = $_GET["idProducto"];
        switch ($viewData["mode"]){  
            case 'INS' :
            $lastID = agregarACarrito($_GET);
            redirectWithMessage("Producto Agregado Satisfactoriamente", "index.php?page=compraProducto");
            die();
      
            break;
            case 'UDP':
            break;
            case 'DEL':
            break;
            case 'VER':
            
            break;
        }
    }   
}
$viewData["producto"] = obtenerCarrito();
renderizar('security/carrito', $viewData);
}

run();
?>