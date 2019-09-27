function verificar_nombre(){
	var elto = document.getElementById('nombre-disfraz');
	if(elto.value.length < 1 || elto.value.length > 30){
		alert('El texto no puede ser vacio ni poseer más de 30 carácteres.');
		return
	}
	else{
		var form =  document.getElementById('form_hola');
		form.submit();
	}
}