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
            
            agregarACarrito($_GET);
            redirectWithMessage("Producto Agregado Satisfactoriamente", "index.php?page=compraProducto");
            die();
      
            break;
            case 'UDP':
            break;
            case 'DEL':
            eliminarProductoDeCarrito($_GET["idProducto"]);
            redirectWithMessage("Producto Eliminado Satisfactorimente", "index.php?page=carrito");
            
            break;
            case 'VER':
            
            break;
        }
    }   
  }
$subtotal  =  0;
$viewData["producto"] = obtenerCarrito();
foreach ($viewData["producto"] as $p) {
  $subtotal += $p["precio"]; 
}
$viewData["subtotal"] = $subtotal;
$viewData["isv"]= $subtotal * 0.15;
$viewData["total"]= $subtotal + $viewData["isv"];
renderizar('security/carrito', $viewData);
}



run();
?>