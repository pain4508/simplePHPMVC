<h1>{{modedsc}}</h1>

<form action="index.php?page=edificio&mode={{mode}}&edfcod={{edfcod}}"
  method="post" id="form_edificio">

  <fieldset class="row">
    <label for="edfcod" class="col-sm-2 offset-sm-3">Código</label>
    <input type="text" name="edfcod" value="{{edfcod}}"
      placeholder="Codigo de Edificio" {{if isNotInsert}} disabled=disabled {{endif isNotInsert}}
      id="edfcod" class="col-sm-4"/>
    {{if isNotInsert}} <input type="hidden" value={{edfcod}} name="edfcod" /> {{endif isNotInsert}}
  </fieldset>

  <fieldset class="row">
    <label class="col-sm-2 offset-sm-3" for="edfdsc">Nombre de Edificio</label>
    <input type="text" name="edfdsc" value="{{edfdsc}}"
      placeholder="Descripción del Edificio"  id="edfdsc"
       class="col-sm-4" {{if isDisplay}}disabled=disabled{{endif isDisplay}} />
    </fieldset>

    <fieldset class="row">
      <label class="col-sm-2 offset-sm-3" for="edfubc">Ubicación Edificio</label>
      <input type="text" name="edfubc" value="{{edfubc}}"
        placeholder="Ubicación del Edificio"  id="edfubc"
        class="col-sm-4" {{if isDisplay}}disabled=disabled{{endif isDisplay}} />
      </fieldset>
      <fieldset class="row">
        <span class="col-sm-4 offset-sm-5 right">
          {{ifnot isDisplay}}
            <button class="btn btn-primary" type="submit" name="btnGuardar" id="btnGuardar">Guardar</button>
            &nbsp;
          {{endifnot isDisplay}}
          <a class="btn btn-danger" href="index.php?page=edificios">Cancelar</a>
        </span>
      </fieldset>
</form>
