<h1>Gestion de Paises</h1>
<h2>{{Nombre}}</h2>
<section class="row">
    <table class="col-10 col-offset-1">
        <thead>
            <tr>
                <th>Código de Pais</th>
                <th>Nombre del Pais</th>
                <th>GeoJson del Pais</th>
                <th>Fecha de Creacion</th>
                <th>Usuario Creador</th>
                <th>
                    <a href="index.php?page=pais&mode=INS&idpais=" class="btn depth-1 s-margin">
                    <span class="ion-plus-circled"></span>
                        </a>
            </tr>
        </thead>
        <tbody>
        {{foreach paises}}
        <tr>
            <td>{{idpais}}</td>
            <td><a href="index.php?page=pais&mode=DSP&idpais={{idpais}}">{{nombrePais}}</td>
            <td>{{paisGeoJson}}</td>
            <td>{{fechaCreacion}}</td>
            <td>{{usuarioCreador}}</td>
            <td>
                <form action="index.php" method="GET">
                  <input name="page" value="pais" type="hidden"/>
                  <input name="mode" value="UPD" type="hidden"/>
                  <input name="idpais" value={{idpais}} type="hidden"/>
                <button type="submit">Editar</button>
                </form>
                <form action="index.php" method="GET">
                  <input name="page" value="pais" type="hidden"/>
                  <input name="mode" value="DEL" type="hidden"/>
                  <input name="idpais" value={{idpais}} type="hidden"/>
                <button type="submit">Eliminar</button>
                </form>
            </td>
        </tr>
        {{endfor paises}}
        </tbody>
    </table>
</section>
