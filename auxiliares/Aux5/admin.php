<?php
require_once('db_config.php');
require_once('consultas.php');
require_once('diccionarios.php');
$db = DbConfig::getConnection();
$ordenes = getOrders($db);
$db->close();

?>
<!DOCTYPE html>
<html>
<head>	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
	<h1>Administración</h1>
	<h1>Lista pedidos</h1>
	<table class="pure-table">
		<thead>
		<tr>
			<td>Nombre</td>
			<td>Dirección</td>
			<td>Masa</td>
			<td>Acciones</td>
		</tr>
		</thead>
		<tbody>	
		<!-- Repetir este trozo por cada orden e imprimir los valores reales -->
		<!--<tr>
			<td>Juan Perez</td> Ejemplo
			<td>Beauchef 851, Santiago</td>
			<td>Delgada</td>
			<td><a href="ver.php?orden_id=2">Ver</a></td>
		</tr> -->
		<?php 
		$query= 'SELECT * FROM ordenes';
		$result=pg_query($query) or die ('La consulta fallo:' .pg_last_error());
		while($line=pg_fetch_array($result,null,PGSQL_ASSOC)){
			echo $line;
		}
		?>
		</tbody>
	</table>
</body>
</html>