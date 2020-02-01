<h1>Gestion de Productos-Lubricantes</h1>
<h2>{{nombre}}</h2>
<h2>Categorias</h2>
<h3>1. Aceites</h3>
<h3>2. Grasas</h3>
<section class="row" bordercolor = "black">
<table class="col-10 col-offset-1" >
    <thead>
        <tr>
            <th>Código del Producto</th>
            <th>Nombre del Producto</th>
            <th>Descripción del Producto</th>
            <th>Categoria</th>
            <th>Precio del Producto</th>
            <th>
                <a href="index.php?page=carrito" class="btn depth-1 s-margin">
                <span class="ion-eye">Ver Carrito</span>
                <a href="index.php?page=producto&mode=INS&idProducto=" class="btn depth-1 s-margin">
                <span class="ion-circled">Agregar Producto</span>
                </a>
            </th>
        </tr>
    </thead>
    <tbody>
        {{foreach producto}}
        <tr>
            <td>{{idProducto}}</td>
            <td><a href="index.php?page=producto&mode=DSP&idProducto={{idProducto}}">{{nombreProducto}}</td>
            <td>{{descripcion}}</td>
            <td>{{idCategoria}}</td>
            <td>{{precio}}</td>
            <td><a id="addCarrito" class="btn" href="index.php?page=carrito&idProducto={{idProducto}}&mode=INS">Agregar al carrito de Compra</a></td>
            </form>
        </tr>
        {{endfor producto}}
    </tbody>   
</table>
</section>