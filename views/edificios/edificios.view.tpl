<h2>Trabajar con Edificios</h2>
<hr/>
<form action="index.php?page=edificios" method="post">
  <label>Código de Edificio</label>
  <input type="text" value="" placeholder="Código de Edificio"
    name="fltCodEdificio" />
    <label>Nombre de Edificio</label>
    <input type="text" value="" placeholder="Nombre de Edificio"
      name="fltDscEdificio" />
      <button type="submit" name="btnFiltrar">Filtrar</button>
</form>
<hr />
<table style="width:90%;margin:0.5em auto;" border="1">
  <tr>
    <td colspan="6" style="text-align:right">
      <a href="index.php?page=edificio&mode=INS">+ Nuevo</a>
    </td>
  </tr>
  <tr>
    <th>&nbsp;</th>
    <th>Cod.</th>
    <th>Edificio</th>
    <th>Ubicación</th>
    <th>Editar</th>
    <th>Eliminar</th>
  </tr>
  {{foreach edificios}}
  <tr>
    <td></td>
    <td>{{edfcod}}</td>
    <td>{{edfdsc}}</td>
    <td>{{edfubc}}</td>
    <td></td>
    <td></td>
  </tr>
  {{endfor edificios}}
</table>
