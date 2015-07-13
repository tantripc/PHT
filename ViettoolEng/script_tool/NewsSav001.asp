<!--#include VIRTUAL="Conndata/dataconn.asp"-->
<!--#include VIRTUAL="VietTool/config.asp"-->
<%
On Error Resume Next
	Dim mSQL,recve
	Dim logo,tenhv,ndg,ndg_en,ID
	if trim(request("bonac"))<>"khongac" then
	end if
	newsID=trim(request("newsID"))
	channelID=trim(request("channelID"))
	tieude=replace(trim(request("tieude")),"'","&#39;")
	tomtat=replace(trim(request("tomtat")),"'","&#39;")
	noidung=replace(trim(request("noidung")),"'","&#39;")
	noidung=replace(noidung,"<O:P>","")
	noidung=replace(noidung,"</O:P>","")
	noidung=replace(noidung,chr(10)&chr(13),"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
	userid=session.Contents("ten")
	if newsID="" then
			mSQL="INSERT INTO TINTUC01(Channel_ID,tieude,tomtat,noidung,userid)"
			mSQL = mSQL & "Values('" & ChannelID & "','" & tieude & "','" & tomtat & "','"&noidung&"','"&userid&"')"
			Conn.Execute (mSQL)
			mSQL="SELECT top 1 news_ID FROM TINTUC01 order by news_ID desc" 
			set Rsrecno = Server.CreateObject("ADODB.Recordset")
			Rsrecno.Open mSQL,conn,3
			recve = Rsrecno("news_ID")
			Conn.Execute (mSQL)
	else
	
			mSQL="UPDATE TINTUC01 SET Channel_ID='"& ChannelID & "',tieude= '" & tieude & "',tomtat= '" & tomtat &"',noidung= '" & noidung &"', userid= '" & userid &"' WHERE news_id ='"& newsID &"'"
			recve=newsID
			'Response.Write mSQL
			Conn.Execute (mSQL)
	end if	
			
	'----------------------------------	
	If Err <> 0 Then 
	   kqsave="Error!"
	   Response.Write "<p id='rec_no'>nothanh</p>"
	   Response.Write "<p id=succ>An error occurred: " & Err.Description&"</p>"
	Else 
	   kqsave="Success!"
  	   Response.Write "<p id='rec_no'>"& recve & "</p>"
	   Response.Write "<p id=succ>Success!</p>" 
	End If 
		set Rsrecno = nothing
		set RsDel =nothing
		conn.Close

%>
<SCRIPT LANGUAGE=javascript>
    window.status='<%=kqsave%>';
	//window.close();
</SCRIPT>