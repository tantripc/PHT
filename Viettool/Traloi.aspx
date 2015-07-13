<%@ Page Language="C#" MasterPageFile="~/Viettool/MasterPage.master" AutoEventWireup="true" CodeFile="Traloi.aspx.cs" Inherits="Viettool_Default4" Title="Cap Nhat - Website" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Black" Text="Tiêu đề"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server" Width="760px"></asp:TextBox><br />
    <asp:Panel ID="Panel1" runat="server" GroupingText="Tóm tắt / Nội dung trả lời" 
        Width="823px">
        <fckeditorv2:fckeditor id="FCKeditor1" runat="server" EnableViewState="true" basepath="~/Viettool/fckeditor/"
            height="150px"></fckeditorv2:fckeditor>
        <fckeditorv2:fckeditor id="FCKeditor2" runat="server" basepath="~/Viettool/fckeditor/"
            height="300px"></fckeditorv2:fckeditor>
        <asp:Label ID="lblError" runat="server" ForeColor="Red" Visible="false" Text='<img src="images/mt01.gif" />  Nội dung trả lời không được bỏ trống!'></asp:Label>&nbsp;<br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Trả lời" />
    </asp:Panel>
</asp:Content>

