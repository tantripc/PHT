<%@ Page Language="C#" MasterPageFile="~/Viettool/MasterPage.master" AutoEventWireup="true" CodeFile="gopy.aspx.cs" Inherits="Viettool_Default4" Title="Cap Nhat - Website" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin-left:12px">
        <asp:LinkButton ID="lbtnCheckAll" CssClass="gopyTopLink" runat="server" 
            onclick="lbtnCheckAll_Click">Chọn tất cả</asp:LinkButton> |
        <asp:LinkButton ID="lbtnUnCheckAll" CssClass="gopyTopLink" runat="server" 
            onclick="lbtnUnCheckAll_Click">Bỏ chọn tất cả</asp:LinkButton> |
        <asp:LinkButton ID="lbtnRead" CssClass="gopyTopLink" runat="server" 
            onclick="lbtnRead_Click">Đánh dấu đã xem</asp:LinkButton> |
        <asp:LinkButton ID="lbtnUnread" CssClass="gopyTopLink" runat="server" 
            onclick="lbtnUnread_Click">Đánh dấu chưa xem</asp:LinkButton> |
        <asp:LinkButton ID="lbtnDelete" CssClass="gopyTopLink" runat="server" 
            onclick="lbtnDelete_Click" OnClientClick="return(confirm('Bạn có muốn xoá?'))">Xoá góp ý</asp:LinkButton>
    </div>
    <div style="clear:both;height:10px"></div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:GridView ID="gv1" runat="server" GridLines="None" AutoGenerateColumns="false" ShowHeader="false" Width="799px" HorizontalAlign="Center">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Panel ID="Panel1" runat="server">
                                <table style="width: 798px">
                                    <tr>
                                        <td colspan="2" style="width: 105153848px; background-color: lightsteelblue;height: 6px;">
                                                        <asp:CheckBox ID="CheckBox1" runat="server" CssClass="smallText" />
                                            <asp:Label ID="TIEUDELabel" runat="server" CssClass="smallText" Text='<%# Eval("TIEUDE") %>'></asp:Label>&nbsp;
                                            -&nbsp;
                                            <asp:Label ID="NGAYLabel" runat="server" CssClass="smallText" Text='<%# Eval("NGAY","{0:dd/MM/yyyy}") %>'></asp:Label>
                                           
                                        </td>
                                        <td align="right" style="font-size: smaller; background-color: lightsteelblue; height: 6px;">
                                                    <asp:Button ID="Button5" runat="server" CssClass="midText"
                                                Text="Trả lời" Height="19px" Width="55px" PostBackUrl='<%# "Traloi.aspx?GOPY_ID="+Eval("GOPY_ID") %>' /></td>
                                    </tr>
                                    <tr>
                                        <td rowspan="3" style="width: 113009px; background-color: #ffedf5;">
                                            <table style="width: 307px; height: 79px;" valign="top">
                                                <tr>
                                                    <td class="smallText">
                                                        Họ tên:</td>
                                                    <td colspan="2">
                                            <asp:Label ID="HOTENLabel" CssClass="smallText" runat="server" Text='<%# Eval("HOTEN") %>'></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="smallText">
                                                        Email:</td>
                                                    <td colspan="2">
                                <asp:Label ID="MAILLabel" runat="server" CssClass="smallText" Text='<%# Eval("MAIL") %>'></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="smallText">
                                                        Địa chỉ:</td>
                                                    <td colspan="2">
                                            <asp:Label ID="DIACHILabel" CssClass="smallText" runat="server" Text='<%# Eval("DIACHI") %>'></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="smallText">
                                                        Điện thoại</td>
                                                    <td colspan="2">
                                            <asp:Label ID="DIENTHOAILabel" CssClass="smallText" runat="server" Text='<%# Eval("DIENTHOAI") %>'></asp:Label></td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td colspan="2" style="width: 105153848px; height: 21px; background-color: #fff7fe">
                                            <asp:Image ID="Image3" runat="server" ImageUrl="~/Viettool/images/hoi.gif" />
                                            &nbsp;
                                            <asp:Label ID="Label3" CssClass="smallText" runat="server" Font-Bold="True" ForeColor="Blue" Text="Hỏi"></asp:Label>
                                            &nbsp; &nbsp; &nbsp; &nbsp; ==========================================</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="width: 105153848px; height: 21px; background-color: #fff7fe">
                                <asp:Label ID="NOIDUNGLabel" runat="server" CssClass="smallText" Text='<%# Eval("NOIDUNG") %>' Height="80px" Width="469px"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="width: 105153848px; height: 21px; background-color: #fff7fe">
                                            <asp:Image ID="Image4" runat="server" ImageUrl="~/Viettool/images/dap.gif" />&nbsp;
                                            <asp:Label ID="Label4" CssClass="smallText" runat="server" Font-Bold="True" ForeColor="Red" Text="Trả lời"></asp:Label>
                                            &nbsp; &nbsp; ==========================================</td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="lbtnCheckAll" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="lbtnUnCheckAll" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:Label ID="lblMessage" runat="server" Text="" Font-Size="Small" Visible="false" ForeColor="Red"></asp:Label>
</asp:Content>

