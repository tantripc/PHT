//=======================================================
var oPopup = window.createPopup()
var sInitColor = null;
var sInitBackColor = null;
var sInitForeColor = null;
var lasave="New Document...";
//=======================================================
function callFormatting(sFormatString){
	document.execCommand(sFormatString);
}
function keychangeFontSize(dieukhien){
	var nowfontsize=document.queryCommandValue("FontSize");
	if((nowfontsize==0 && dieukhien==-1)||(nowfontsize==7 && dieukhien==1))return;
	else document.execCommand("FontSize", false, nowfontsize+dieukhien);
}

var fArrayUni = new Array();
function getSystemFonts(){
	var j=0;
	var oDropDown = oToolBar.createDropDownListAt("4");
	oDropDown.setAttribute("id","FontNameList");
	for (i = 1 ;i <dlgHelper.fonts.count ;i++){ 
		if(dlgHelper.fonts(i)=="Arial" ||dlgHelper.fonts(i)=="Times New Roman" ||dlgHelper.fonts(i)=="Tahoma"||dlgHelper.fonts(i)=="Verdana"||dlgHelper.fonts(i)=="Courier New"||dlgHelper.fonts(i)=="Palatino Linotype"){
			fArrayUni[j] = dlgHelper.fonts(i);
			j=j+1;
		}
	} 
	var temp;
	for(i=0;i<fArrayUni.length;i++){
		temp=fArrayUni[i];
		for(j=0;j<fArrayUni.length;j++){
			if(fArrayUni[j] > temp){
				temp=fArrayUni[i];
				fArrayUni[i]=fArrayUni[j];
				fArrayUni[j]=temp;
			}
		}
	}
	for(j=0;j<fArrayUni.length;j++){
		var aOptions = oDropDown.getOptions();	
		var oOption = document.createElement("OPTION");
		aOptions.add(oOption);	
		oOption.text = fArrayUni[j]; 
		oOption.Value = j+1;
	}
	oDropDown.setAttribute("onchange",ChangeFont);
}
var fArray = new Array();
function getBlockFormats(){
	var a=dlgHelper.blockFormats.count;
	var oDropDown = oToolBar.createDropDownListAt("5");
	oDropDown.setAttribute("id","FormatList");
	for (i = 1;i < dlgHelper.blockFormats.count;i++)
	{ 
		fArray[i] = dlgHelper.blockFormats(i);
		var aOptions = oDropDown.getOptions();	
		var oOption = document.createElement("OPTION");
		aOptions.add(oOption);	
		oOption.text = fArray[i];
		oOption.Value = i;
	} 
	oDropDown.setAttribute("onchange",ChangeFormat);
}
 function VerticalMode(){
 	if (oDivttt.style.writingMode == 'tb-rl')
    	oDivttt.style.writingMode = 'lr-tb';
  	else
    	oDivttt.style.writingMode = 'tb-rl';
}
function setfontsize(){
	colorpick.style.visibility="hidden";
	colorpickback.style.visibility="hidden";
	idRclickimg.style.visibility="hidden";
	idRclickcell.style.visibility="hidden";
	idRclicktable.style.visibility="hidden";
	if (document.queryCommandValue("FontSize")!=null){
	fsize=document.queryCommandValue("FontSize");
	}else fsize=10;
	oToolBar.getItem(6).getOptions().item(oToolBar.getItem(6).setAttribute("selectedIndex",fsize));
	for(j=0;j<fArray.length;j++){
		if(fArray[j]==document.queryCommandValue("FormatBlock")){
			oToolBar.getItem(5).getOptions().item(oToolBar.getItem(5).setAttribute("selectedIndex",j-1));
		}
	}
	for(j=0;j<fArrayUni.length;j++){
		if(fArrayUni[j]==document.queryCommandValue("FontName")){
			oToolBar.getItem(4).getOptions().item(oToolBar.getItem(4).setAttribute("selectedIndex",j));
		}
	}
}
function changeFontSize(){
	var sSelected=oToolBar.getItem(6).getOptions().item(oToolBar.getItem(6).getAttribute("selectedIndex"));
   	document.execCommand("FontSize", false, sSelected.value);
}
function ChangeFont(){
	var sSelected=oToolBar.getItem(4).getOptions().item(oToolBar.getItem(4).getAttribute("selectedIndex"));
	document.execCommand("FontName", false, sSelected.text);
}

function ChangeFormat(){
	var sSelected=oToolBar.getItem(5).getOptions().item(oToolBar.getItem(5).getAttribute("selectedIndex"));
	document.execCommand("FormatBlock", false, sSelected.text);
} 
function ChangeFontColor(sColorType,strColor){
	if(strColor!=''){
		if(sColorType=='ForeColor'){
			sInitForeColor=strColor
		}else {
			sInitBackColor=strColor
		}
		bgcolordocument[0]=strColor;
	}
	colorpick.style.visibility="hidden";
	colorpickback.style.visibility="hidden";
	document.execCommand(sColorType, false, strColor);
}
var colorselect;
function callColorDlg1(sColorType){
	colorselect=document.queryCommandValue(sColorType)
	if(colorselect!=null){
		colorselect = colorselect.toString(16);
		if (colorselect.length < 6) {
		  	var sTempString = "000000".substring(0,6-colorselect.length);
		  	colorselect = sTempString.concat(colorselect);
		}
	}else colorselect="000000"
	if(sColorType=='ForeColor'){
		colorpick.style.visibility="visible";
		colorpickback.style.visibility="hidden";
	}else {
		colorpick.style.visibility="hidden";
		colorpickback.style.visibility="visible";
	}
}
function callColorDlg(sColorType){
	sInitColor=colorselect;
	colorpick.style.visibility="hidden";
	colorpickback.style.visibility="hidden";
	if (sInitColor == null)
		var sColor = dlgHelper.ChooseColorDlg();
	else
		var sColor = dlgHelper.ChooseColorDlg(sInitColor);
		sColor = sColor.toString(16);
	if (sColor.length < 6) {
	  	var sTempString = "000000".substring(0,6-sColor.length);
	  	sColor = sTempString.concat(sColor);
	}
	if(sInitColor!=sColor)document.execCommand(sColorType, false, sColor);
		sInitColor = sColor;
		if(sColorType=='ForeColor'){sInitForeColor=sColor;}else {sInitBackColor=sColor;}
}

//==============================================================
function timtableborder0(oBjdiv){
 	for (i=0; i<da[oBjdiv].all.length; i++){
    	if(da[oBjdiv].all(i).tagName =="TABLE"){
    		if(da[oBjdiv].all(i).border==0){
    			da[oBjdiv].all(i).className="lienket2";
    			var tb=da[oBjdiv].all(i);
    			for (j=0; j<tb.cells.length; j++){
					tb.cells(j).className="td"}
    		}else if(da[oBjdiv].all(i).border!=0){
    			da[oBjdiv].all(i).className="lienketedit";
    			var tb=da[oBjdiv].all(i);
    			for (j=0; j<tb.cells.length; j++){
					tb.cells(j).className=""
    			}
    		}
    	}
    }
}
function findIMG(e){
  if (e.tagName == "IMG"){
    return e; }
  else if (e.tagName == "BODY") {return null;}
  else {  return findIMG(e.parentElement); }
}
function findTD(e){
  if (e.tagName == "TD"){
    return e; }
  else if (e.tagName == "DIV" ||e.tagName == "toolbar") {return null;}
  else {  return findTD(e.parentElement); }
}
function findtable(e){
  if (e.tagName == "TABLE") {
    return e; }
  else if (e.tagName == "BODY" || e.tagName == "DIV" ||e.tagName == "toolbar"){return null;}
  else {  return findtable(e.parentElement); }
}
function findDiv(e){
  if (e.tagName == "DIV") {
    return true; }
  else if (e.tagName == "BODY" ||e.tagName == "toolbar"){return null;}
  else {  return findDiv(e.parentElement); }
}
var selImg=null;
function setImgalign(alg){
	if(selImg!=null){selImg.align=alg;
	if(alg=="right"){
		selImg.style.marginRight="1px";
		selImg.style.marginLeft="10px";
	}else if(alg=="left"){
		selImg.style.marginRight="10px";
		selImg.style.marginLeft="1px";
	}else {
		selImg.style.marginRight="1px";
		selImg.style.marginLeft="1px";
	}
  }
}
function setoldImg(){
  var e, r, te1;
  e = window.event.srcElement;
  clicknow=e;
  window.status = e.tagName;
  setTimeout("window.status=lasave", 700);
	if(e.tagName=="IMG" || e.tagName=="TABLE"){selImg=e;}
	else  selImg=null;
}
//=======Inserrt=========================================
function insertTable1(){
	instable.style.visibility="visible";
}
function insertTable2(){
	instable.style.visibility="hidden";
	if(rng!=null) rng.execCommand("Paste");
}
function insertTable(){
	var tblArr=null;
	tblArr=window.showModalDialog('script_tool/tbl.html',window,'status:no;help:no; dialogHeight:300px; dialogWidth:400px; scroll:no;')
	if(tblArr){document.execCommand("Paste");}
}
function defaultCell(typebt,objt){
	for(i=0;i<typebt.cells.length;i++){
		if(objt=="bg"){typebt.cells(i).borderColorDark=typebt.cells(i).bgColor;
		}else if(objt=="hei"){typebt.cells(i).height="";
			typebt.cells(i).style.height="";
		}
	}
}
function defaultTable(typebt){
	var tbtemp=findtable(clicktbortd);
	if(tbtemp!=null){
	  if(tbtemp.tagName=="TABLE"){
		  tbtemp.style.width="";tbtemp.width="100%";
		  tbtemp.style.height="";tbtemp.height="";
		if(typebt=="Table Default"){
		  tbtemp.border="1";tbtemp.cellSpacing="0";tbtemp.cellPadding="0";
		  tbtemp.borderColorDark="#ffffff";tbtemp.borderColorLight="#333333";
		  defaultCell(tbtemp,"hei");
		  defaultCell(tbtemp,"bg");
		}else if(typebt=="Background  Default"){
		  tbtemp.border="1";tbtemp.cellSpacing="0";tbtemp.cellPadding="0";
		  tbtemp.borderColorDark="#ffffff";tbtemp.borderColorLight="#666666";
			for(i=0;i<tbtemp.cells.length;i++){
				tbtemp.cells(i).bgColor="";
				tbtemp.cells(i).borderColorDark=tbtemp.cells(i).bgColor;
				tbtemp.cells(i).borderColorLight="";
			}
		}	
	  }
	}
}
function ghichuImg(){
	if(selImg!=null){
		if(selImg.tagName=="IMG"){
			textRange = document.body.createTextRange();
			textRange.moveToElementText(selImg);
			textRange.execCommand("Copy");
			textRange.moveToElementText(tmpChuThich);
			textRange.execCommand("Paste");
			tmpChuThich.innerHTML='<table style="margin-top:4px;"width="20" border="0" cellspacing="0" cellpadding="0"'+'align="'+"left"+'"><tr><td width="100%" style="padding:0px">'+tmpChuThich.innerHTML+'</td></tr><tr><td width="100%" style="font-family: Verdana; font-size: 11px;color: #000080; font-style: italic" align="center">&nbsp;</td></tr></table>'
			textRange.moveToElementText(tmpChuThich);
			textRange.execCommand("Copy");
			textRange.moveToElementText(selImg);
			textRange.execCommand("Paste");
			selImg=null;
		}
	}
}
//=======================================================
function phimCtrl(){
	var ekc=event.keyCode;
	if(event.ctrlKey){
		if(ekc==78||ekc==72||ekc==76||ekc==77||ekc==87||ekc==82||ekc==80||ekc==69||ekc==79){
			event.keyCode=0; 
			event.returnValue=false;}
		if(ekc==78)NewDocument();//N
		if(ekc==79)OpenDocument();//O
		if(ekc==83)SaveDocument();//S
		if(ekc==76)callFormatting('JustifyLeft');//L
		if(ekc==69)callFormatting('JustifyCenter');//E
		if(ekc==82)callFormatting('JustifyRight');//R
		if(ekc==74)callFormatting('JustifyFull');//J
		if(ekc==84)callFormatting('StrikeThrough');//T
		if(ekc==189)callFormatting('SuperScript');//-
		if(ekc==187)callFormatting('SubScript');//=
		if(ekc==77)callColorDlg('ForeColor');//M
		if(ekc==72)callColorDlg('BackColor');//H
		if(ekc==71)InsertImage();//G
		if(ekc==75)CreateLink();//K
		if(ekc==49)callFormatting('InsertOrderedList');//1
		if(ekc==50)callFormatting('InsertUnorderedList');//2
		if(ekc==188)callFormatting('Outdent');//<
		if(ekc==190)callFormatting('Indent');//>
		if(ekc==219)keychangeFontSize(-1);//[
		if(ekc==221)keychangeFontSize(1);//]
	}
		if(ekc==114||ekc==117||ekc==121||ekc==122){
			event.keyCode=0; 
			event.returnValue=false;}
}
//====================================================================
function insertrowcells(typeinsert){
	if(clicknow!=null){
		if(clicknow.tagName=="TD"){
			var tr=clicknow.parentElement;
			var tbln=tr.parentElement;
			  tbln=tbln.parentElement;
			  var rowid=tr.rowIndex;
			  var cellid=clicknow.cellIndex;
			  if(typeinsert=="row"){
				var oTr=tbln.insertRow(rowid);
				for(i=0;i<tr.cells.length;i++){
					var oColl=oTr.insertCell();
					oColl.width=tr.cells(i).width;
					oColl.className=tr.cells(i).className;
				}
			  }else {
				var width=tr.cells(cellid).width;
				var otClass=tr.cells(cellid).className;
				for(i=0;i<tbln.rows.length;i++){
					var oTd=tbln.rows[i].insertCell(cellid);
					oTd.width=width;
					oTd.className=otClass;
				}
				t=0;
				for(j=0;j<tr.cells.length;j++){t=t+parseInt(tr.cells(j).width);}
				for(j=0;j<tr.cells.length;j++){
					width=parseInt(tr.cells(j).width);
					for(i=0;i<tbln.rows.length;i++){
						tbln.rows(i).cells(j).width=parseInt(width*100/t)+"%";
					}
				}
			  }
		}
	}
}
function delrowcells(typeinsert){
	if(clicknow!=null){
		if(clicknow.tagName=="TD"){
			var tr=clicknow.parentElement;
			var tbln=tr.parentElement;
			  tbln=tbln.parentElement;
			  var rowid=tr.rowIndex;
			  var cellid=clicknow.cellIndex;
			  if(typeinsert=="row"){
				tbln.deleteRow(rowid);
			  if(rowid<tbln.rows.length)clicknow=tbln.rows[rowid].cells(0);
			  else clicknow=null;
			  }else {
				for(j=0;j<tbln.rows.length;j++){
					tbln.rows[j].deleteCell(cellid);
				}	  
				if(cellid<tr.cells.length)clicknow=tbln.rows[rowid].cells(cellid);
				else if(cellid!=0){ 
					clicknow=tbln.rows[rowid].cells(tr.cells.length-1);
				}else clicknow=null;
				t=0;
				for(j=0;j<tr.cells.length;j++){t=t+parseInt(tr.cells(j).width);}
				for(j=0;j<tr.cells.length;j++){
					width=parseInt(tr.cells(j).width);
					for(i=0;i<tbln.rows.length;i++){
						tbln.rows(i).cells(j).width=parseInt(width*100/t)+"%";
					}
				}
			  }
		}
	}
}
//==Color==================================================================
var fontcolordocument=new Array();
var bgcolordocument= new Array();
var Addlist=new Array("Cut","Copy","Paste","Delete");
var Addundo=new Array("Undo");
var AddPImg=new Array("Image property...");
var AddPtable=new Array("Table property...");
var AddPcell=new Array("Table property...","Cell property...");
var bgde=new Array("Background  Default");
var tbdeall=new Array("Table Default");
var addcolor=new Array("000000","FFFFFF","008000","800000","808000","000080","800080","808080",
"FFFF00","00FF00","00FFFF","FF00FF","C0C0C0","FF0000","0000FF","008080");

function writeColBoxeskhal(Stypecolor,bangmau,colorDocument){
	var tds = 7;
	var htmlstr = "";
	thearray=bangmau;
	for (var i=0; i<thearray.length; ){
		htmlstr += "<tr>"
		for (var j=0; j<=tds && i<thearray.length; j++) {
			htmlstr += "<td class=\"tdtool\" width=1% style=\"border:1 solid #c0c0c0\">";
		  htmlstr+="<div STYLE=\"PADDING: 0px; MARGIN:2px ; OVERFLOW: hidden; WIDTH:13; HEIGHT: 13px; BACKGROUND-COLOR:#"+ thearray[i]+";BORDER:#a0a0a0 1px solid\" ";
		  htmlstr += "onmouseup=\"spcUp(this)\" onmousedown=\"spcMousedown(this)\" ondblclick=\" ChangeFontColor('"+ Stypecolor +"','" + thearray[i] + "')\" onclick=\"ChangeFontColor('"+ Stypecolor +"','" + thearray[i] + "')\" onmouseover=\"spcOver(this)\" onmouseout=\"spcOut(this)\" title=\"" + thearray[i] + "\">";
		  htmlstr+="</div>";
		  htmlstr += "</td>";
		  i++;
		}
		htmlstr += "</tr>";
	}
	return(htmlstr);
}
function writeRightClick(strDocument,strfunction){
	var tds = 1;
	var htmlstr = "";
	thearray=strDocument;
	for (var i=0; i<thearray.length;i++ ){
		htmlstr += "<tr>"
			htmlstr += "<td class=\"tdtool\" width=1%>";
		  htmlstr+="<div STYLE=\"Font-size:8pt;font-family:MS sans Serif;PADDING-left: 12px;PADDING-top:2px;cursor:default; MARGIN:0px ; OVERFLOW: hidden; WIDTH:120; HEIGHT: 18px;\" ";
		  htmlstr += "ondblclick=\"clickObj();"+ strfunction +"('" + thearray[i] + "'); \"onclick=\"clickObj();"+ strfunction +"('" + thearray[i] + "');\" onmouseover=\"spcROver(this)\" onmouseout=\"spcROut(this)\" title=\"" + thearray[i] + "\">";
		  htmlstr+=thearray[i]+"</div>";
		  htmlstr += "</td>";
		htmlstr += "</tr>";
	}
	return(htmlstr);
}

//mouseup
function clickObj(){
	idRclickimg.style.visibility="hidden";
	idRclickcell.style.visibility="hidden";
	idRclicktable.style.visibility="hidden";
}
function spcROver(el) {
  var el=el.parentElement;
  el.style.backgroundColor="#000088";
  el.style.color="#ffffff";
}
function spcROut(el) {
	el=el.parentElement;
  el.style.backgroundColor="#C0C0C0";
  el.style.color="#000000";
}
function spcMousedown(el){
	var el=el.parentElement;
  el.style.borderTop="1 gray solid";
  el.style.borderLeft="1 gray solid";
  el.style.borderRight="1 #ffffff solid";
  el.style.borderBottom="1 #ffffff solid";
}
// click handler
function spcClick(ch) {
  document.all['charVal'].value = ch;
  document.all['curSelection'].style.backgroundColor = "#" + ch;
}
// mouseover handler
function spcOver(el) {
  var el=el.parentElement;
  el.style.borderTop="1 #ffffff solid";
  el.style.borderLeft="1 #ffffff solid";
  el.style.borderRight="1 gray solid";
  el.style.borderBottom="1 gray solid";
}
// mouseout handler
function spcUp(el){
  var el=el.parentElement;
  el.style.borderTop="1 #ffffff solid";
  el.style.borderLeft="1 #ffffff solid";
  el.style.borderRight="1 gray solid";
  el.style.borderBottom="1 gray solid";
}
function spcOut(el) {
	el=el.parentElement;
  el.style.border="1px #c0c0c0 solid";
}
//=========================================================

var clickImg=null;
var clicktbl=null;
var clicktd=null;
var bdcltableold= new Array();
function disableclick(e){
if (event.button==1){
	if(!findDiv(event.srcElement)){
			colorpickback.style.visibility="hidden";
			colorpick.style.visibility="hidden";
			idRclickimg.style.visibility="hidden";
			idRclickcell.style.visibility="hidden";
			idRclicktable.style.visibility="hidden";}
return;}
	if (document.all && event.srcElement.tagName!="BODY" && findDiv(event.srcElement) ) {
		if (event.button==2||event.button==3){
			idRclickimg.style.visibility="hidden";
			idRclickcell.style.visibility="hidden";
			idRclicktable.style.visibility="hidden";
			clicktd=findTD(event.srcElement);
			if (event.srcElement.tagName=="IMG"){
				clickImg=event.srcElement;
				callFclick("Image");
				truefalse=false;
				return false;
			}else if (event.srcElement.tagName=="TABLE"){
				clicktbl=event.srcElement;
				clicktbortd=clicktbl;
				callFclick("Table");
				truefalse=false;
				return false;
			}else if (event.srcElement.tagName=="TD"){
				clicktd=event.srcElement;
				clicktbl=findtable(clicktd);
				clicktbortd=clicktbl;
				callFclick("Cell");
				truefalse=false;
				return false;
			}else if(clicktd!=null){
				clicktbl=findtable(clicktd);
				callFclick("Cell");
				truefalse=false;
				return false;
			}
		}
	}
}
var ex,ey;
function callFclick(strRclick){
	if(event.x>650)ex=event.x-122;
	else ex=event.x+2
	if(strRclick=="Image"){
		if(event.y>320)ey=event.y-140;
		else ey=event.y
		idRclickimg.style.top=ey;
		idRclickimg.style.left=ex;
		idRclickimg.style.visibility="visible";
	}else if(strRclick=="Table"){
		if(event.y>325)ey=event.y-180;
		else ey=event.y
		idRclicktable.style.top=ey;
		idRclicktable.style.left=ex;
		idRclicktable.style.visibility="visible";
	}else if(strRclick=="Cell"){
		if(event.y>320)ey=event.y-200;
		else ey=event.y
		idRclickcell.style.top=ey;
		idRclickcell.style.left=ex;
		idRclickcell.style.visibility="visible";
	}
}
function callRclick(strRclick){
	if(strRclick=="Image property..."){
		tblArr=window.showModalDialog('script_tool/PropertyImg.htm',window,'status:no;help:no; dialogHeight:320px; dialogWidth:450px; scroll:no;');
	}else if(strRclick=="Table property..."){
		tblArr=window.showModalDialog('script_tool/PropertyTable.htm',window,'status:no;help:no; dialogHeight:410px; dialogWidth:435px; scroll:no;');
	}else if(strRclick=="Cell property..."){
		tblArr=window.showModalDialog('script_tool/PropertyTD.htm',window,'status:no;help:no; dialogHeight:400px; dialogWidth:435px; scroll:no;');
	}
}
var truefalse=true;
function nocontextmenu(){
  if(event.srcElement.tagName=="BODY" || event.srcElement.tagName=="toolbar" || findDiv(event.srcElement)==null)truefalse=false;
  if(! truefalse) event.cancelBubble = true, event.returnValue = false;
  truefalse=true;
}
//===========Mouse down document=================
if (window.Event) document.captureEvents(Event.MOUSEUP);
if (document.layers)document.captureEvents(Event.MOUSEDOWN);
document.oncontextmenu = nocontextmenu;
//document.onmousedown = disableclick;
document.onmouseup = disableclick;
//============================================
	