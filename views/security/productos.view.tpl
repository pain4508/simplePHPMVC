<h1>Gestion de Productos</h1>
<h2>{{nombre}}</h2>
<section class="row" bordercolor = "black">
<table class="col-10 col-offset-1" >
    <thead>
        <tr>
            <th>Código del Producto</th>
            <th>Nombre del Producto</th>
            <th>Precio del Producto</th>
            <th>Descripcion del Producto</th>
            <th>
                <a href="index.php?page=producto&mode=INS&idproducto=" class="btn depth-1 s-margin">
                <span class="ion-plus-circled"></span>
                </a>
            </th>
        </tr>
    </thead>
    <tbody>
        {{foreach productos}}
        <tr>
            <td>{{idproductos}}</td>
            <td><a href="index.php?page=producto&mode=DSP&idproductos={{idproductos}}">{{nombreProducto}}</td>
            <td>{{precioProducto}}</td>
            <td>{{descripcionProducto}}</td>
            <td><button>Editar</button></td>
            <td><button>Eliminar</button></td>
        </tr>
        {{endfor productos}}
    </tbody>   
</table>
</section>