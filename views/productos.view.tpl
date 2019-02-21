<h1>Gestión de Productos</h1>
<h2>{{nombre}}</h2>
<section class="row">
<table class="col-10 col-offset-1">
  <thead>
    <tr>
      <th>Código</th>
      <th>Producto</th>
      <th>Estado</th>
      <th>Precio Venta</th>
      <th>
        <a href="index.php?page=producto&mode=INS&prdcod=" class="btn">
          +
        </a>
      </th>
    </tr>
  </thead>
  <tbody>
    {{foreach productos}}
    <tr>
      <td>{{prdcod}}</td>
      <td>{{prddsc}}</td>
      <td>{{}}</td>
      <td>{{prdPrcVVnt}}</td>
      <td>
        <button>Editar</button>
        <button>Eliminar</button>
      </td>
    </tr>
    {{endfor productos}}
  </tbody>
</table>
</section>
