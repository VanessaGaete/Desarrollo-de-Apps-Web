function agrandarfotoBruja(){
	var img=document.getElementById("bruja");
	if(img.width == "240"){                
		img.width = "600";
		img.height="800";
	}
	else{
		img.width = "240";
		img.height = "320";
	}

}