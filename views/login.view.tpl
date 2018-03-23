<form method="post" action="index.php?page=login" id="form_login">
  <fieldset>
    <label>Correo Electrónico</label>
    <input type="email" id="email" name="email" value="{{email}}" placeholder="Correo Electrónico" />
  </fieldset>
  <fieldset>
    <label>Contraseña</label>
    <input type="password" name="password" id="password" value="" placeholder="Contraseña" />
  </fieldset>

  <button name="btnLogin" id="btnLogin">Iniciar Sesión</button>
</form>
<div id="errorHolder" class="danger"/>
<script>
    var emailValidator = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    $().ready(function(e){
        $("#btnLogin").on('click',onClickHandler);
      });
      function onClickHandler(e){
        e.preventDefault();
        e.stopPropagation();
        var emailValue = $("#email").val();
        var errors = [];
        if(!emailValidator.test(emailValue)){
          errors.push("Correo Electrónico no es válido");
        }

        if(errors.length){
          var errorBuffer="<ul>";
          errorBuffer += errors.map(function(error,i){
            return '<li>'+error+'</li>'
            }).join('');
          errorBuffer += "</ul>";
          $("#errorHolder").html(errorBuffer)
        }else{
          $("#errorHolder").html("");
          $("#form_login").submit();
        }
      }
</script>
