<%@ Page Language="C#" MasterPageFile="~/Viettool/MasterPage.master" AutoEventWireup="true" CodeFile="SuaTTin.aspx.cs" Inherits="Viettool_Default4" Title="Cap Nhat - Website" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 814px; height: 686px">
        <tr>
            <td align="center">
                &nbsp;<table border="0" style="width: 801px">
                        <tr>
                            <td align="left" style="width: 352px" rowspan="2">
                                Hình ảnh Minh Hoạ<FCKeditorV2:FCKeditor ID="FCKeditor4" runat="server" 
                                    BasePath="~/Viettool/fckeditor/">
                                </FCKeditorV2:FCKeditor>
                                                </td>
                            <td align="left" valign="bottom" style="width: 63px">
                                &nbsp;&nbsp;&nbsp;Tiêu đề:<br />
                                <br />
                                                </td>
                            <td align="left" valign="bottom" style="width: 324px">
                                <asp:TextBox ID="txtTieude" runat="server" Width="374px" Height="64px" 
                                    TextMode="MultiLine"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="left" valign="top" style="width: 63px">
                                &nbsp;&nbsp;&nbsp;Link:</td>
                            <td align="left" valign="top" style="width: 324px">
                                <asp:TextBox ID="txtLink" runat="server" Width="374px" style="margin-left: 0px"></asp:TextBox></td>
                        </tr>
                        </table>
            </td>
                                </tr>
        <tr>
            <td style="height: 21px">
                &nbsp;Tóm tắt<FCKeditorV2:FCKeditor ID="FCKeditor2" runat="server" BasePath="~/Viettool/fckeditor/"
                        Height="230px" Width="100%">
                </FCKeditorV2:FCKeditor>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;Nội dung chi tiết<FCKeditorV2:FCKeditor ID="FCKeditor3" runat="server" BasePath="~/Viettool/fckeditor/" Height="310px">
                </FCKeditorV2:FCKeditor>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Cập nhật" /></td>
        </tr>
    </table>
 
 
 

</asp:Content>

