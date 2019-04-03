<h1>{{modeDsc}}</h1>
<section class="row">
    <form action="index.php?page=pais&mode={{mode}}&idpais={{idpais}}"
    method="POST" class="col-8 col-offset-2">
    <input type="hidden" name="idpais" value="{{idpais}}"/>
    <input type="hidden" name="tocken" value="{{tocken}}"/>
    <input type="hidden" name="mode" value="{{mode}}"/>
        <div class="row">
            <label class="col-5" for="idpais">Código del Pais</label>
            <input type="number" min="0" max="99999999" id="idpais" name="idpais" value="{{idpais}}"
            placeholder="Ingrese Codigo" max="3"
            class="col-7" {{readonly}} />
        </div>
        <div class="row">
            <label class="col-5" for="nombrePais">Nombre del Pais</label>
            <input type="text"  id="nombrePais" name="nombrePais" value="{{nombrePais}}"
            placeholder="Nombre del Pais" max="60"
            class="col-7" {{readonly}} />
        </div>
         <div class="row">
            <label class="col-5" for="paisGeoJson">Pais GeoJson</label>
            <input type="text" id="paisGeoJson"  name="paisGeoJson" value="{{paisGeoJson}}"
            placeholder="Pais GeoJson"
            class="col-7" {{readonly}} />
        </div>
        <div class="row">
            <label class="col-5" for="fechaCreacion"  >Fecha de Creación</label>
            <input type="text" id="fechaCreacion" name="fechaCreacion" value="{{fechaCreacion}}"
            placeholder="Fecha de Creación"
            class="col-7" {{readonly}} />
        </div>
         <div class="row">
            <label class="col-5" for="usuarioCreador">Usuario Creador</label>
            <input type="text" id="usuarioCreador" name="usuarioCreador" value="{{usuarioCreador}}"
            placeholder="Usuario Creador" max="45"
            class="col-7" {{readonly}} />
        </div>
        <div class="row" center>
            <div class="col-20 offset-7 center">
            <button id="btnProcesar">Confirmar</button>
            &nbsp;
            <button id="btnCancelar">Cancelar</button>
            </button>
        </div>
      </div>
            <script>
                $(document).ready(function(){
                    $("#btnCancelar").click(function(e){
                        e.preventDefault();
                        e.stopPropagation();
                        location.assign("index.php?page=paises");
                          });
                    $("#btnProcesar").click(function(e){
                        e.preventDefault();
                        e.stopPropagation();
                        document.forms[0].submit();
                    });
                    });

            </script>
    </form>
    {{if haserrores}}
        <section class="col-8 col-offset-2">
            {{foreach errores}}
                <div>{{this}}</div>
            {{endfor errores}}
        </section>
    {{endif haserrores}}
</section>
