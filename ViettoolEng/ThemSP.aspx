<%@ Page Language="C#" MasterPageFile="~/ViettoolEng/MasterPage.master" AutoEventWireup="true" CodeFile="ThemSP.aspx.cs" Inherits="ViettoolEng_Default4" Title="Cap Nhat - Website" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <table style="width: 814px; height: 686px">
        <tr>
            <td valign="top" style="width: 124px">
                &nbsp;Hình ảnh / Tóm tắt<FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" BasePath="~/ViettoolEng/fckeditor/"
                        Height="230px" Width="352px">
                    </FCKeditorV2:FCKeditor>
            </td>
            <td colspan="2" style="width: 466px">
                <div style="float:left;width:465px;min-height:1px">
                    <div style="float:left;width:155px;min-height:1px">
                        <asp:RadioButton ID="raPast" runat="server" CssClass="smallText" Text="Đã hoàn thành" GroupName="Period" Checked="true" />
                    </div>
                    <div style="float:left;width:155px;min-height:1px">
                        <asp:RadioButton ID="raPresent" runat="server" CssClass="smallText" Text="Đang thực hiện" GroupName="Period" />
                    </div>
                    <div style="float:left;width:155px;min-height:1px">
                        <asp:RadioButton ID="raFuture" runat="server" CssClass="smallText" Text="Trong tương lai" GroupName="Period" />
                    </div>
                </div>
                <div style="clear:both;height:5px;font-size:0px"></div>
                <div style="float:left;width:5px;min-height:1px"></div>
                <div style="float:left;width:75px;min-height:1px;line-height:21px;height:21px" class="smallText">Hình thức</div>
                <div style="float:left;width:385px;min-height:1px">
                    <div style="float:left;width:100px;min-height:1px">
                        <asp:RadioButton ID="raDauTu" runat="server" CssClass="smallText" Text="Đầu tư" GroupName="Form" Checked="true" />
                    </div>
                    <div style="float:left;width:100px;min-height:1px">
                        <asp:RadioButton ID="raNhanThau" runat="server" CssClass="smallText" Text="Xây lắp" GroupName="Form" />
                    </div>
                    <div style="float:left;width:185px;min-height:1px">
                        <asp:RadioButton ID="raTuVan" runat="server" CssClass="smallText" Text="Tư vấn thiết kế" GroupName="Form" />
                    </div>
                </div>
                <div style="clear:both;height:5px;font-size:0px"></div>
                <div style="float:left;width:465px;min-height:1px">
                    <asp:CheckBox ID="cboTieuBieu" CssClass="smallText" Text="Dự án tiêu biểu" runat="server" />
                </div>
                <div style="clear:both;height:5px;font-size:0px"></div>
                <table style="width: 440px; height: 152px" border="1">
                        <tr>
                            <td style="width: 109px">
                                Tiêu đề</td>
                            <td colspan="2">
                                <asp:TextBox ID="txtTieude" runat="server" Width="236px"></asp:TextBox>
                                <asp:CheckBox ID="cboFix" CssClass="smallText" Visible="false" runat="server" Text="Fix" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 109px; height: 21px">
                                Vị trí</td>
                            <td colspan="2" style="height: 21px">
                                <asp:TextBox ID="txtViTri" runat="server" Width="200px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 109px; height: 21px">
                                Quy mô</td>
                            <td colspan="2" style="height: 21px">
                                <asp:TextBox ID="txtDienTich" runat="server" Width="200px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 109px; height: 21px">
                                Giá trị</td>
                            <td colspan="2" style="height: 21px">
                                <asp:TextBox ID="txtKinhPhi" runat="server" Width="200px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 109px; height: 21px">
                                Tiến độ</td>
                            <td colspan="2" style="height: 21px">
                                <asp:TextBox ID="txtHoanThanh" runat="server" Width="200px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 109px; height: 21px">
                                Chủ đầu tư</td>
                            <td colspan="2" style="height: 21px">
                                <asp:TextBox ID="txtChuDauTu" runat="server" Width="200px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 109px; height: 21px">
                                Thiết kế</td>
                            <td colspan="2" style="height: 21px">
                                <asp:TextBox ID="txtThietKe" runat="server" Width="200px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 109px; height: 21px">
                                Thi công</td>
                            <td colspan="2" style="height: 21px">
                                <asp:TextBox ID="txtThiCong" runat="server" Width="200px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 109px; height: 21px">
                                HT Hợp đồng</td>
                            <td colspan="2" style="height: 21px">
                                <asp:TextBox ID="txtGiamSat" runat="server" Width="200px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 109px; height: 21px">
                                Ngày nhập</td>
                            <td colspan="2" style="height: 21px">
                                <asp:TextBox ID="txtNgay" autocomplete="off" runat="server"></asp:TextBox>
                                <cc1:CalendarExtender ID="calendarExtNgaySinh" runat="server"
                                    TargetControlID="txtNgay" Format="dd/MM/yyyy"
                                    PopupPosition="TopRight">
                                </cc1:CalendarExtender>
                            </td>
                        </tr>
                    </table>
                <asp:Label ID="labelMessage" runat="server" ForeColor="Navy" Text="Up Image:" Width="99px"></asp:Label>
                <asp:FileUpload ID="FileUpload1" runat="server" Width="258px" />
                <asp:Button ID="Upload" runat="server" OnClick="Upload_Click" Text="Tải lên" /><br />
                <asp:Image ID="Anhlon" runat="server" Visible="False" />
                <asp:Image ID="Anhnho" runat="server" Visible="False" />&nbsp;
                <asp:Label ID="Label1" runat="server" Enabled="False" Text="nophoto.png"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="height: 21px">
                &nbsp;Mô tả Sản phẩm<%--<FCKeditorV2:FCKeditor ID="FCKeditor2" runat="server" BasePath="~/ViettoolEng/fckeditor/">
                    </FCKeditorV2:FCKeditor>--%>
                    <asp:TextBox ID="txtTomTat" Width="810px" TextMode="MultiLine" Height="200px" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                &nbsp;Nội dung chi tiết<FCKeditorV2:FCKeditor ID="FCKeditor3" runat="server" BasePath="~/ViettoolEng/fckeditor/" Height="310px">
                    </FCKeditorV2:FCKeditor>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Thêm sản phẩm" />
                <asp:TextBox ID="txtma" runat="server" Visible="False" Width="12px"></asp:TextBox>
                <div style="clear:both;height:10px;font-size:0px"></div>
                <asp:Label ID="lblError" runat="server" Visible="false" Text="" style="color:Red;font-family:Arial;font-size:9pt"></asp:Label>                
                </td>
        </tr>
    </table>
</asp:Content>

