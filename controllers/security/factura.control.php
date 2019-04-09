<?php
require_once 'models/security/factura.model.php';
require_once 'models/security/carrito.model.php';

  function run(){
    if($_SERVER["REQUEST_METHOD"] === "POST"){
      $lastID =  agregarFactura($_POST);
      $prods = obtenerCarrito();
      foreach ($prods as $p) {
        agregarDetalleFactura($lastID, $p['idProducto']);
      }  
      borrarCarrito();
      redirectWithMessage("Pago recibido", "index.php?page=compraProducto");
    }
    renderizar("security/factura",Array());
  }
  run();
?>