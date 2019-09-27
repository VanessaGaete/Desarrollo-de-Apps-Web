function verificar_nombre(){
	var regiones = document.getElementById("regiones");
	var comunas = document.getElementById("comunas");
	var nombreDisfraz = document.getElementById('nombre-disfraz');
	var descripcionDisfraz=document.getElementById('descripcion-disfraz');
	var nombreContacto=document.getElementById('nombre-solicitante');
	var foto=document.getElementById('archivosubido');
	var email=document.getElementById('email-solicitante');
	var numero=document.getElementById('celular-solicitante');
	var categoria= document.getElementById('categoria-solicitante');
	var talla= document.getElementById('talla-solicitante');
	console.log(categoria.value);
	console.log(talla.value);
	var phoneno = /^\d{10}$/;
	var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;


	if(nombreDisfraz.value.length < 1){
		alert('"Nombre del disfraz" no puede ser vacio');
		return;
	}
	else if(descripcionDisfraz.value.length > 500){
		alert('La descrición no puede poseer más de 500 carácteres.');
		return;
	}
	else if(categoria.value=="0"){
		alert("Ingrese categoria");
		return;
	}
	else if(talla.value==""){
		alert("Ingrese talla");
		return;
	}
	else if(nombreContacto.value.length < 3 || nombreContacto.value.length > 80){
		alert('"Nombre solicitante" debe poseer entre 3 y 80 carácteres');
		return;
	}
	else if(re.test(email.value)==false){
		alert('Debe escribir un email válido');
		return;
	}
	//else if(phoneno.test(numero)==false){
	//	alert('Debe escribir un numero válido');
    //	return;
    //}
	else if(regiones.value=="sin-region"){
		alert("Ingrese una region");
		return;
	}
	else if(comunas.value=="sin-comuna"){
		alert("Ingrese una comuna");
		return;
	}
	else{
		var form =  document.getElementById('form_hola');
		form.submit();
	}

}