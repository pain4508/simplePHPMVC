<script>
  var formToSubmit = null;
  var btnFiltrar = null;
  document.addEventListener('DOMContentLoaded',function(e){
      formToSubmit = document.getElementById("filtro_edificios");
      btnFiltrar = document.getElementById("btnFiltrar");
      btnFiltrar.addEventListener('click',function(f){
        var error = [];
        var edfcod = document.getElementById("fltCodEdificio").value;
        var edfDsc = document.getElementById("fltDscEdificio").value;

        if(edfDsc.length > 5){
          error.push("Descripción es mayor a lo permitido!");
        }

        var isValid = /^[A-Z]{1,5}$/;
        var isEmpty = /^\s*$/;
        if(!isEmpty.test(edfcod) && !isValid.test(edfcod)){
          error.push("Codigo no tiene el formato adecuado");
        }

        if(error.length){
           alert(error.join('/n/r'));
            f.preventDefault();
            f.stopPropagation();
        }
        });
    });
</script>
<h2>Trabajar con Edificios</h2>
<hr/>
<form action="index.php?page=edificios" method="post" id="filtro_edificios">
  <label>Código de Edificio</label>
  <input type="text" value="{{edfcod}}" placeholder="Código de Edificio"
    name="fltCodEdificio" id="fltCodEdificio" />
    <label>Nombre de Edificio</label>
    <input type="text" value="{{edfdsc}}" placeholder="Nombre de Edificio"
      name="fltDscEdificio" id="fltDscEdificio" />
      <button type="submit" name="btnFiltrar" id="btnFiltrar">Filtrar</button>
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
    <td><a href="index.php?page=edificio&mode=DSP&edfcod={{edfcod}}">{{edfdsc}}</a></td>
    <td>{{edfubc}}</td>
    <td><a href="index.php?page=edificio&mode=UPD&edfcod={{edfcod}}">editar</a></td>
    <td><a href="index.php?page=edificio&mode=DEL&edfcod={{edfcod}}">eliminar</a></td>
  </tr>
  {{endfor edificios}}
</table>
