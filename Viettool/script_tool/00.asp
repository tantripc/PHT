
<script>
<!--  
var Arrhh = new Array() 
var recn=0
//-->
</script>

<%
	Dim Directory,Dir
	Directory = Server.MapPath("/") & "\Images\capnhat\"
	Set Upload = Server.CreateObject("Persits.Upload.1")
	Set Dir = Upload.Directory( Directory & "*.*", Request("sortby"))
%>
<% For Each File in Dir %>
<% If Not File.IsSubdirectory Then %>
	<script>
	<!--
		Arrhh[recn]	= '<%=trim(File.FileName)%>';
		recn=recn+1;
	//-->
	</script>
<% End If
Next %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="/viettool/script_tool/POPUP.CSS">
<title>Chen anh</title>
<script FOR="VImg1" EVENT="onreadystatechange">
if (this.readyState == 'complete'){
	delayinsertImg();
}
</script>
<script FOR="VImg" EVENT="onreadystatechange">
if (this.readyState == 'complete'){
	loadimg.style.visibility="hidden";
	mo_khoa_all();
	var r, re;
	var s = VImg1.nameProp;
	re = /.jpg/i;
	r = s.search(re);
	if(postorinsert=='pos'){
	    post.disabled=false;
		if(r==-1){alert('Chu y: Tot nhat ban nen su dung anh JPG, \n anh khac JPG se khong thu nho anh lai duoc..');chkb.disabled=true;}
		else{chkb.disabled=false;}
   		if(VImg1.fileSize>200000)alert('Chu y: file anh lon tai se rat lau!..');
	}else{insert.disabled=false;chkb.disabled=true;}
		if(VImg1.fileSize != -1){
			if (VImg1.fileSize<513) sizek.innerHTML=VImg1.fileSize+'byte';	
			if (VImg1.fileSize>=513) sizek.innerHTML=Math.round(VImg1.fileSize/1024)+'KB';
			sizep.innerHTML=VImg1.width+'x'+VImg1.height;
			preview.innerHTML=cent+'%';
			pre.innerHTML=VImg.width+'x'+VImg.height;
			fname.innerHTML= (VImg1.nameProp).replace("%20"," ");
			if(postorinsert=='pos'){
				for (i=0;i<Arrhh.length;i++){
					if(Arrhh[i].toUpperCase()== (VImg1.nameProp).toUpperCase()){alert('Chu y: ten file anh nay da su dung roi,\n insert len file da co, hoac doi ten file roi chon lai ? '); return}
				}post.disabled=false;
			}
		}
		else{
			post.disabled=true;
			preview.innerHTML="";
			size.innerHTML="";
		}
}
</script>

<script type="text/javascript">
<!--
 var sData = dialogArguments
 var fImg1="";
 var sizewh=sData.sizewh;
var fImg="";
var rong;
var truoc=null;
function closewin(){
	if(event.keyCode==27)window.close();
}		
function clickimg(){
	if (truoc!=null){
		truoc.style.backgroundColor="#ffffff";
		truoc.style.color="#000000";
	}
	e = window.event.srcElement;
	truoc=e; 
	e.style.backgroundColor="#000080";
	e.style.color="#ffffff";
	fImg="/Images/capnhat/"+e.innerText;
	oDivtmp.innerHTML="";
	oDivtmp.focus();
	document.execCommand("InsertImage", false,fImg+' " border=1 id='+'"'+'VImg1');
    loadimg.style.visibility="visible";
    postorinsert="ins";
    khoa_all();
}
var postorinsert;
function insertImg(){
var tfl
	if (truoc!=null){
		truoc.style.backgroundColor="#ffffff";
		truoc.style.color="#000000";
	}
	fImg=fm.Img1.value;
	ftypereg=".jpg,.gif,.bmp"
	tfl=(fImg.substr(fImg.length-4,4))
	tfl=tfl.toLowerCase()
	if((ftypereg.indexOf(tfl)==-1)){
		alert("Chi su dung file dang GIF, bmp hoac JPG")
		fm.reset();
		return false;
	}
	if (fImg!=""){
		oDivtmp.innerHTML="";
		oDivtmp.focus();
		document.execCommand("InsertImage", false,fImg+' " border=1 id='+'"'+'VImg1');
		loadimg.style.visibility="visible";
		insert.disabled=true;
		postorinsert="pos";
		khoa_all();
	}
}
function delayinsertImg(){
	VImg1.style.marginRight="11px";
	VImg1.style.cursor="hand";
	if (VImg1.width > 210){
		var centw=(210/VImg1.width)*100;
		cent= Math.round(centw);
		var centh=(VImg1.height*cent/100);
		var strstyle='style ="width: '+210+'px';
		if(Math.round(centh) >170){
			cent=Math.round((170/VImg1.height)*100);
			var strstyle='style ="height: '+170+'px';
		}
	}else if (VImg1.height > 170){
		var centh=(170/VImg1.height)*100;
		cent= Math.round(centh);
		var centw=(VImg1.width*cent/100);
		var strstyle='style ="height: '+170+'px';
		if(Math.round(centh) >170){
			cent=Math.round((170/VImg1.widht)*100);
			var strstyle='style ="width: '+170+'px';
		}
	}else {cent=100; strstyle='';}
	oDiv.contentEditable=true;
	oDiv.innerHTML="";
	oDiv.focus();
	document.execCommand("InsertImage", false,fImg+' " border=1 id='+'"'+'VImg" '+strstyle);
	oDiv.contentEditable=false;
}

//-->
</script>

</head>
<body id="bdy" style=" MARGIN-TOP: 8px; OVERFLOW: hidden; COLOR: black; FONT-FAMILY: verdana; TEXT-ALIGN: center" onkeydown="closewin();">
<div style="border:1px outset #FFFFFF;height:100px;MARGIN-LEFT:4px;MARGIN-RIGHT:4px;PADDING-BOTTOM:6px; padding-left:2px; padding-right:2px; padding-top:2px" align="left">
<fieldset class="fieldset" style="MARGIN:6px;">
<legend>Upload File</legend>
<form action="ImgNewsPost.asp" ENCTYPE="multipart/form-data" method="post" id="fm" target="_ImgNewspost" style="HEIGHT: 1px;MARGIN: 0px;">
	<font size="2" face="Arial">&nbsp;&nbsp;Directory:</font>&nbsp;&nbsp;
	<input TYPE="file" SIZE="42" NAME="FILE1" id="Img1" onchange="return insertImg();" style="height:20px"><input type="submit" value="&nbsp; Đăng ký &nbsp;" id="dangky" ><br>
	<input type="hidden" id="idScale" name="Scale" value="100">
	<input type="hidden" id="smallimg" name="smallimg" value="false">
</form>
	<table border="0" width="500" style="MARGIN:1px;">
	  <tr>
	    <td width="200">
			<div style="height:180px;WIDTH:220px;border:1px inset;BACKGROUND-COLOR: #ffffff; PADDING-LEFT: 4px;OVERFLOW: auto;	OVERFLOW-Y:scroll; OVERFLOW-X:scroll">
				<%dim intObj
				intObj=0 
				For Each File in Dir
					If Not File.IsSubdirectory Then 
					intObj=intObj+1
					%>
							<span><img src="/viettool/Images/imgic.gif" border="0" WIDTH="13" HEIGHT="16">
							<span onclick="clickimg()"><%=trim(File.FileName)%></span></span><br>
					<%End If
				Next%>
			</div>
	    </td>
	    <td width="200">
			<table STYLE="WIDTH: 220px; HEIGHT: 180px; border:1px inset; BACKGROUND-COLOR: #c6c6c6" align="center" valign="middle">
			  <tr>
			    <td width="100%" align="center" valign="middle">
					<div ID="oDiv" contentEditable="false" STYLE="WIDTH: 1px; HEIGHT: 1px; BACKGROUND-COLOR: #c6c6c6"> 
					</div>
			    </td>
			  </tr>
			</table>
	    </td>
	    <td width="100" valign="top">
			<input type="button" disabled onclick="returnValue=true;go();" value="Post and Insert" id="post" name="button1" style="HEIGHT: 23px; width:110px;" height="22">
			<input type="button" disabled onclick="goinsert();" value="Insert" id="insert" name="button1" style="HEIGHT: 23px; width:110px;MARGIN-TOP: 4px;" height="22">
			<input type="button" onclick="returnValue=null;window.close();" value="Cancel" id="cancel" name="button3" style="HEIGHT: 23px; width:110px;MARGIN-TOP: 4px;" height="22"> 
			<input type="checkbox" id="chkb" name="checkbox" onclick="fm.smallimg.value=chkb.checked" value="ON" checked>Small Image<br>
			<input type="radio" value="aauto" id="autoid" name="R1"> Zoom<br>
  			<input type="radio" value="rafull" id="fullid" name="R1" checked>Full 

	    </td>
	  </tr>
	</table>
</fieldset>
</div>
<center>
<table border="1" width="100%" cellspacing="1" cellpadding="0" style="MARGIN-TOP: 0px;">
  <tr>
    <td width="2%" height="20" nowrap style="border:1px inset;MARGIN: 0px;FONT-SIZE:12px;FONT-FAMILY:Arial" id="inObj">&nbsp;<%=intObj%> file(s) fuond</td>
    <td width="2%" nowrap style="border:1px inset;MARGIN: 4px;FONT-SIZE:12px;FONT-FAMILY:Arial" id="fname">&nbsp;</td>
    <td width="2%" nowrap style="border:1px inset;MARGIN: 4px;FONT-SIZE:12px;FONT-FAMILY:Arial" id="sizek">&nbsp;</td>
    <td width="2%" nowrap style="border:1px inset;MARGIN: 4px;FONT-SIZE:12px;FONT-FAMILY:Arial" id="sizep">&nbsp;</td>
    <td width="2%" nowrap style="border:1px inset;MARGIN: 4px;FONT-SIZE:12px;FONT-FAMILY:Arial" id="preview">&nbsp;</td>
    <td width="20%" nowrap style="border:1px inset;MARGIN: 4px;FONT-SIZE:12px;FONT-FAMILY:Arial" id="pre">&nbsp;</td>
  </tr>
</table>
</center>	
<iframe id="ifr_save" name="_ImgNewspost" style="LEFT: -10px; VISIBILITY: visible; POSITION: absolute; Height:1px; width:1px;top:-10">
</iframe>
<script FOR="ifr_save" EVENT="onreadystatechange">
if (this.readyState == 'complete'){
	//if(window.status=="Success!" || window.status=="Error!"){
		//var inn_txt_ifr_save=document.frames("ifr_save").document.all.succ.innerText;
		//if(inn_txt_ifr_save!="Success!"){
			postimg.style.visibility="hidden";
			//alert("Chu y: Co mot loi xuat hien trong khi luu file anh nay!... \n \n ");
			post.disabled=false;
gogo();
		//}			
    }	
mo_khoa_all();

</script>

<script LANGUAGE="javascript">
<!--
function go(){
	var pourcent=Math.round((120/VImg1.width)*100);
	if(VImg1.width>120){fm.idScale.value=pourcent;}
	else {fm.idScale.value=100;}
	postimg.style.visibility="visible";
	fm.submit();
	khoa_all();
}
function goinsert(){
	textRange = document.body.createTextRange();
	if (fullid.checked){
		textRange.moveToElementText(oDivtmp);
	}else{
		textRange.moveToElementText(oDiv);
	}
	VImg.style.marginRight="8px";
	VImg.style.marginLeft="8px";
	VImg.style.marginTop="4px";
	VImg.style.marginBottom="4px";
	textRange.execCommand("Copy");
	returnValue=true;
	window.close();
}
function mo_khoa_all(){
	fm.Img1.disabled=false;
 	for (i=0; i<document.all.length; i++){
    	document.all(i).style.cursor="default";}
}
function khoa_all(){
	post.disabled=true;
	insert.disabled=true;
	fm.Img1.disabled=true;
 	for (i=0; i<document.all.length; i++){
    	document.all(i).style.cursor="wait";}
}
var tableIm1='<table style="MARGIN-TOP:0px;MARGIN-BOTTOM:0px;MARGIN-RIGHT:0px;MARGIN-LEFT:0px" border=0 width=10 align=left><tr><td><IMG align="left" SRC="';
var tableIm3='" style="BORDER: 1px solid #003366;MARGIN:8px "></td></tr><tr><td align=center style="font-family: Arial; font-size: 8pt; color: #800080; font-style: italic;PADDING-LEFT:5px;PADDING-RIGHT:5px;PADDING-BOTTOM:1px">';
var tableIm31='</td></tr></table>'
var SrcImgLarg="/Images/capnhat/";
var SrcImgsmall="/Images/capnhat/small";

function gogo(){
	if (fm.Img1.value==''){return;}
	if(chkb.checked){
		//sData.oDivttt.innerHTML='<img SRC="'+SrcImgsmall+VImg1.nameProp+'"'+' style="BORDER: 0px solid #000000;MARGIN-RIGHT:6px;MARGIN-LEFT:6px;MARGIN-Top:3px;MARGIN-Bottom:3px">'+sData.oDivttt.innerHTML;
	sData.oDivDT.innerHTML='<img SRC="'+SrcImgsmall+VImg1.nameProp+'"'+' style="BORDER: 0px solid #000000;MARGIN-RIGHT:6px;MARGIN-LEFT:6px;MARGIN-Top:3px;MARGIN-Bottom:3px">'+sData.oDivDT.innerHTML;

	}
	textRange = document.body.createTextRange();
	if (fullid.checked){
		imglarg.innerHTML='<img SRC="'+SrcImgLarg+VImg1.nameProp+'"'+'style="BORDER: 1px solid #c0c0c0;">';
	}else{
		imglarg.innerHTML='<img  SRC="'+SrcImgLarg+VImg1.nameProp+'"'+'width="'+VImg.width+'" style="BORDER: 1px solid #c0c0c0;">';
	}
	textRange.moveToElementText(imglarg);
	textRange.execCommand("Copy");
	returnValue=true;
	window.close();
}
//-->
</script>
<div style="LEFT: -2000px;top:-2000px; VISIBILITY: visible; POSITION: absolute">
	<div ID="oDivtmp" contentEditable="true" STYLE="WIDTH: 0px; HEIGHT: 0px; BACKGROUND-COLOR: white"> 
	</div>
</div>
<div style="LEFT: -2000px;top:-2000px; VISIBILITY: visible; POSITION: absolute">
	<div ID="imglarg" contentEditable="true" STYLE="WIDTH: 0px; HEIGHT: 0px; BACKGROUND-COLOR: white"> 
	</div>
</div>
<div id="loadimg" style="LEFT: 200px;top:90px; POSITION: absolute;VISIBILITY: hidden; border:2px outset;">
	<table border="0" width="190" height="50" cellspacing="0" cellpadding="0" bgcolor="#C6C6C6">
	  <tr><td width="100%" align="center"><font size="2" face="Arial" color="#006600"><b>Loading Images...</b></font></td></tr>
	</table>
</div>
<div id="postimg" style="LEFT: 200px;top:90px; POSITION: absolute;VISIBILITY: hidden; border:2px outset;">
	<table border="0" width="190" height="50" cellspacing="0" cellpadding="0" bgcolor="#C6C6C6">
	  <tr><td width="100%" align="center"><font size="2" face="Arial" color="#006600"><b>Posting Images...</b></font></td></tr>
	</table>
</div>

</body>
</html>