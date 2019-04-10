
<h1>CARRITO DE COMPRA</h1>
<form id="idcarrito" action="index.php?page=carrito&mode={{mode}}&idcarrito={{idcarrito}}"
    method="POST" class="col-10 col-offset-2">
     <input type="hidden" name="idcarrito" value="{{idcarrito}}"/>
    <input type="hidden" name="tocken" value="{{tocken}}"/>
    <input type="hidden" name="codUsuario" value="4"/>
<h2>{{nombre}}</h2>
<section class="row" bordercolor = "black">
<table class="col-10 col-offset-1" >
    <thead>
        <tr>
            <th>Codigo del Producto</th>
            <th>Nombre del Producto</th>
            <th>Descripción del Producto</th>
            <th>Codigo de Categoria</th>
            <th>Precio del Producto</th>
        </tr>
    </thead>
    <tbody>
        {{foreach producto}}
        <tr>
            <td>{{idProducto}}</td>
            <td>{{nombreProducto}}</td>
            <td>{{descripcion}}</td>
            <td>{{idCategoria}}</td>
            <td>{{precio}}</td>
            <td><button id="btnEliminar"><a href="index.php?page=carrito&mode=DEL&idProducto={{idProducto}}">Eliminar Producto</button></td>
        </tr>
        {{endfor producto}}
    </tbody>   
</table>
   <div class="row">
            <div class="col-20 offset-7 center">
            <button id="btnConfirmar">Confirmar Pago</button>
             &nbsp;
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
              $("#btnConfirmar").click(function(e){
                e.preventDefault();
                e.stopPropagation();
                location.assign("index.php?page=factura");
            });
           $("#btnEliminar").click(function(e){
             e.preventDefault();
             e.stopPropagation();
              $("#formCarrito").submit();
             });
          
        });
    </script>
    <div class = "col-10 offset-6 center"><br>
    <table class= "col-10 offset-6 center">
        <thead>
            <tr>
                <td>***********DETALLE DE FACTURA********</td>
            </tr>
        </thead>
        <tbody>
             <div>
             <tr>
                Sub-Total:<input placeHolder = "Subtotal" value = {{subtotal}}>
              
             </tr>
             <br>
             <tr>
                Impuesto:<input placeHolder = "Impuesto" value="{{isv}}">
             </tr>
             <br>
             <tr>
                Total:<input placeHolder = "Total" value="{{total}}">
             </tr>
            
                </div>
        </tbody>
        
       </div>
       </table>
    </form>
</section>