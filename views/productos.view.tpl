<h1>Gestión de Productos</h1>
<hr />
<div class="row">
  <div class="col-md-12 right">
    <a href="index.php?page=producto&mode=INS&cod=0">Nuevo</a>
  </div>
<table class="col-md-12" style="margin-left:1em;">
  <thead>
    <tr>
      <th>
        Código
      </th>
      <th>
        Producto
      </th>
      <th>
        Categoría
      </th>
      <th>
        Estado
      </th>
      <th>
        &nbsp;
      </th>
    </tr>
  </thead>
  <tbody>
    {{foreach productos}}
    <tr>
      <td>
        {{productoCodInt}}
      </td>
      <td>
        {{productoNombre}}
      </td>
      <td>
        {{productoTipo}}
      </td>
      <td>
        {{productoEstado}}
      </td>
      <td class="center">
        <a href="index.php?page=producto&mode=UPD&cod={{productocod}}">Editar</a> |
        <a href="index.php?page=producto&mode=DEL&cod={{productocod}}">Eliminar</a> |
        <a href="index.php?page=producto&mode=DSP&cod={{productocod}}">Ver</a>
      </td>
    </tr>
    {{endfor productos}}
  </tbody>
</table>
</div>
