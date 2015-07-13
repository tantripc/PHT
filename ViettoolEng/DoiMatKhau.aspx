<%@ Page Language="C#" MasterPageFile="~/ViettoolEng/MasterPage.master" AutoEventWireup="true" CodeFile="DoiMatKhau.aspx.cs" Inherits="ViettoolEng_DoiMatKhau" Title="Cap Nhat - Website" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script language="javascript" type="text/javascript">
        function ClientValidate(source, args)
        {
            if(args.Value.length > 24)
                args.IsValid = false;
            else
                args.IsValid = true;
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div style="clear:both;height:10px"></div>
            <table width="100%">
                <tr>
                    <td>
                    </td>
                    <td style="width:50%;margin-left:15%">
                        <asp:Panel ID="pnl1" DefaultButton="btnChange" style="background-color:#005AAA" runat="server">
                            <table align="center" width="94%">
                                <tr>
                                    <td colspan="3">
                                        <a style="color:White">Đổi mật khẩu vào hệ thống cập nhật nội dung Website</a>
                                        <hr style="color:#9999FF" />
                                    </td>
                                </tr>
                                <tr>
                                    <td rowspan="3" style="width: 107px" align="center">
                                        <asp:Image ID="Image1" ImageUrl="~/ViettoolEng/images/lockin.gif" runat="server" 
                                            Height="50px" Width="58px" />
                                    </td>
                                    <td style="color:White; width: 103px;" align="right">
                                        Mật khẩu cũ:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtOldPass" TextMode="Password" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="color:White; width: 103px;" align="right">
                                        *Mật khẩu mới:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtNewPass1" TextMode="Password" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="color:White; width: 103px;" align="right">
                                        *Mật khẩu mới:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtNewPass2" TextMode="Password" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" align="right">
                                        <asp:Button ID="btnChange" runat="server" Text="Đổi mật khẩu" 
                                            onclick="btnChange_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <a style="color:#9999FF;font-weight:bold">*Lưu ý:</a>
                                        <div style="clear:both;height:1px"></div>
                                        <a style="color:#9999FF">Mật khẩu mới nhập 2 lần để tránh nhầm mật khẩu.</a>
                                        <hr style="color:#9999FF" />
                                    </td>
                                </tr>
                                <tr style="height:15px">
                                    <td colspan="3"></td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <cc1:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server"
                                TargetControlID="pnl1" Radius="15" Corners="All">
                        </cc1:RoundedCornersExtender>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td style="width:50%;margin-left:15%">
                        <asp:RequiredFieldValidator ID="requireOldPass" runat="server" 
                            ControlToValidate="txtOldPass" Display="Dynamic" Font-Size="Small"
                            ErrorMessage="Mật khẩu cũ không bỏ trống.&lt;br&gt;"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="requireNewPass1" runat="server" 
                            ControlToValidate="txtNewPass1" Display="Dynamic" 
                            ErrorMessage="Mật khẩu mới không để trống.&lt;br&gt;" Font-Size="Small"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                            ControlToCompare="txtOldPass" ControlToValidate="txtNewPass1" Display="Dynamic" 
                            ErrorMessage="Mật khẩu mới phải khác mật khẩu cũ.&lt;br&gt;" Font-Size="Small" 
                            Operator="NotEqual"></asp:CompareValidator>
                        <asp:CustomValidator ID="customPassword" runat="server" Font-Size="Small" 
                            ClientValidationFunction="ClientValidate" ControlToValidate="txtNewPass1" 
                            Display="Dynamic" ErrorMessage="Mật khẩu mới tối đa 24 ký tự.<br>"></asp:CustomValidator>
                        <asp:RequiredFieldValidator ID="requireNewPass2" runat="server" 
                            ControlToValidate="txtNewPass2" Display="Dynamic" 
                            ErrorMessage="Phải nhập lại mật khẩu mới.&lt;br&gt;" Font-Size="Small"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="compareNewPass" runat="server" 
                            ControlToCompare="txtNewPass1" ControlToValidate="txtNewPass2" Font-Size="Small" 
                            Display="Dynamic" ErrorMessage="Mật khẩu mới chưa trùng khớp.<br>"></asp:CompareValidator>
                        <asp:Label ID="lblMessage" Font-Size="Small" Visible="false" ForeColor="Red" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>