<h1>Listado de Piedras</h1>
<style>
  table{
    width: 100%;
  }
  tr:nth-child(2n){
    background-color: #ddd;
  }
</style>
<table>
  <thead>
    <th>
      Código
    </th>
    <th>
      Piedra
    </th>
    <th>
      Tipo
    </th>
    <th>
      Categoría
    </th>
    <th>
      <a href="index.php?page=piedra&mode=INS&id=0">
          + Nuevo
      </a>
    </th>
  </thead>
  <tbody>
    {{foreach piedras}}
      <tr>
        <td>
          {{id}}
        </td>
        <td>
          {{nombre}}
        </td>
        <td>
          {{tipo}}
        </td>
        <td>
          {{categia}}
        </td>
        <td>
          <a href="index.php?page=piedra&mode=UPD&id={{id}}">
            Editar
          </a>
          <a href="index.php?page=piedra&mode=DSP&id={{id}}">
            Ver
          </a>
          <a href="index.php?page=piedra&mode=DEL&id={{id}}">
            Eliminar
          </a>
        </td>
      </tr>
    {{endfor piedras}}
  </tbody>
</table>
