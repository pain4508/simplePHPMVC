<h1>{{modedsc}} {{productoCodInt}} - {{productoNombre}}</h1>
<a href="index.php?page=productos" class="btn">Regresar</a>
{{if has_errors}}
  <div>
      {{foreach errors}}
        {{this}} <br/>
      {{endfor errors}}
  </div>
{{endif has_errors}}

<hr />
<form action="index.php?page=producto&mode={{mode}}&cod={{productocod}}" method="post">
  <div>
    <input type="hidden" name="productocod" value="{{productocod}}"/>
    <input type="hidden" name="mode" value="{{mode}}"/>
    <label for="productoCodInt">Código de Producto</label>
    <input type="text" name="productoCodInt" id="productoCodInt"
        value="{{productoCodInt}}" placeholder="Código de Producto" maxlength="10" />
    </div>
    <div>
      <label for="productobarra">Código de Barras</label>
      <input type="text" name="productobarra" id="productobarra"
          value="{{productobarra}}" placeholder="Código de Barras" maxlength="13" />
      </div>

      <div>
        <label for="productoNombre">Nombre</label>
        <input type="text" name="productoNombre" id="productoNombre"
            value="{{productoNombre}}" placeholder="Nombre del Producto" maxlength="128" />
        </div>

        <div>
          <label for="">Tipo</label>
          <select name="productoTipo" id="productoTipo">
              {{foreach tipoarray}}
                <option value="{{tipocod}}" {{tiposel}}>
                  {{tipodsc}}
                </option>
              {{endfor tipoarray}}
          </select>
        </div>

        <div>
          <label for="productoPrecio">Precio</label>
          <input type="text" name="productoPrecio" id="productoPrecio"
              value="{{productoPrecio}}" placeholder="Precio del Producto" maxlength="10" />
          </div>
          <div>
          <label for="productoIva">Impuesto</label>
          <input type="text" name="productoIva" id="productoIva"
              value="{{productoIva}}" placeholder="Porcentaje de Impuesto" maxlength="3" />
          </div>

          <div>
          <label for="productoStock">Inventario</label>
          <input type="text" name="productoStock" id="productoStock"
              value="{{productoStock}}" placeholder="Inventario del Producto" maxlength="5" />
          </div>
          <div>
            <label for="productoEstado">Estado</label>
            <select name="productoEstado" id="productoEstado">
                {{foreach estadoarray}}
                  <option value="{{cod}}" {{selected}}>
                    {{dsc}}
                  </option>
                {{endfor estadoarray}}
            </select>
          </div>
          <hr />
          <button class="btn" type="submit">{{btnMode}}</button>
          <a class="btn" href="index.php?page=productos">Cancelar</a>
</form>
