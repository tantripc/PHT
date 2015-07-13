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

var fArrayFont = new Array(" ","Arial","Courier New","Palatino","Tahoma","Times New Roman","Verdana");
var fArrayFormats = new Array();

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
	instable.style.visibility="hidden";
	//datatree.style.visibility="hidden";
	_popkht.style.visibility="hidden";
    _popdvb.style.visibility="hidden";

	if (document.queryCommandValue("FontSize")!=null){
	fsize=document.queryCommandValue("FontSize");
	}else fsize=10;
	
	IDFontSizeList.value=fsize;
	IDFormatList.value=document.queryCommandValue("FormatBlock");
	IDFontNameList.value=document.queryCommandValue("FontName");
}
function changeFontSize(){
	var sSelected=IDFontSizeList.getAttribute("selectedIndex");
   	if (sSelected==0)sSelected=" "
   	document.execCommand("FontSize", false, sSelected);
}
function ChangeFont(){
	var sSelected=IDFontNameList.value;
	document.execCommand("FontName", false, sSelected);
}

function ChangeFormat(){
	var sSelected=IDFormatList.value;
	document.execCommand("FormatBlock", false, sSelected);
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
return true;
	for (i=0; i<da[oBjdiv].all.length; i++){
		if(da[oBjdiv].all(i).tagName =="TABLE"){
			da[oBjdiv].all(i).className="noidung";
			//da[oBjdiv].all(i).style="BORDER-COLLAPSE: collapse;";
			var tb=da[oBjdiv].all(i);
			for (j=0; j<tb.cells.length; j++){
				//tb.cells(j).InnerHTML=tb.cells(j).InnerText;
				//tb.cells(j).className="";
				//tb.cells(j).style="";
			}
		} 
	}



 	for (i=0; i<da[oBjdiv].all.length; i++){
    	if(da[oBjdiv].all(i).tagName =="TABLE"){
    		if(da[oBjdiv].all(i).border==0){
    			da[oBjdiv].all(i).className="tblnobdr";
    			var tb=da[oBjdiv].all(i);
    			for (j=0; j<tb.cells.length; j++){
					tb.cells(j).className="td"}
    		}else if(da[oBjdiv].all(i).border!=0){
    			da[oBjdiv].all(i).className="noidung";
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
	//if(rng!=null) rng.execCommand("Paste");
//document.execCommand("Paste");
rng.execCommand("Paste");
}
function insertTable(){
	var tblArr=null;
	tblArr=window.showModalDialog('/webtool/script_tool/tbl.html',window,'status:no;help:no; dialogHeight:300px; dialogWidth:400px; scroll:no;')
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
		  tbtemp.border="1";tbtemp.cellSpacing="0";tbtemp.cellPadding="2";
		  tbtemp.borderColorDark="";tbtemp.borderColorLight="";
		  tbtemp.style.borderCollapse="collapse";
		  tbtemp.bordercolor="#005aaa"
		  alert("fsdf sdf")
		  //defaultCell(tbtemp,"hei");
		  //defaultCell(tbtemp,"bg");
		}else if(typebt=="Background  Default"){
		  tbtemp.border="1";tbtemp.cellSpacing="0";tbtemp.cellPadding="2";
		  tbtemp.borderColorDark="";tbtemp.borderColorLight="";
		  tbtemp.style.borderCollapse="collapse";
		  //tbtemp.bordercolor="#111111"
			for(i=0;i<tbtemp.cells.length;i++){
				tbtemp.cells(i).bgColor="";
				//tbtemp.cells(i).borderColorDark=tbtemp.cells(i).bgColor;
				//tbtemp.cells(i).borderColorLight="";
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
//alert(event.keyCode)
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
					if(rowid==0){oColl.width=tr.cells(i).width;
					}else{tr.cells(i).width=""}
					if(tr.cells(i).className!="") oColl.className=tr.cells(i).className;
				}
			  }else {
				var width=tr.cells(cellid).width;
				var otClass=tr.cells(cellid).className;
				for(i=0;i<tbln.rows.length;i++){
					var oTd=tbln.rows[i].insertCell(cellid);
					if(i==0)oTd.width=width;
					if(otClass!="")oTd.className=otClass;
				}
				t=0;
				for(j=0;j<tr.cells.length;j++){t=t+parseInt(tr.cells(j).width);}
				for(j=0;j<tr.cells.length;j++){
					width=parseInt(tr.cells(j).width);
					i=0
					//for(i=0;i<tbln.rows.length;i++){
						tbln.rows(i).cells(j).width=parseInt(width*100/t)+"%";
					//}
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
var Addlisticon=new Array("Cut.gif","Copy.gif","Paste.gif","");
var Addundo=new Array("Undo");
var Addundoicon=new Array("Undo.gif");
var AddPImg=new Array("Image property...");
var AddPImgicon=new Array("");
var AddPtable=new Array("Table property...");
var AddPtableicon=new Array("");
var AddPcell=new Array("Table property...","Cell property...");
var AddPcellicon=new Array("","");
var bgde=new Array("Background  Default");
var bgdeicon=new Array("");
var tbdeall=new Array("Table Default");
var tbdeallicon=new Array("");

var addcolor=new Array("000000","FFFFFF","008000","800000","808000","000080","800080","808080","FFFF00","00FF00","00FFFF","FF00FF","C0C0C0","FF0000","0000FF","008080");
var addcolordung = new Array("005AAA","53ADFF","CCCCCC","CC6600","CE0000","003399","666666","FF9900","666666","E7017F","000080","EEEEF7","0061c1","DDEFFF","4682b4","F3F3DE");

function writeColBoxeskhal(Stypecolor,bangmau,colorDocument){
	var tds = 7;
	var htmlstr = "";
	thearray=bangmau;
	for (var i=0; i<thearray.length; ){
		htmlstr += "<tr>"
		for (var j=0; j<=tds && i<thearray.length; j++) {
			htmlstr += "<td class=\"tdtool\" width=1% style=\"border:1 solid #f6f6f6\">";
		  htmlstr+="<div STYLE=\"PADDING: 0px; MARGIN:2px ; OVERFLOW: hidden; WIDTH:13; HEIGHT: 13px; BACKGROUND-COLOR:#"+ thearray[i]+";BORDER:#a0a0a0 1px solid\" ";
		  htmlstr += "onmouseup=\"spcUp(this)\" onmousedown=\"spcMousedown(this)\" ondblclick=\" ChangeFontColor('"+ Stypecolor +"','" + thearray[i] + "')\" onclick=\"ChangeFontColor('"+ Stypecolor +"','" + thearray[i] + "')\" onmouseover=\"spcOver(this)\" onmouseout=\"spcOut(this)\" title=\"" + thearray[i] + "\">";
		  htmlstr+="</div>";
		  htmlstr += "</td>";
		  i++;
		}htmlstr += "</tr>";
	}return(htmlstr);
}
function writeRightClick(strDocument,strfunction,icon){
	var tds = 1;
	var htmlstr = "";
	thearray=strDocument;
	Aricon=icon;
	for (var i=0; i<thearray.length;i++ ){
		htmlstr += "<tr>"
		  htmlstr += "<td align=\"left\" class=\"tdtool\" width=180 height=20 STYLE=\"border-left:1 #f6f6f6 solid;border-right:1 #f6f6f6 solid;PADDING-top:1px;PADDING-bottom:1px;\">";
		  htmlstr +="<div style=\"WIDTH:20px; HEIGHT: 20px;float:left;\""
		  htmlstr += "ondblclick=\"clickObj();"+ strfunction +"('" + thearray[i] + "'); \"onclick=\"clickObj();"+ strfunction +"('" + thearray[i] + "');\" onmouseover=\"spcROver(this)\" onmouseout=\"spcROut(this)\" title=\"" + thearray[i] + "\">";
		  if (Aricon[i]!="") {htmlstr +="<IMG align=\"middle\" SRC=\"/VietTool/ImgToolbar/"+Aricon[i]+"\" height=20 width=19 border=0>"
		  } else htmlstr +="<IMG align=\"middle\" SRC=\"/VietTool/ImgToolbar/"+icon+"\" height=0 width=20>"
		  htmlstr +="</div>"
		  htmlstr +="<div STYLE=\"Font-size:8pt;font-family:MS sans Serif;PADDING-left: 4px;PADDING-top:4px;cursor:default; MARGIN:0px ; OVERFLOW: hidden; WIDTH:100; HEIGHT: 20px;\" ";
		  htmlstr += "ondblclick=\"clickObj();"+ strfunction +"('" + thearray[i] + "'); \"onclick=\"clickObj();"+ strfunction +"('" + thearray[i] + "');\" onmouseover=\"spcROver(this)\" onmouseout=\"spcROut(this)\" title=\"" + thearray[i] + "\">";
		  htmlstr +=thearray[i]//+"</div>";
		  htmlstr += "</td>";
		htmlstr += "</tr>";
	}return(htmlstr);
}

//mouseup  
function clickObj(){
	idRclickimg.style.visibility="hidden";
	idRclickcell.style.visibility="hidden";
	idRclicktable.style.visibility="hidden";
}
function spcROver(el) {
  //el.style.backgroundColor="#FFEEC2";
  var el=el.parentElement;
  el.style.paddingTop="0px";//PADDING-LEFT
  el.style.paddingBottom="0px";//PADDING-LEFT
  el.style.border="1 #131096 solid";
  el.style.backgroundColor="#FFEEC2";
  el.style.color="#000000";
}
function spcROut(el) {
  //el.style.backgroundColor="";
	el=el.parentElement;
  el.style.paddingTop="1px";//PADDING-LEFT
  el.style.paddingBottom="1px";//PADDING-LEFT
  el.style.borderTop="0 #F6F6F6 solid";
  el.style.borderBottom="0 #F6F6F6 solid";
  el.style.borderRight="1 #F6F6F6 solid";
  el.style.borderLeft="1 #F6F6F6 solid";
  el.style.backgroundColor="";
  el.style.color="#000000";
}

function spcMousedown(el){
	var el=el.parentElement;
  el.style.borderTop="1 #131096 solid";
  el.style.borderLeft="1 #131096 solid";
  el.style.borderRight="1 #131096 solid";
  el.style.borderBottom="1 #131096 solid";
  el.style.backgroundColor="#FBAE4C";
}
// click handler
function spcClick(ch) {
  document.all['charVal'].value = ch;
  document.all['curSelection'].style.backgroundColor = "#" + ch;
}
// mouseover handler
function spcOver(el) {
  var el=el.parentElement;
  el.style.border="1 #131096 solid";
  //el.style.borderLeft="1 #131096 solid";
  //el.style.borderRight="1 #131096 solid";
  //el.style.borderBottom="1 #131096 solid";
  el.style.backgroundColor="#FCD5A3";

}
// mouseout handler
function spcUp(el){
  var el=el.parentElement;
  el.style.borderTop="1 #131096 solid";
  el.style.borderLeft="1 #131096 solid";
  el.style.borderRight="1 #131096 solid";
  el.style.borderBottom="1 #131096 solid";
  el.style.backgroundColor="#FCD5A3";
}
function spcOut(el) {
	el=el.parentElement;
  el.style.border="1px #f6f6f6 solid";
  el.style.backgroundColor="";
}
//=========================================================

var clickImg=null;
var clicktbl=null;
var clicktd=null;
var bdcltableold= new Array();
function disableclick(e){
if (event.button==1){
	if(!findDiv(event.srcElement)){
		instable.style.visibility="hidden";
		//datatree.style.visibility="hidden";
		_popkht.style.visibility="hidden";
		_popdvb.style.visibility="hidden";
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
				callFclick("Table");
				clicktbortd=clicktbl;
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
	if(event.x>630)ex=ex=event.clientX+document.body.scrollLeft-162;
	else ex=ex=event.clientX+document.body.scrollLeft+2
	if(strRclick=="Image")
{
	if(event.y>320)ey=event.y-140;
	  else ey=event.y
ey=event.clientY+document.body.scrollTop-70;
//ex=event.clientX+document.body.scrollLeft


		idRclickimg.style.top=ey;
		idRclickimg.style.left=ex; 
		idRclickimg.style.visibility="visible";

	}else if(strRclick=="Table"){
		if(event.y>325)ey=event.y-180;
		else ey=event.y

ey=event.clientY+document.body.scrollTop-90;
ex=event.clientX+document.body.scrollLeft;

		idRclicktable.style.top=ey;
		idRclicktable.style.left=ex;
		idRclicktable.style.visibility="visible";
	}else if(strRclick=="Cell"){
		if(event.y>320)ey=event.y-150;
		else ey=event.y

ey=event.clientY+document.body.scrollTop;
ex=event.clientX+document.body.scrollLeft;

		idRclickcell.style.top=ey;
		idRclickcell.style.left=ex;
		idRclickcell.style.visibility="visible";
	}
}
function callRclick(strRclick){
	if(strRclick=="Image property..."){
		tblArr=window.showModalDialog('../VietTool/script_tool/PropertyImg.htm',window,'status:no;help:no; dialogHeight:320px; dialogWidth:450px; scroll:no;');
	}else if(strRclick=="Table property..."){
		tblArr=window.showModalDialog('../VietTool/script_tool/PropertyTable.htm',window,'status:no;help:no; dialogHeight:445px; dialogWidth:435px; scroll:no;');
	}else if(strRclick=="Cell property..."){
		tblArr=window.showModalDialog('../VietTool/script_tool/PropertyTD.htm',window,'status:no;help:no; dialogHeight:435px; dialogWidth:445px; scroll:no;');
	}
}
var truefalse=true;
function nocontextmenu(){
  if(event.srcElement.tagName=="BODY" || event.srcElement.tagName=="toolbar"|| findDiv(event.srcElement)==null){truefalse=false};
  if(! truefalse) event.cancelBubble = true, event.returnValue = false;
  truefalse=true;
}
//===========Mouse down document=================
if (window.Event) document.captureEvents(Event.MOUSEUP);
if (document.layers)document.captureEvents(Event.MOUSEDOWN);
document.oncontextmenu = nocontextmenu;
document.onmousedown = disableclick;
document.onmouseup = disableclick;
//============================================
var fontNameList = "<td class=\"tdtool\" width=1%>"
	fontNameList += "<select id=\"IDFontNameList\" style=\"FONT-WEIGHT: 300; FONT-SIZE: 10px; FONT-FAMILY: MS Sans Serif\" tabIndex=\"1\"  onchange=\"ChangeFont()\">"
        fontNameList += "<option Value=\" \">Default</option>"
        fontNameList += "<option Value=\"Arial\">Arial</option>"
        fontNameList += "<option Value=\"Courier New\">Courier New</option>"
        fontNameList += "<option Value=\"Palatino Linotype\">Palatino Linotype</option>"
        fontNameList += "<option Value=\"Tahoma\">Tahoma</option>"
        fontNameList += "<option Value=\"Times New Roman\">Times New Roman</option>"
        fontNameList += "<option selected Value=\"Verdana\" >Verdana</option>"
     fontNameList += "</select></td>"

var FormatList = "<td class=\"tdtool\" width=1%>"
    FormatList += "<select id=\"IDFormatList\" style=\"FONT-WEIGHT: 300; FONT-SIZE: 10px; FONT-FAMILY: MS Sans Serif\" tabIndex=1 onchange=\"ChangeFormat()\">"
        FormatList += "<option selected Value=\"Normal\">Normal</option>"
        FormatList += "<option Value=\"Formatted\">Formatted</option>"
        FormatList += "<option Value=\"Address\">Address</option>"
        FormatList += "<option Value=\"Heading 1\">Heading 1</option>"
        FormatList += "<option Value=\"Heading 2\">Heading 2</option>"
        FormatList += "<option Value=\"Heading 3\">Heading 3</option>"
        FormatList += "<option Value=\"Heading 4\">Heading 4</option>"
        FormatList += "<option Value=\"Heading 5\">Heading 5</option>"
        FormatList += "<option Value=\"Heading 6\">Heading 6</option>"
        FormatList += "<option Value=\"Numbered List\">Numbered List</option>"
        FormatList += "<option Value=\"Bulleted List\">Bulleted List</option>"
        FormatList += "<option Value=\"Directory List\">Directory List</option>"
        FormatList += "<option Value=\"Menu List\">Menu List</option>"
        FormatList += "<option Value=\"Definition Term\">Definition Term</option>"
        FormatList += "<option Value=\"Definition\">Definition</option>"
      FormatList += "</select></td>"
var FontSizeList= "<td class=\"tdtool\" width=1%>"
    FontSizeList += "<select ID=\"IDFontSizeList\" onselectstart=\"changeFontSize();\" style=\"FONT-WEIGHT: 300; FONT-SIZE: 10px; FONT-FAMILY: MS Sans Serif\" tabIndex=\"1\" onchange=\"changeFontSize()\">"
        FontSizeList += "<option value=\" \">default</option>"
        FontSizeList += "<option value=\"1\">1 (8pt)</option>"
        FontSizeList += "<option value=\"2\" selected >2 (10pt)</option>"
        FontSizeList += "<option value=\"3\">3 (12pt)</option>"
        FontSizeList += "<option value=\"4\">4 (14pt)</option>"
        FontSizeList += "<option value=\"5\">5 (18pt)</option>"
        FontSizeList += "<option value=\"6\">6 (24pt)</option>"
        FontSizeList += "<option value=\"7\">7 (36pt)</option>"
      FontSizeList += "</select></td>"

function writetoolbarbutton(strImg,strOnclick,StrTitle){
	var htmlstr=""
	htmlstr += "<td class=\"tdtool\" width=1% style=\"border:1 solid #c3daf9;padding-Top:0px;padding-Left:0px;padding-Bottom:1px;padding-Right:1px;\"";
	htmlstr += "onmouseup=\"spctoolbarUp(this)\" onmousedown=\"spctoolbarMousedown(this)\"  onmouseover=\"spctoolbarOver(this)\" onmouseout=\"spctoolbarOut(this)\" onclick=\""+strOnclick+"\">";
	htmlstr +="<img src=\"/VietTool/ImgToolbar/"+strImg+"\" align=\"absMiddle\" >";
	htmlstr += "</td>";
	return(htmlstr);
	
}
function writetoolbarseparator(){
	var htmlsepa=""
	htmlsepa += "<td class=\"tdtool\" width=1% style=\"border:0 solid #c0c0c0\">";
	htmlsepa +="<div style=\"BORDER-RIGHT: buttonhighlight 1px solid; MARGIN-LEFT: 2px; OVERFLOW: hidden; BORDER-LEFT: #698CCC 1px solid; WIDTH: 2px;HEIGHT:18px; MARGIN-RIGHT: 2px\">"
	htmlsepa += "</div></td>";
	return(htmlsepa);
}
function writetoolbarseparatortop(){
	var htmlsepa=""
	htmlsepa += "<td class=\"tdtool\">";
	htmlsepa +="<div style=\"BORDER-Left: #c3daf9 1px solid; MARGIN-LEFT: 2px; OVERFLOW: hidden; BORDER-Right: #c3daf9 1px solid; WIDTH: 3px;HEIGHT:20px; MARGIN-RIGHT: 0px\">"
	htmlsepa += "</div>";
	htmlsepa +="</td>";
	htmlsepa += "<td class=\"tdtool\">";
	htmlsepa +="<div style=\"BORDER-Left: #c3daf9 1px solid; MARGIN-LEFT: 0px; OVERFLOW: hidden; BORDER-Right: #c3daf9 1px solid; WIDTH: 3px;HEIGHT:20px; MARGIN-RIGHT: 2px\">"
	htmlsepa += "</div>";
	htmlsepa +="</td>";
	return(htmlsepa);
}
function ButtonOnSelectStart(){
	window.event.returnValue = false;
}
function ButtonOnDragStart(){
	window.event.returnValue = false;
}
var oldel=null;
function spctoolbarMousedown(el){
  oldel=el;
  el.style.borderTop="1 #131096 solid";
  el.style.borderLeft="1 #131096 solid";
  el.style.borderRight="1 #131096 solid";
  el.style.borderBottom="1 #131096 solid";
  el.style.paddingTop="1px";
  el.style.paddingLeft="1px";
  el.style.paddingBottom="0px";
  el.style.paddingRight="0px";
  el.style.backgroundColor="#FBAE4C";
}
function spctoolbarOver(el) {
  el.style.borderTop="1 #131096 solid";
  el.style.borderLeft="1 #131096 solid";
  el.style.borderRight="1 #131096 solid";
  el.style.borderBottom="1 #131096 solid";
  el.style.backgroundColor="#FCD5A3";
}
function spctoolbarUp(el){
  el.style.borderTop="1 #131096 solid";
  el.style.borderLeft="1 #131096 solid";
  el.style.borderRight="1 #131096 solid";
  el.style.borderBottom="1 #131096 solid";
  el.style.paddingTop="0px";
  el.style.paddingLeft="0px";
  el.style.paddingBottom="1px";
  el.style.paddingRight="1px";
  el.style.backgroundColor="#FCD5A3";
  //el.style.border="1px #c0c0c0 solid";
}
function spctoolbarOut(el){
  if(el!=null) {
  el.style.borderTop="1 #c3daf9 solid";
  el.style.borderLeft="1 #c3daf9 solid";
  el.style.borderRight="1 c3daf9 solid";
  el.style.borderBottom="1 c3daf9 solid";
  el.style.backgroundColor="";
  //el.style.border="1px #c0c0c0 solid";
  }
}
