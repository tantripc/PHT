<%@ Page Language="C#" MasterPageFile="~/Viettool/MasterPage.master" AutoEventWireup="true" CodeFile="PanelTrai.aspx.cs" Inherits="Viettool_Default4" Title="Cap Nhat - Website" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    &nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                    HorizontalAlign="Center" Width="735px" AllowPaging="True"
                    BackColor="GhostWhite" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"
                    CellPadding="2" Font-Overline="False" Font-Strikeout="False" Font-Underline="False"
                    ForeColor="Black" GridLines="Both" OnRowDeleting="GridView1_RowDeleting"
                    OnSelectedIndexChanged="GridView1_SelectedIndexChanged" 
        PageSize="7" Height="232px" onpageindexchanging="GridView1_PageIndexChanging">
        <Columns>
            <asp:BoundField DataField="NEWS_ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                SortExpression="NEWS_ID" />
            <asp:BoundField DataField="STT" ItemStyle-Width="30px" HeaderText="STT" SortExpression="STT" />
            <asp:BoundField DataField="TOMTAT" HeaderText="Tên danh mục sp" 
                HtmlEncode="False" />
            <asp:BoundField DataField="NOIDUNG" ItemStyle-Width="75px" DataFormatString="Text" HeaderText="Nội dung"
                HtmlEncode="False" SortExpression="TOMTAT" />
            <asp:BoundField DataField="NGAY" ItemStyle-Width="75px" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Ng&#224;y" SortExpression="NGAY" />
            <asp:BoundField DataField="USERID" HeaderText="User" ItemStyle-Width="65px" SortExpression="USERID" />
            <asp:CommandField  SelectText="Sửa" ShowSelectButton="True" ButtonType="Image" SelectImageUrl="~/Viettool/images/icon_pencil.gif" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:ImageButton  ID="LinkButton1" runat="server" CausesValidation="true" CommandName="Delete"
                       OnClientClick="return (confirm ('Bạn Có Chắc Xóa Không ???'))" AlternateText="Xóa" ImageUrl="~/Viettool/images/icon_trashcan.gif" ></asp:ImageButton>
                </ItemTemplate>
            </asp:TemplateField>
            
        </Columns>
        <HeaderStyle BackColor="SkyBlue" />
    </asp:GridView>
    &nbsp;<br />
    &nbsp;
    <asp:ImageButton ID="ImageButton1" runat="server" AlternateText="Tin mới" 
        ImageUrl="~/Viettool/images/icon1.gif" Width="16px" Height="16px" />&nbsp;
    <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Thêm tin</asp:LinkButton><br />
</asp:Content>

