<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="ViettoolEng_login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Login Page</title>
</head>
<body>
    <form id="form1" runat="server">
            <table style="width: 849px; height: 131px; background-color: #c2cee2; " border="0" align="center">
                <tr>
                    <td style="width: 9px; height: 5px;">
                        <asp:Image ID="Image3" runat="server" Height="12px" ImageUrl="~/ViettoolEng/images/login_r1_c1.gif"
                            Width="17px" /></td>
                    <td colspan="2" style="height: 5px">
                        </td>
                    <td style="width: 21px; height: 5px">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/ViettoolEng/images/login_r1_c7.gif" /></td>
                </tr>
                <tr>
                    <td style="width: 9px" rowspan="5">
                    </td>
                    <td style="width: 7296px; height: 28px;">
                        <table style="width: 442px" align="center">
                            <tr>
                                <td colspan="3" style="width: 438px">
                                    Chào mừng quý khách đến với hệ thống</td>
                            </tr>
                            <tr>
                                <td colspan="3" style="width: 438px; color: #6633ff; font-style: italic; font-variant: normal;" align="center">
                                    Cập Nhật Website</td>
                            </tr>
                            <tr>
                                <td colspan="3" style="width: 438px">
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td rowspan="5" style="width: 1038px">
                        <table style="width: 223px; background-color: #005aaa; height: 347px;">
                            <tr>
                                <td style="width: 12px">
                                    <asp:Image ID="Image5" runat="server" ImageUrl="~/ViettoolEng/images/login_r2_c4.gif" /></td>
                                <td style="width: 228px; size: 4pt; color: #ffffff; text-align: left; font-variant: normal">
                                    </td>
                                <td style="width: 19px">
                                </td>
                            </tr>
                            <tr>
                                <td rowspan="3" style="width: 12px">
                                </td>
                                <td style="width: 228px; height: 21px; color: #ffffff; text-align: left; size: 6pt; font-size: small;">
                                    Đăng nhập vào hệ thống cập nhật nội dung Website</td>
                                <td rowspan="3" style="width: 19px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 228px">
                                    -------------------------</td>
                            </tr>
                            <tr>
                                <td style="width: 228px; color: #ffccff; text-indent: 1pt; text-align: left; font-weight: bold; font-size: small;">
                                    <table style="width: 189px">
                                        <tr>
                                            <td style="color: #ffffff; text-align: left">
                                                Tên:</td>
                                            <td colspan="2" style="width: 110px">
                                                <asp:TextBox ID="txtUser" runat="server" Width="101px"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td style="color: #ffffff; text-align: left">
                                                Mật khẩu</td>
                                            <td colspan="2" style="width: 110px">
                                                <asp:TextBox ID="txtpass" runat="server" Width="101px" TextMode="Password"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td colspan="2" style="width: 110px">
                                                <asp:Button ID="Button1" runat="server" Text="Đăng nhập" OnClick="Button1_Click" /></td>
                                        </tr>
                                    </table>
                                    *Lưu ý:<br />
                                    Tên và mật khẩu sử dụng do người quản trị cung cấp !</td>
                            </tr>
                            <tr>
                                <td style="width: 12px; height: 45px;">
                                </td>
                                <td style="width: 228px; height: 45px;">
                                    -------------------------</td>
                                <td style="width: 19px; height: 45px;">
                                    </td>
                            </tr>
                            <tr>
                                <td style="">
                                </td>
                                <td style="">
                                </td>
                                <td style="">
                                </td>
                            </tr>
                            <tr>
                                <td style="">
                                </td>
                                <td style="">
                                </td>
                                <td style="">
                                    <asp:Image ID="Image6" runat="server" Height="10px" ImageUrl="~/ViettoolEng/images/login_r8_c6.gif"
                                        Width="4px" /></td>
                            </tr>
                        </table>
                    </td>
                    <td style="" rowspan="5">
                    </td>
                </tr>
                <tr>
                    <td style="">
                    </td>
                </tr>
                <tr>
                    <td style="">
                    </td>
                </tr>
                <tr>
                    <td style="">
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                        <embed src="images/maytinh.swf" width="200px" height="180px"></embed>
                    </td>
                </tr>
                <tr>
                    <td style="">
                        <asp:Image ID="Image4" runat="server" ImageUrl="~/ViettoolEng/images/login_r9_c1.gif" /></td>
                    <td colspan="2" style="height: 21px">
                    </td>
                    <td style="">
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/ViettoolEng/images/login_r9_c7.gif" /></td>
                </tr>
            </table>
    

    </form>
</body>
</html>
