<%@ Page Language="C#" MasterPageFile="~/Viettool/MasterPage.master" AutoEventWireup="true" CodeFile="QuanTri.aspx.cs" Inherits="Viettool_QuanTri" Title="Cap Nhat - Website" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
    <a style="color:#005AAA; font-weight:bold; position:relative; left:4%">Danh sách người dùng</a>
    <div style="clear:both;height:10px"></div>
    <center>
        <asp:GridView ID="gvQTri" BorderColor="#FFE8F3" runat="server" AutoGenerateColumns="False" 
            Width="750px" 
            onrowdeleting="gvQTri_RowDeleting" AllowPaging="True" 
            onpageindexchanging="gvQTri_PageIndexChanging" PageSize="5">
            <RowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
                    Visible="False" />
                <asp:TemplateField HeaderText="Tên user">
                    <ItemTemplate>
                        <asp:Label ID="lblUName" runat="server" Text='<%# Bind("ten") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ten") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Quyền cập nhật">
                    <ItemTemplate>
                        <asp:Label ID="lblRole" runat="server" Text='<%# Bind("aclevel") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("aclevel") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemStyle ForeColor="Red" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField ItemStyle-ForeColor="#000080" DataField="hoten" ItemStyle-Width="240px" HeaderText="Họ tên" >
<ItemStyle Width="240px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField ItemStyle-ForeColor="#2E62A9" DataField="email" 
                    HeaderText="Email" >
<ItemStyle ForeColor="#2E62A9"></ItemStyle>
                </asp:BoundField>
                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Xoá" ShowHeader="False">
                    <ItemTemplate>
                        <asp:ImageButton ID="imgDelete" ImageUrl="~/Viettool/images/icon_trashcan.gif" OnClientClick="return(confirm('Bạn có chắc xoá?'))" CommandName="Delete" runat="server" />
                    </ItemTemplate>
                    <HeaderStyle ForeColor="Red" />

    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:TemplateField>
            </Columns>
            <PagerStyle ForeColor="#FF33CC" />
            <HeaderStyle BackColor="#FFCACA" />
        </asp:GridView>
        <div style="clear:both;height:20px"></div>
        <div style="position:relative;width:90%;text-align:right">
            <img src="imgtoolbar/NEW.GIF" /><a class="themNDLink" href="ThemNguoiDung.aspx">Thêm mới</a>
        </div>
        <br />
        <asp:Label ID="lblMessage" runat="server" Text="" Visible="false" ForeColor="Red" Font-Size="Small"></asp:Label>
    </center>
</asp:Content>

