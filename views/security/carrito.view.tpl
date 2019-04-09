
<h1>CARRITO DE COMPRA</h1>
<h2>{{nombre}}</h2>
<section class="row" bordercolor = "black">
<table class="col-10 col-offset-1" >
    <thead>
        <tr>
            <th>Codigo del Producto</th>
            <th>Nombre del Producto</th>
            <th>Descripción del Producto</th>
            <th>Categoria</th>
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
            <td><button>Eliminar Producto</button></td>
        </tr>
        {{endfor producto}}
    </tbody>   
</table>
   <div class="row">
            <div class="col-20 offset-7 center">
            <a href="index.php?page=factura" id="btnConfirmar">Confirmar Pago</a>
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
          
        });
    </script>
</section>