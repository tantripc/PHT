<%@ Page Language="C#" MasterPageFile="~/Viettool/MasterPage.master" AutoEventWireup="true" CodeFile="Default2PanelNgang.aspx.cs" Inherits="Viettool_Default2" Title="Cap Nhat - Website" ValidateRequest="false" Trace="false" MaintainScrollPositionOnPostback="true" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 853px" align="center">
        <tr>
            <td rowspan="1" style="width: 91px; height: 25px">
            </td>
            <td rowspan="1" style="width: 1052px; height: 25px">
                <asp:RadioButton ID="RadioButton1" runat="server" GroupName="a" Text="Dạng bình thường" />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                <asp:RadioButton ID="RadioButton2" runat="server" GroupName="a" Text="Dạng hình ảnh" />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
                &nbsp; &nbsp;
                <asp:RadioButton ID="RadioButton3" runat="server" GroupName="a" Text="Dạng tin tức" />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                &nbsp;<asp:RadioButton ID="RadioButton4" runat="server" GroupName="a" Text="Dạng liên kết" /></td>
        </tr>
        <tr>
            <td style="width: 91px; height: 25px">
                STT</td>
            <td style="width: 1052px; height: 25px">
                <asp:TextBox ID="txtSTT" runat="server" Width="60px"></asp:TextBox></td>
        </tr>
        <tr>
            <td rowspan="1" style="width: 91px; height: 25px">
                Tiêu Đề
            </td>
            <td rowspan="1" style="width: 1052px; height: 25px">
                <asp:TextBox ID="txtTieude" runat="server" Width="496px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 91px; height: 25px">
                Link</td>
            <td style="width: 1052px; height: 25px;">
                <asp:TextBox ID="TextBox1" runat="server" Width="495px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 91px; height: 354px;">
                Nội Dung</td>
            <td style="width: 1052px; height: 354px;">
    
    <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" BasePath="~/Viettool/fckeditor/" Height="350px" Width="100%">
    </FCKeditorV2:FCKeditor>
            </td>
        </tr>
    </table>
    &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" Text="Update" OnClick="Button1_Click1"  /><br />

</asp:Content>

