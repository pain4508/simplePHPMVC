<h1>{{modesdsc}} Piedra</h1>
<hr />
<form action="index.php?page=piedra&mode={{mode}}&id={{id}}" method="post">
    <input type="hidden" name="id"  value="{{id}}" />
    <input type="hidden" name="mode"  value="{{mode}}" />
    <label for="id">Código</label>
    <input type="text" name="id" id="id" value="{{id}}" readonly />
    <br />
    <label for="nombre">Piedra</label>
    <input type="text" name="nombre" id="nombre" value="{{nombre}}" {{readonly}} />
    <br />
    <label for="Tipo">Tipo</label>
    <select name="tipo" id="tipo">
       {{foreach tipos}}
        <option value="{{cod}}" {{selected}}>{{value}}</option>
        {{endfor tipos}}
    </select>
    <br />
    <label for="categoria">Categoría</label>
    <select name="categoria" id="categoria">
       {{foreach categorias}}
        <option value="{{cod}}" {{selected}}>{{value}}</option>
        {{endfor categorias}}
    </select>
    <br />
    {{if showbtn}}
      <button type="submit">{{modebtn}}</button>
    {{endif showbtn}}
    <a href="index.php?page=piedras">Cancelar</a>
</form>
