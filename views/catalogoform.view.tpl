<h1>Gestión de Produtos</h1>
<h2>{{modedsc}} {{title}}</h2>
<hr>
<form action="index.php?page=catalogoform" method="post">
<input type="hidden" name="productocod" id="productocod" value="{{productocod}}"/>
<input type="hidden" name="mode" id="mode" value="{{mode}}" />

<fieldset>
  <label for="productosbarra">Código de Barra:</label>
  <input type="text" name="productosbarra" id="productosbarra" 
    placeholder="Código de Barra" maxlength="25" value="{{productosbarra}}" />
</fieldset>
<fieldset>
  <label for="productodesc">Descripción:</label>
  <input type="text" name="productodesc" id="productodesc" 
    placeholder="Descripción del Código" value="{{productodesc}}" 
    maxlength="128"/>
</fieldset>

<fieldset>
  <label for="productodesccrt">Descripción Corta:</label>
  <input type="text" name="productodesccrt" id="productodesccrt" 
    placeholder="Descripción Corta" value="{{productodesccrt}}"
    maxlength="64" />
</fieldset>

<fieldset>
  <label for="categoriacod">Categoría:</label>
  <input type="number" name="categoriacod" id="categoriacod" 
    placeholder="Código de Categoria" maxlength="1" value="{{categoriacod}}" />
</fieldset>

<fieldset>
  <label for="productoest">Estado:</label>
  <input type="text" name="productoest" id="productoest" 
    placeholder="Estado" maxlength="3" value="{{productoest}}"/>
</fieldset>

<fieldset>
  <label for="productotip">Tipo:</label>
  <input type="text" name="productotip" id="productotip" 
    placeholder="Tipo" maxlength="3" value="{{productotip}}"/>
</fieldset>

<fieldset>
  <button type='submit' name="btnGuardar">Guardar</button>
  <a class="btn danger" href="index.php?page=catalogo">Cancelar</a>
</fieldset>
</form>
