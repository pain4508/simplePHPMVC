<h1>{{modeDsc}}</h1>
<section class="row">
    <form action="index.php?page=producto&mode={{mode}}&idProducto={{idProducto}}"
    method="POST" class="col-7 col-offset-2">
     <input type="hidden" name="idProducto" value="{{idProducto}}"/>
    <input type="hidden" name="tocken" value="{{tocken}}"/>
    <input type="hidden" name="mode" value="{{mode}}"/>
    <div class="row">
        <label class="col-5" for="idProducto">Código Producto</label>
            <input type="number" min="0" max="99999999" id="idProducto" name="idProducto" value="{{idProducto}}"
            placeholder="Código del Producto" max="11"
            class="col-7" {{readonly}} />
    </div>
     <div class="row">
        <label class="col-5" for="nombreProducto">Nombre del Producto</label>
            <input type="text"  id="nombreProducto" name="nombreProducto" value="{{nombreProducto}}"
            placeholder="Nombre del Producto"  max="50"
            class="col-7" {{readonly}} />
    </div>
      <div class="row">
        <label class="col-5" for="precioProducto">descripcion</label>
            <input type="text" min="0" max="99999999" id="descripcion" name="descripcion" value="{{descripcion}}"
            placeholder="descripcion" max="100"
            class="col-7" {{readonly}} />
    </div>
      <div class="row">
        <label class="col-5" for="idCategoria">Categoria</label>
            <input type="text"  id="idCategoria" name="idCategoria" value="{{idCategoria}}"
            placeholder="Codigo de Categoria" max="11"
            class="col-7" {{readonly}} />
    </div>
       <div class="row">
        <label class="col-5" for="precio">Precio</label>
            <input type="text"  id="precio" name="precio" value="{{precio}}"
            placeholder="Precio del Producto" max="11"
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