function verificar_form(){
	var elto = document.getElementById('campoTexto');
	if(elto.value.length < 1 || elto.value.length > 5){
		alert('El texto no puede ser vacio ni poseer más de 5 carácteres.');
		return
	}
	else{
		var form =  document.getElementById('form_ejemplo');
		form.submit();
	}
}

function mostrarAlerta(){
	var msg = document.getElementById("prueba1").value;
	window.alert(msg);
}

function cambiaNombre(){
	var name = document.getElementById("prueba2").value;
	document.getElementById("nombre").innerHTML= name;
}

function calcular(){
	var v1 = parseFloat(document.getElementById("prueba3").value);
	var v2 = parseFloat(document.getElementById("prueba4").value);
	if(isNaN(v1) || isNaN(v2)) {£
		alert('Ambos valores deben ser numéricos!');
		return;
	}
	
	if(document.getElementById("suma").checked)
		document.getElementById("res").innerHTML=v1+v2;
	if(document.getElementById("mult").checked)
		document.getElementById("res").innerHTML=v1*v2;
	if(document.getElementById("elev").checked)
		document.getElementById("res").innerHTML=Math.pow(v1,v2);
}













