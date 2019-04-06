<h1>{{modeDsc}}</h1>
<section class="row">
    <form action="index.php?page=factura&mode={{mode}}&idFactura={{idFactura}}"
    method="POST" class="col-7 col-offset-2">
     <input type="hidden" name="idFactura" value="{{idFactura}}"/>
    <input type="hidden" name="tocken" value="{{tocken}}"/>
    <input type="hidden" name="mode" value="{{mode}}"/>
    <div class="row">
        <label class="col-5" for="idFactura">Codigo de Factura</label>
            <input type="number" min="0" max="99999999" id="idFactura" name="idFactura" value="{{idFactura}}"
            placeholder="Código de Factura" max="11"
            class="col-7" {{readonly}} />
    </div>
     <div class="row">
        <label class="col-5" for="idProducto">Codigo del Producto</label>
            <input type="text"  id="idProducto" name="idProducto" value="{{idProducto}}"
            placeholder="Codigo del Producto"  max="11"
            class="col-7" {{readonly}} />
    </div>
      <div class="row">
        <label class="col-5" for="idFormaPago">Forma de Pago</label>
            <input type="text" min="0" max="99999999" id="idFormaPago" name="idFormaPago" value="{{idFormaPago}}"
            placeholder="Forma de Pago" max="100"
            class="col-7" {{readonly}} />
    </div>
      <div class="row">
        <label class="col-5" for="idPaisDestino">Pais Destino</label>
            <input type="text"  id="idCategoria" name="idPaisDestino" value="{{idPaisDestino}}"
            placeholder="Pais Destino" max="11"
            class="col-7" {{readonly}} />
    </div>
      <div class="row">
        <label class="col-5" for="idDetalleFactura">Codigo Detalle de Factura</label>
            <input type="text"  id="idDetalleFactura" name="idDetalleFactura" value="{{idDetalleFactura}}"
            placeholder="Detalle Factura" max="11"
            class="col-7" {{readonly}} />
    </div>
      <div class="row">
            <div class="col-20 offset-7 center">
            <button id="btnCancelar">Cancelar</button>
            </button>
        </div>
    <script>
        $(document).ready(function(){
            $("#btnCancelar").click(function(e){
                e.preventDefault();
                e.stopPropagation();
                location.assign("index.php?page=compraProducto");
            });
           
        });
    </script>
    
    </form>
</section>