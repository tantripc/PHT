<%@ Page Language="C#" MasterPageFile="~/Viettool/MasterPage.master" AutoEventWireup="true" CodeFile="ThemTT.aspx.cs" Inherits="Viettool_Default4" Title="Cap Nhat - Website" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 814px; height: 686px">
        <tr>
            <td align="center">
                &nbsp;<table border="0" style="width: 801px">
                        <%--<tr>
                            <td align="left" valign="top" style="width: 123px">
                                &nbsp;&nbsp;<asp:CheckBox ID="cboNew" runat="server" Text="Tin mới" /></td>
                            <td align="left" valign="top" style="width: 324px">
                                </td>
                        </tr>--%>
                        <tr>
                            <%--<td align="left" style="width: 352px" rowspan="2">
                                Hình ảnh Minh Hoạ<FCKeditorV2:FCKeditor ID="FCKeditor4" runat="server" 
                                    BasePath="~/Viettool/fckeditor/">
                                </FCKeditorV2:FCKeditor>
                                                </td>--%>
                            <td align="left" valign="top" valign="bottom" style="width: 123px">
                                &nbsp;&nbsp;&nbsp;Tiêu đề:<br />
                                <br />
                                                </td>
                            <td align="left" valign="bottom" style="width: 324px">
                                <asp:TextBox ID="txtTieude" runat="server" Width="374px" Height="64px" 
                                    TextMode="MultiLine"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="left" valign="top" style="width: 123px">
                                &nbsp;&nbsp;&nbsp;Link:</td>
                            <td align="left" valign="top" style="width: 324px">
                                <asp:TextBox ID="txtLink" runat="server" Width="374px" style="margin-left: 0px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="left" valign="top" style="width: 123px">
                                &nbsp;&nbsp;&nbsp;Hình ảnh minh hoạ:</td>
                            <td align="left" valign="top" style="width: 324px">
                                <asp:FileUpload ID="fuImage" runat="server" /></td>
                        </tr>
                        <tr>
                            <td align="left" valign="top" style="width: 123px">
                                &nbsp;&nbsp;&nbsp;Ngày đăng tin:</td>
                            <td align="left" valign="top" style="width: 324px">
                                <asp:TextBox ID="txtNgay" autocomplete="off" runat="server"></asp:TextBox>
                                <cc1:CalendarExtender ID="calendarExtNgaySinh" runat="server"
                                    TargetControlID="txtNgay" Format="dd/MM/yyyy">
                                </cc1:CalendarExtender>
                            </td>
                        </tr>
                        </table>
            </td>
        </tr>
        <tr>
            <td style="height: 21px">
                &nbsp;Tóm tắt
                <asp:TextBox ID="txtTomTat" Width="810px" TextMode="MultiLine" Height="200px" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;Nội dung chi tiết<FCKeditorV2:FCKeditor ID="FCKeditor3" runat="server" BasePath="~/Viettool/fckeditor/" Height="310px">
                    </FCKeditorV2:FCKeditor>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;Quảng cáo<FCKeditorV2:FCKeditor ID="FCKeditor4" runat="server" BasePath="~/Viettool/fckeditor/" Height="310px">
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

