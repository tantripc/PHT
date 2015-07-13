<%@ Page Language="C#" MasterPageFile="~/ViettoolEng/MasterPage.master" AutoEventWireup="true" CodeFile="ThemQuangCao.aspx.cs" Inherits="ViettoolEng_Default4" Title="Cap Nhat - Website" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   <table style="width: 814px; height: 686px">
        <tr>
            <td align="center">
                &nbsp;<table border="0" style="width: 595px">
                        <tr>
                            <td align="left" style="width: 109px">
                                STT</td>
                            <td align="left">
                                <asp:TextBox ID="txtSTT" runat="server" Width="60px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="left" style="width: 109px">
                                Tiêu đề</td>
                            <td align="left">
                                <asp:TextBox ID="txtTieude" runat="server" Width="500px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="left" style="width: 109px">
                                Link</td>
                            <td align="left">
                                <asp:TextBox ID="txtLink" runat="server" Width="500px"></asp:TextBox></td>
                        </tr>
                        </table>
            </td>
        </tr>
        <tr>
            <td style="height: 21px">
                &nbsp;Tóm tắt<FCKeditorV2:FCKeditor ID="FCKeditor2" runat="server" BasePath="~/ViettoolEng/fckeditor/">
                    </FCKeditorV2:FCKeditor>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;Nội dung chi tiết<FCKeditorV2:FCKeditor ID="FCKeditor3" runat="server" BasePath="~/ViettoolEng/fckeditor/" Height="310px">
                    </FCKeditorV2:FCKeditor>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Thêm tin tức" />
                <asp:TextBox ID="txtma" runat="server" Visible="False" Width="12px"></asp:TextBox></td>
        </tr>
    </table>

</asp:Content>

