//==Color==================================================================
var fontcolordocument=new Array();
var bgcolordocument= new Array();
var Addlist=new Array("Cut","Copy","Paste","Delete");
var Addundo=new Array("Undo");
var AddPImg=new Array("Image property...");
var AddPtable=new Array("Table property...");
var AddPcell=new Array("Table property...","Cell property...");
var addcolor=new Array("000000","FFFFFF","008000","800000","808000","000080","800080","808080","FFFF00","00FF00","00FFFF","FF00FF","C0C0C0","FF0000","0000FF","008080");
var addcolordung = new Array("005AAA","53ADFF","CCCCCC","CC6600","CE0000","003399","666666","FF9900","666666","E7017F","000080","EEEEF7","0061c1","DDEFFF","4682b4","F3F3DE");

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
function writeColBoxestable(arrcolor){
	var tds = 7;
	var htmlstr = "";
	thearray=arrcolor;
	for (var i=0; i<thearray.length; ){
		htmlstr += "<tr>"
		for (var j=0; j<=tds && i<thearray.length; j++) {
			htmlstr += "<td class=\"tdtool\" width=1% style=\"border:1 solid #f6f6f6\">";
		  htmlstr+="<div STYLE=\"PADDING: 0px; MARGIN:2px ; OVERFLOW: hidden; WIDTH:13; HEIGHT: 13px; BACKGROUND-COLOR:#"+ thearray[i]+";BORDER:#a0a0a0 1px solid\" ";
		  htmlstr += "onmouseup=\"spcUp(this)\" onmousedown=\"spcMousedown(this)\" ondblclick=\" ChangetableColor('" + thearray[i] + "')\" onclick=\"ChangetableColor('" + thearray[i] + "')\" onmouseover=\"spcOver(this)\" onmouseout=\"spcOut(this)\" title=\"" + thearray[i] + "\">";
		  htmlstr+="</div>";
		  htmlstr += "</td>";
		  i++;
		}
		htmlstr += "</tr>";
	}
	return(htmlstr);
}

//mouseup===============
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
