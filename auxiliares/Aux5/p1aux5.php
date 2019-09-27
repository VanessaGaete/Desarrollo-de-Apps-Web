function saveOrder($db, $nombre, $direccion, $comuna, $masa, $ingredientes, $comentarios,$costo){
	$stmt = $db->prepare("INSERT INTO ordenes (nombre, direccion, comuna, masa, comentarios,costo) VALUES (?, ?, ?, ?, ?, ?)");
	$stmt->bind_param("ssddsd", $nombre_bd, $direccion_bd, $comuna_bd, $masa_bd, $comentarios_bd, $costo_bd);
	$nombre_bd=limpiar($db,$nombre);
	$direccion_bd=limpiar($db,$direccion);
	$comuna_bd=limpiar($db,$comuna);
	$masa_bd=limpiar($db,$masa);
	$comentarios_bd=limpiar($db,$comentarios);
	$costo_bd=limpiar($db,$costo);
	if ($stmt->execute()) {
		$last_id = $db->insert_id;
		$stmt_ing=$db->prepare("INSERT INTO ordenes_ingredientes (orden_id, ingrediente_id) VALUES (?,?)");
		$stmt_ing->bind_param("dd",$id_orden_bd,$id_ing_bd);
		$id_orden_bd=$last_id;
		foreach ($ingredientes as $key => $value) {
			$id_ing_bd=$key;
			$stmt_ing->execute();
		}
		return true;
	}
	return false;
}