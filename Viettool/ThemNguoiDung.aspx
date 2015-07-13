<%@ Page Language="C#" MasterPageFile="~/Viettool/MasterPage.master" AutoEventWireup="true" CodeFile="ThemNguoiDung.aspx.cs" Inherits="Viettool_ThemNguoiDung" Title="Cap Nhat - Website" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">
        function ClientValidate(source, args)
        {
            if(args.Value.length > 24)
                args.IsValid = false;
            else
                args.IsValid = true;
        }
    </script>
    <center>
        <a style="color:#005AAA; font-weight:bold">THÊM NGƯỜI DÙNG</a>
        <div style="clear:both;height:10px"></div>
        <%--<div style="float:left;width:96%;height:30px;background-color:Purple;position:relative;left:2%;text-align:left;vertical-align:middle">
            <a style="color:Aqua; font-weight:bold; font-size:14pt">Đăng kí Account</a>
        </div>--%>
        <form>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table width="96%" cellpadding="0" cellspacing="0">
                    <tr>
                        <td colspan="3" align="left" valign="middle" 
                            style="background-color:#FFB9DA; height:30px">
                            <a style="color:#FF0000; font-weight:bold; font-size:14pt">Đăng ký Account</a>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="left" valign="middle" 
                            style="background-color:#FFE8F3; height:30px">
                            <asp:Image ID="Image1" ImageUrl="~/Viettool/images/icon1.gif" runat="server" />
                            <a style="color:#000080">Tất cả thông tin dưới đây cần được điền đầy đủ</a>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 140px; height: 27px;" align="right">
                            Username</td>
                        <td style="width:3px; height: 27px;"></td>    
                        <td align="left" style="height: 27px;background-color:White">
                            <asp:TextBox ID="txtUsername" Width="300px" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 140px; height: 27px;" align="right">
                            Họ tên</td>
                        <td style="width:3px; height: 27px;"></td>
                        <td align="left" style="height: 27px;background-color:White">
                            <asp:TextBox ID="txtName" Width="300px" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 140px; height: 27px;" align="right">
                            Nhập Password</td>
                        <td style="width:3px; height: 27px;"></td>
                        <td align="left" style="height: 27px;background-color:White">
                            <asp:TextBox ID="txtPassword" Width="210px" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:Label ForeColor="Red" ID="Label1" runat="server" Text="&nbsp;&nbsp;( Tối đa 24 ký tự, password mặt định :1234  )"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 140px; height: 27px;" align="right">
                            Địa chỉ Email</td>
                        <td style="width:3px; height: 27px;"></td>
                        <td align="left" style="height: 27px;background-color:White">
                            <asp:TextBox ID="txtEmail" Width="210px" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 140px; height: 27px;">
                            </td>
                        <td style="height: 27px; width: 3px;">
                            </td>
                        <td style="height: 27px;background-color:White" align="center">
                            <table style="width: 413px">
                                <tr>
                                    <td>
                                        <asp:RadioButton ID="raUpdate" Checked="true" GroupName="Role" runat="server" Text="Quyền cập nhật" />
                                    </td>
                                    <td>
                                        <asp:RadioButton ForeColor="Red" ID="raAdmin" GroupName="Role" runat="server" Text="Quyền quản trị" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 140px; height: 27px;">
                            </td>
                        <td style="height: 27px; width: 3px;">
                            </td>
                        <td style="height: 27px;background-color:White">
                            </td>
                    </tr>
                    <tr>
                        <td style="width: 140px; height: 27px;">
                            </td>
                        <td style="height: 27px; width: 3px;">
                            </td>
                        <td style="height: 27px;background-color:White" align="center">
                            <table style="width: 221px">
                                <tr>
                                    <td>
                                        <asp:Button ID="btnDangky" runat="server" Text="Đăng ký" 
                                            onclick="btnDangky_Click" />
                                    </td>
                                    <td>
                                        <%--<asp:Button ID="Button2" runat="server" Text="Huỷ bỏ" />--%>
                                        <input id="btnHuy" type="reset" value="Huỷ bỏ" />
                                    </td>
                                </tr>
                            </table>
                            </td>
                    </tr>
                    <tr>
                        <td style="width: 140px; height: 27px;">
                            &nbsp;</td>
                        <td style="height: 27px; width: 3px;">
                            &nbsp;</td>
                        <td style="height: 27px;background-color:White; text-align: left;" 
                            align="center">
                            <asp:RequiredFieldValidator ID="requireUsername" runat="server" 
                                ControlToValidate="txtUsername" Display="Dynamic" Font-Size="Small"
                                ErrorMessage="Username không bỏ trống.<br>"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="requireName" runat="server" 
                                ControlToValidate="txtName" Display="Dynamic" Font-Size="Small"
                                ErrorMessage="Họ tên không bỏ trống.<br>"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="requirePassword" runat="server" 
                                ControlToValidate="txtPassword" Display="Dynamic" Font-Size="Small"
                                ErrorMessage="Password không bỏ trống.<br>"></asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="customPassword" runat="server" Font-Size="Small" 
                                ClientValidationFunction="ClientValidate" ControlToValidate="txtPassword" 
                                Display="Dynamic" ErrorMessage="Password tối đa 24 ký tự.<br>"></asp:CustomValidator>
                            <asp:RequiredFieldValidator ID="requireEmail" runat="server" 
                                ControlToValidate="txtEmail" Display="Dynamic" Font-Size="Small" 
                                ErrorMessage="Email không bỏ trống.<br>"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regularEmail" runat="server" 
                                ControlToValidate="txtEmail" Display="Dynamic" Font-Size="Small" 
                                ErrorMessage="Email không hợp lệ.<br>" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            <asp:Label ID="lblMessage" runat="server" Text="" Visible="false" ForeColor="Red" Font-Size="Small"></asp:Label>
                            </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
        </form>
    </center>
</asp:Content>