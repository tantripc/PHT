<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<script language="JavaScript" type="text/javascript" src="/VietTool/script_tool/toolie.js"></script>

<script LANGUAGE="javascript">
var savenua="yes";
function SaveDocument(){
		var td=txttieude.value;
		var tt=oDivttt.innerText;
		var re = / /g;
		td=td.replace(re,'');
		tt=tt.replace(re,'');
		if (td.length ==0){alert("Ban chua nhap ten tieu de van ban !");txttieude.focus();return;}
		if (tt.length ==0){alert("Ban chua nhap noi dung tom tat!");oDivttt.focus();return;}
	if (savenua=="yes"){
		savenua="no";
		window.status='Dang thuc hien luu du lieu. \n Xin hay cho trong giay lat...';
		fm.hitieude.value=txttieude.value;
		//fm.hichannelID.value=channelID.value;
		fm.hitomtat.value=oDivttt.innerHTML;
		fm.hinoidung.value=oDivndg.innerHTML;
		//document.title=".: BDCM - "+fm.hitieude.value+":."
		fm.submit();
		//khoa_all();
 		txttieude.focus();
 		return;
 	}else {alert("Ban chua luu nua duoc, hay cho viec luu truoc do hoan thanh!..OK.");return;}
  }
var hople="dungroi"
function InsertImage(){
	answer=window.showModalDialog('/quocdang/ImgNews.asp',window,'status:no;help:no; dialogHeight:314px; dialogWidth:610px; scroll:no;')
	if(answer){document.execCommand("Paste");}
	return;
}

</script>

<%
if request("newsID")<>"" then
mSQLupn = "SELECT * FROM  TINTUC01 WHERE news_ID ="&request("newsID")
set Rsupn = Server.CreateObject("ADODB.Recordset")
Rsupn.Open mSQLupn,conn,3
end if
	%>
	<body>
	<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber2" bgcolor="#9DBEF4" height="25" class="FONT_12">
  <tr>
    <td width="100%">IJJJ</td>
  </tr>
</table>
<!--#include VIRTUAL="QuocDang/script_tool/menuToolbarie5.htm"-->
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber3" bgcolor="#9DBEF4" height="25" class="FONT_12">
  <tr>
    <td width="100%">
    <div align="center">
  <center>
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="605" id="AutoNumber1" class="FONT_12" bgcolor="#9CBEF7" height="25">
  <tr>
    <td width="10%">&nbsp;&nbsp; Tiêu đề:</td>
    <td width="90%">
    <input type="text" name="txttieude" size="80" maxlength="120" style="font-family: Verdana; font-size: 8pt" value="<%if request("newsID")<>"" then Response.Write trim(rsupn("tieude"))%>"></td>
  </tr>
</table>
  </center>
</div>

    </td>
  </tr>
  <tr>
    <td width="100%"><div id="_parentConts" contentEditable="false" STYLE="PADDING-BOTTOM: 5px;PADDING-LEFT:10px; PADDING-TOP: 1px; MARGIN-left: 8px;MARGIN-top: 1px;MARGIN-BOTTOM: 6px; OVERFLOW: auto; 
					OVERFLOW-Y:scroll; OVERFLOW-X:scroll; WIDTH:605px; HEIGHT: 294px; BACKGROUND-COLOR: #9DBEF4; BORDER-STYLE: solid;BORDER-WIDTH=0px;"> 
					<font color="#CC3300" face="Verdana" size="1">Tóm Tắt / Nội 
                    fffdung chi tiết:</font><font color="#CC3300"> </font>
					<div class="FONT_12" title="Nhap Noi Dung Tom Tat " class1="subbody" ID="oDivttt" onkeyup="setfontsize();diferent='yes';" contentEditable="true" STYLE="PADDING: 20px; PADDING-LEFT: 67px;PADDING-RIGHT:67px;margin-top:2px;margin-bottom:2px; OVERFLOW: auto; 
						OVERFLOW-Y:visible; OVERFLOW-X:hidden; WIDTH:565; HEIGHT: 100px; BACKGROUND-COLOR: white; BORDER-RIGHT:#375FC8 1px solid; BORDER-top:#375FC8 1px solid; BORDER-BOTTOM:#375FC8 1px solid; BORDER-LEFT:#375FC8 1px solid "> 
					<%if request("newsID")<>"" then Response.Write trim(rsupn("tomtat"))end if%>
					</div>
					<div class="FONT_12" title="Nhap Noi Dung Chi Tiet " class1="subbody" ID="oDivndg" onkeyup="setfontsize();diferent='yes'" contentEditable="true" STYLE="PADDING: 20px; PADDING-LEFT: 67px;PADDING-RIGHT:67px;margin-top:2px;margin-bottom:2px; OVERFLOW: auto;
						OVERFLOW-Y:visible; OVERFLOW-X:hidden; WIDTH:565; HEIGHT: 265px; BACKGROUND-COLOR: white; BORDER-RIGHT:#375FC8 1px solid; BORDER-top:#375FC8 1px solid; BORDER-BOTTOM:#375FC8 1px solid; BORDER-LEFT:#375FC8 1px solid "> 
					<%if request("newsID")<>"" then Response.Write trim(rsupn("noidung"))end if%>
					</div>
					PPP
			     </div></td>
  </tr>
</table>
<p>&nbsp;</p>
<%if request("channelID")<>"" and request("opt")="ed" then%>
<script language="javascript">
function mo_khoa_all(){
   	txttieude.style.cursor="text";
   	oDivndg.style.cursor="text";
   	oDivttt.style.cursor="text";
	//oToolBar1.disabled=false;
	//oToolBar2.disabled=false;
	savedata.style.visibility="hidden";
}
function khoa_all(){
   	txttieude.style.cursor="wait";
   	oDivndg.style.cursor="wait";
   	oDivttt.style.cursor="wait";
    //oToolBar1.disabled=true;
   //oToolBar2.disabled=true;
    savedata.style.visibility="visible";
}
    </script>



<script FOR="oDivndg" EVENT="onclick">
	setfontsize();
	setoldImg();
	rng = document.selection.createRange();
	instable.style.visibility="hidden";
    </script>
<script FOR="oDivttt" EVENT="onclick">
	setfontsize();
	setoldImg();
	rng = document.selection.createRange();
	instable.style.visibility="hidden";
	//datatree.style.visibility="hidden";
    </script>
<script FOR="oDivndg" EVENT="onpaste">setTimeout('timtableborder0("oDivndg")',100)</script>
<script FOR="oDivttt" EVENT="onpaste">setTimeout('timtableborder0("oDivttt")',100)</script>

<script FOR="ifr_save" EVENT="onreadystatechange">
if (this.readyState == 'complete'){
		 if(window.status=="Success!" || window.status=="Error!"){
		    if(document.frames("ifr_save").document.readyState=="complete"){
				var inn_txt_ifr_save=document.frames("ifr_save").document.all.succ.innerText;
				var reclayduoc = document.frames("ifr_save").document.all.rec_no.innerText;
				if(inn_txt_ifr_save!="Success!"){
					window.status="Co mot loi xuat hien, Luu noi dung khong thanh cong...";
					alert("Chu y: Co mot loi xuat hien khi luu ban tin nay!... \n \n "+inn_txt_ifr_save);
					fm.hiID.value="";}
				else {
					if(reclayduoc!="nothanh"){ 
					fm.hiID.value=reclayduoc;
					lasave="Sửa văn bản - "+fm.hitieude.value;
			        window.status="Luu noi dung thanh cong...";
			        setTimeout("window.status='Sửa văn bản...'", 1000);}}
			        savenua="yes";
			        diferent="no";
			   if(newdoc=="yes"){newdoc="no"; Newnohoi();}
		    }
	     }else{window.status="Error! Disconect server...";
			alert("Khong tim thay Server123! kiem tra Modem hay day mang, thu save lai lan nua...")
			savenua="yes";
    } mo_khoa_all();  
}
    </script>

<form id="fm" action="NewsSav001.asp" method="post" target="tintuc_save">
	<input type="hidden" id="hiID" name="newsID" value="<%=request("newsID")%>">
	<input name="channelID" id ="idchannelID" type="hidden" value="<%=request("channelID")%>">
	<input type="hidden" id="hitieude" name="tieude">
	<input type="hidden" id="hitomtat" name="tomtat">
	<input type="hidden" id="hinoidung" name="noidung">
</form>
<%end if%>


</body>