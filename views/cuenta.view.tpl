<h1>{{nombre}}</h1>
<b>{{cuenta}}</b><br />
<b>{{carrera}}</b>
<hr />
{{foreach addresses}}
  <div>
    {{adrs_name}}
    <br />
    {{adrs_email}}
    <br />
    {{adrs_din}}
  </div>
  <hr />
{{endfor addresses}}
