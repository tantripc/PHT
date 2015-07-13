<%@ Page Language="C#" MasterPageFile="~/ViettoolEng/MasterPage.master" AutoEventWireup="true" CodeFile="AddMenu2PanelNgang.aspx.cs" Inherits="ViettoolEng_Default4" Title="Cap Nhat - Website" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <table style="width: 815px">
        <tr>
            <td style="height: 21px">
            </td>
            <td style="width: 722px; height: 21px">
                <asp:RadioButton  ID="RadioButton1" runat="server" Checked="True" Text="Dạng bình thường" GroupName="a" />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<asp:RadioButton
                    ID="RadioButton2" runat="server" Text="Dạng hình ảnh" GroupName="a" />
                &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
                &nbsp;<asp:RadioButton ID="RadioButton3" runat="server" Text="Dạng tin tức" GroupName="a" />
                &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<asp:RadioButton
                    ID="RadioButton4" runat="server" Text="Dạng liên kết" GroupName="a" /></td>
        </tr>
        <tr>
            <td style="height: 21px; width: 121px;">
                STT</td>
            <td style="width: 722px; height: 21px">
                <asp:TextBox ID="txtSTT" runat="server" Width="60px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="height: 21px; width: 121px;">
                Tiêu đề</td>
            <td style="width: 722px; height: 21px">
                <asp:TextBox ID="TextBox1" runat="server" Width="490px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 121px">
                Link</td>
            <td style="width: 722px">
                <asp:TextBox ID="TextBox2" runat="server" Width="489px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 121px">
                Tóm tắt</td>
            <td style="width: 722px">
                <fckeditorv2:fckeditor id="FCKeditor1" runat="server" basepath="~/ViettoolEng/fckeditor/"></fckeditorv2:fckeditor>
            </td>
        </tr>
        <tr>
            <td style="width: 121px">
                Nội dung</td>
            <td style="width: 722px">
                <fckeditorv2:fckeditor id="FCKeditor2" runat="server" basepath="~/ViettoolEng/fckeditor/"
                    height="300px"></fckeditorv2:fckeditor>
            </td>
        </tr>
        <tr>
            <td style="width: 121px">
            </td>
            <td style="width: 722px">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Thêm Menu" />
                <asp:TextBox ID="TextBox3" runat="server" Visible="False" Width="4px"></asp:TextBox>
                <asp:TextBox ID="TextBox4" runat="server" Visible="False" Width="4px"></asp:TextBox>
                <asp:TextBox ID="TextBox5" runat="server" Visible="False" Width="4px"></asp:TextBox>
                <asp:TextBox ID="TextBox6" runat="server" Visible="False" Width="4px"></asp:TextBox>
                <asp:TextBox ID="TextBox7" runat="server" Visible="False" Width="4px"></asp:TextBox>
                <asp:TextBox ID="TextBox8" runat="server" Visible="False" Width="4px"></asp:TextBox>
                <asp:TextBox ID="TextBox9" runat="server" Visible="False" Width="4px"></asp:TextBox>
                <asp:TextBox ID="TextBox10" runat="server" Visible="False" Width="4px"></asp:TextBox>
                <asp:TextBox ID="TextBox11" runat="server" Visible="False" Width="1px"></asp:TextBox>
                <asp:TextBox ID="TextBox12" runat="server" Visible="False" Width="1px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 121px">
            </td>
            <td style="width: 722px">
            </td>
        </tr>
    </table>
</asp:Content>