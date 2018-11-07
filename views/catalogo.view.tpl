<h1>Catálogo de Productos de Negocios Web</h1>
<hr>
<table>
  <thead>
    <tr>
      <th>Código de Barra</th>
      <th>Producto</th>
      <th>Tipo de Producto</th>
      <th>Vendible</th>
    </tr>
  </thead>
  <tbody>
    {{foreach productos}}
    <tr>
      <td>{{productosbarra}}</td>
      <td>{{productodesccrt}}</td>
      <td>{{productotip}}</td>
      <td>{{productoest}}</td>
    </tr>
    {{endfor productos}}
  </tbody>
</table>
