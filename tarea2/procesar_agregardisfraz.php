<?php
require_once("diccionarios.php");
require_once("validaciones.php");
require_once('db_config.php');
require_once('consultas.php');

$errores = array();
if(!checkName($_POST)){
	$errores[] = "No entregó su nombre.";
}
if(!checkRegion($_POST)){
	$errores[] = "Seleccione region";
}
if(!checkMasa($_POST)){
	$errores[] = "Seleccione masa.";
}
if(!checkIngredientes($_POST)){
	$errores[] = "Seleccione ingredientes.";
}
if(count($errores)>0){//Si el arreglo $errores tiene elementos, debemos mostrar el error.
	header("Location: index.php?errores=".implode($errores, "<br>"));//Redirigimos al formulario inicio con los errores encontrados
	return; //No dejamos que continue la ejecución
}
//Si llegamos aqui, las validaciones pasaron
$nombre = $_POST['nombre'];
$tipo_masa = getTipoMasa($_POST['masa']);
$ingredientes = getIngredientes($_POST['ingredientes']);
$direccion = $_POST['direccion'];
$comuna = getComuna($_POST['comunas']);
$costo = count($_POST['ingredientes'])*200;


//Guardamos en base de datos
$db = DbConfig::getConnection();
$res = saveOrder($db, $_POST['nombre'],$_POST['direccion'],$_POST['comunas'], $_POST['masa'], $_POST['ingredientes'], $_POST['comentario'], $costo );
$db->close();
?>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="taller4.css" type="text/css">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
	<h1>Confirmación pedido</h1>
	<p>
		Señor <?php echo $nombre; ?>,<br/>

		Hemos recibido su orden de una Pizza de masa <?php echo $tipo_masa; ?>. Con los siguientes ingredientes:
	</p>
	<ul>
		<?php foreach($ingredientes as $ingrediente) { ?>
		<li><?php echo $ingrediente; ?></li>
		<?php } ?>
	</ul>

	<p>Será enviado lo más pronto posible a la dirección <?php echo $direccion; ?> en la comuna de <?php echo $comuna['nombre']; ?>.</p>
	<p>¡Gracias por su preferencia!</p>
</body>
</html>
