<h1>CARRITO DE COMPRA</h1>
<h2>{{nombre}}</h2>
<section class="row" bordercolor = "black">
<table class="col-10 col-offset-1" >
    <thead>
        <tr>
            <th>Nombre del Producto</th>
            <th>Descripción del Producto</th>
            <th>Precio del Producto</th>
        </tr>
    </thead>
    <tbody>
        {{foreach producto}}
        <tr>
            <td>{{nombreProducto}}</td>
            <td>{{descripcion}}</td>
            <td>{{precio}}</td>
            <td><button>Eliminar</button></td>
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
            $("#btnProcesar").click(function(e){
              e.preventDefault();
              e.stopPropagation();
                document.forms[0].submit();
                    });
            $("#btnCancelar").click(function(e){
                e.preventDefault();
                e.stopPropagation();
                location.assign("index.php?page=compraProducto");
            });
          
        });
    </script>
</section>