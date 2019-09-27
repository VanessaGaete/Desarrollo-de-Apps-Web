function agrandarfoto(){
	var img=document.getElementById("elfa");
	if(img.width == "240"){
		img.width = "600";
		img.height="800";
	}
	else{
		img.width = "240";
		img.height = "320";
	}

}