<?php
/**
 * Validación nombre con PHP.
 */
 function checkRegion($post){
 	if($post['region']!='sin-region'){
 			return true;
 	}
 	return false;
 }

 function checkComuna($post){
  if($post['region']!='sin-comuna'){
 		 return true;
  }
  return false;
 }

 function checkNameDisfraz($post){
 	if(isset($post['nombre-disfraz'])){
 		$regexp = "/^[A-Za-záéíóú\ ]+$/";
 		if(preg_match($regexp, $post['nombre-disfraz'])){
 			return true;
 		}
 	}
 	return false;
 }

 function checkDescripcion($post){
 	if(strlen($post['descripcion-disfraz'])<=500){
 			return true;
 	}
 	return false;
 }


function checkName($post){
	if(isset($post['nombre-contacto'])){
		$regexp = "/^[A-Za-záéíóú\ ]+$/";
		if(preg_match($regexp, $post['nombre-contacto']) && strlen($post['nombre-contacto'])>3 && strlen($post['nombre-contacto'])<81 ){
			return true;
		}
	}
	return false;
}


function is_valid_email($str)
{
  $matches = null;
  return (1 === preg_match('/^[A-z0-9\\._-]+@[A-z0-9][A-z0-9-]*(\\.[A-z0-9_-]+)*\\.([A-z]{2,6})$/', $str["email"], $matches));
}

/**
 * Validación para seleccionar ingredientes.
 */
function checkIngredientes($post){
	if(isset($post['ingredientes']) && count($post['ingredientes']) > 0){
		return true;
	}
	return false;
}
?>
