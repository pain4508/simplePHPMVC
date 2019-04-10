<h1>{{modeDsc}}</h1>
<section class="row">
    <form id="formPago" action="index.php?page=factura&mode={{mode}}&idFactura={{idFactura}}"
    method="POST" class="col-7 col-offset-2">
     <input type="hidden" name="idFactura" value="{{idFactura}}"/>
    <input type="hidden" name="tocken" value="{{tocken}}"/>
    <input type="hidden" name="codUsuario" value="4"/>
    
     <div class="row">
        <label class="col-5" for="prdEst">Forma de Pago:</label>
        <select name="formaPago" id="formaPago" class="col-7">
            <option>Seleccione...</option>
            <option>Tarjeta de Credito</option>
            <option>Paypal</option>
        </select>
      </div>
        <div class="row">
        <label class="col-5" for="prdEst">Pais Destino:</label>
        <select name="paisDestino" id="paisDestino" class="col-7">
            <option>Seleccione...</option>
            <option>EE.UU</option>
            <option>Mexico</option>
            <option>Guatemala</option>
            <option>Canada</option>
            <option>El Salvador</option>
            <option>Nicaragua</option>
            <option>Panama</option>
            <option>Costarica</option>
            <option>España</option>
            <option>Otros...</option>
        </select>
      </div> 
      <div class="row">
            <div class="col-20 offset-7 center">
            <button id="btnPagar">Pagar</button>
            <button id="btnCancelar">Cancelar</button>
            
        </div>
    <script>
        $(document).ready(function(){
            $("#btnCancelar").click(function(e){
                e.preventDefault();
                e.stopPropagation();
                location.assign("index.php?page=compraProducto");
            });
            $("#btnPagar").click(function(e){
                e.preventDefault();
                e.stopPropagation();
                $("#formPago").submit();
            });
           
        });
    </script>
    
    </form>
</section>