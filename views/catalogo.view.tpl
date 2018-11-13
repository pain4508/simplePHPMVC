<h1>Catálogo de Productos de Negocios Web</h1>
<hr>
<div style="text-align:center">
<table style="margin-left:auto; margin-right:auto;">
  <thead>
    <tr>
      <th>Código de Barra</th>
      <th>Producto</th>
      <th>Tipo de Producto</th>
      <th>Vendible</th>
      <th>
        <form action="index.php?page=catalogoform" method="post">
          <input type="submit" name="btnAgregar" value="Agregar +" />
        </form>
      </th>
    </tr>
  </thead>
  <tbody>
    {{foreach productos}}
    <tr>
      <td>{{productosbarra}}</td>
      <td>{{productodesccrt}}</td>
      <td>{{productotip}}</td>
      <td>{{productoest}}</td>
      <td>
        <form action="index.php?page=catalogoform" method="post">
          <input type="hidden" value="{{productocod}}" name="productocod" />
          <input type="submit" name="btnEditar" value="Editar"/>
          &nbsp;
          <input type="submit" name="btnEliminar" value="Eliminar" />
          &nbsp;
          <input type="submit" name="btnVer" value="Visualizar" />
        </form>
      </td>
    </tr>
    {{endfor productos}}
  </tbody>
</table>
</div>
