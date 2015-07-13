//======use key number=========================
function numberKey(){
	var ekc=event.keyCode; 
	if(event.ctrlKey){
		if (ekc==13){
			return true;
		}
	}
	if (ekc==13){
		event.keyCode=9; 
		event.returnValue=true;
		return ;
	}
	if (ekc==27){
		event.keyCode=0; 
		event.returnValue=false;
		return ;
	}
	if(!((ekc>=45 && ekc<=57)||(ekc>=96 && ekc<=105)||(ekc>=33 && ekc<=39)||ekc==27||ekc==40||ekc==9||ekc==8)){
		event.keyCode=0; 
		event.returnValue=false;
	}
}

function moveKey(){
alert("ff")
	var ekc=event.keyCode;
	if(event.ctrlKey){
		if (ekc==13){
		event.returnValue=true;
		}
	}
	if (ekc==27){
		//if (optsubmit=="editeBC") EscKey();
		event.keyCode=0; 
		event.returnValue=false;
		return ;
	}
	if (ekc==13){
		event.keyCode=9; 
		event.returnValue=true;
	}
}