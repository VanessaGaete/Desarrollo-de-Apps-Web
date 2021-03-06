<?php
require_once('db_config.php');
require_once('consultas.php');
$db = DbConfig::getConnection();
$regiones = getRegiones($db);
$db->close();
?>

<!DOCTYPE html>

<html lang="es">
<head>
	<meta charset="utf-8"/>
	<title>Agrega Disfraz</title>
	<!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" type="text/css" href="bootstrap.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="regycom.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="size.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="v1.js"></script>

    <style>
		h1 {
  			font-size: 80px;
  			color: black;
  		}
  		input {
    		color: blue;
  		}
    	.titulo {
    		background-color: lightblue;
  		}
  		body {
    		background-color: lightblue;
  		}
	</style>

</head>
<body>


<div class="formulario" style="margin-left: 30px; margin-right: 30px;">
	<h1 class="titulo">Agrega tu Disfraz</h1>

	<form id="myform" method="post" action="procesar_orden.php" onsubmit="return dataValidator();">

    <label for="region" class="text-field">Región</label>
    	<select id="regiones" name="region">
      	<?php foreach($regiones as $region){ ?>
				<option value="<?php echo $region['id'];?>"><?php echo $region['nombre']; ?></option>
			  <?php }?>
    	</select>

    <script>var regiones = document.getElementById("regiones").value;</script>

    <?php
      $db = DbConfig::getConnection();
      $comunas= getComunas($db, $r);
      $db->close();
    ?>


    <label for="comuna" class="text-field">Comuna</label>
    	<select id="comunas" name="comuna">
      	<?php foreach($comunas as $comuna){ ?>
				<option value="<?php echo $comuna['id']; ?>"><?php echo $comuna['nombre']; ?></option>
				<?php } ?>
    	</select>
		  Nombre disfraz <input type="text" id="nombre-disfraz" name="nombre-disfraz" size=30 ><br><br>

    Descripción disfraz <br>
		<textarea id="descripcion-disfraz" name="descripcion-disfraz" cols="40" rows="8"></textarea> <br><br>
		<label for="categoria" class="text-field">Categoría</label>
    	<br>
    	<select id="categoria" name="categoria">
    		<option value="0">Seleccione categoria</option>
			<option value="1">Infantil niña</option>
      		<option value="2">Infantil niño</option>
      		<option value="3">Infantil unisex</option>
      		<option value="4">Mujer</option>
      		<option value="5">Hombre</option>
      		<option value="6">Adulto unisex</option>
    	</select>

    	<select id="size">
    		<option value="">-- seleccione talla -- </option>
		</select>
		<br><br>
		Foto del Disfraz:<br>
  		<p id="fotos">
    		Sube un archivo:
    		<input type="file" id="archivosubido" name="archivosubido" ><br>
  		</p>
		<button type="button" onclick="addPhotoInput()">Agregar Foto </button><br><br>
		Nombre contacto:<br>
		<input type="text" id="nombre-contacto" name="nombre-contacto" size=80><br>
		Email contacto:<br>
		<input type="email" id="email-contacto" name="email-contacto" size=30><br>
		Número de Contacto:<br>
		<input type="text" id="numero" name="numero" size=15><br><br>
		<input type="submit" value="Crear mi pizza">
		<button type="button" onclick="verificar_nombre();">Enviar</button>
	</form>

</div>
<script>
	function addPhotoInput(){
		var div = document.getElementById("fotos");
		if (div.childElementCount <= 5){
			var input = document.createElement('input');
			input.type = "file";
			div.appendChild(input);
		}
	}
</script>
</body>
</html>
