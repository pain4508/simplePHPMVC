<section class="row">
  <div class="row">
    <div class="col-4">
      Nombre
    </div>
    <div class="col-6">
      {{nombre}}
    </div>
  </div>
  <div class="row">
    <div class="col-4">
      Correo
    </div>
    <div class="col-6">
      {{correo}}
    </div>
  </div>
  <div class="row">
    <div class="col-4">
      Proyectos Trabajados
    </div>
    <div class="col-6">
      <ol>
        {{foreach proyectos}}
          <li>{{codigo}}&nbsp;{{descripcion}}</li>
        {{endfor proyectos}}
      </ol>
    </div>
  </div>

</section>
