<%@ Page Language="C#" MasterPageFile="~/ViettoolEng/MasterPage.master" AutoEventWireup="true" CodeFile="Upload.aspx.cs" Inherits="ViettoolEng_Default4" Title="Cap Nhat - Website" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <table cellpadding="0" cellspacing="0" style="width: 498px">
        <tr>
            <td>
                File upload</td>
            <td style="text-align: left">
                <asp:FileUpload ID="fu1" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td style="text-align: left">
                <asp:Label ID="lblMessage" runat="server" ForeColor="#CC3300" Visible="False"></asp:Label>
                <br />
                <br />
                <asp:Button ID="btnUpload" runat="server" Text="Upload" 
                    onclick="btnUpload_Click" />
            </td>
        </tr>
    </table>
</center>
</asp:Content>

