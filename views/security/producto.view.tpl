<h1>{{modeDsc}}</h1>
<section class="row">
    <form action="index.php?page=producto&mode={{mode}}&idproductos={{idproductos}}"
    method="POST" class="col-7 col-offset-2">
     <input type="hidden" name="idproductos" value="{{idproductos}}"/>
    <input type="hidden" name="tocken" value="{{tocken}}"/>
    <input type="hidden" name="mode" value="{{mode}}"/>
    <div class="row">
        <label class="col-5" for="idproductos">Código del Pais</label>
            <input type="number" min="0" max="99999999" id="idproductos" name="idproductos" value="{{idproductos}}"
            placeholder="Código del Producto" max="11"
            class="col-7" {{readonly}} />
    </div>
     <div class="row">
        <label class="col-5" for="nombreProducto">Nombre del Producto</label>
            <input type="text"  id="nombreProducto" name="nombreProducto" value="{{nombreProducto}}"
            placeholder="Nombre del Producto"  max="45"
            class="col-7" {{readonly}} />
    </div>
      <div class="row">
        <label class="col-5" for="precioProducto">Precio del Producto</label>
            <input type="number" min="0" max="99999999" id="precioProducto" name="precioProducto" value="{{precioProducto}}"
            placeholder="Precio del Producto" max="11"
            class="col-7" {{readonly}} />
    </div>
      <div class="row">
        <label class="col-5" for="descripcionProducto">Descripción del Producto</label>
            <input type="text"  id="descripcionProducto" name="descripcionProducto" value="{{descripcionProducto}}"
            placeholder="Descripción del Producto" max="11"
            class="col-7" {{readonly}} />
    </div>
      <div class="row">
            <div class="col-20 offset-7 center">
            <button id="btnProcesar">Confirmar</button>
            &nbsp;
            <button id="btnCancelar">Cancelar</button>
            </button>
        </div>
    <script>
        $(document).ready(function(){
            $("#btnCancelar").click(function(e){
                e.preventDefault();
                e.stopPropagation();
                location.assign("index.php?page=productos");
            });
            $("#btnProcesar").click(function(e){
                        e.preventDefault();
                        e.stopPropagation();
                        document.forms[0].submit();
                    });
        });
    </script>
    
    </form>
</section>