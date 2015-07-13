<%@ Page Language="C#" MasterPageFile="~/ViettoolEng/MasterPage.master" AutoEventWireup="true" CodeFile="Sanpham.aspx.cs" Inherits="ViettoolEng_Default4" Title="Cap Nhat - Website" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    &nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
        DataSourceID="SqlDataSource1" HorizontalAlign="Center" Width="735px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="Honeydew" >
        <Columns>
            <asp:BoundField DataField="TIEUDE" HeaderText="Tiêu Đề" SortExpression="TIEUDE" />
            <asp:BoundField DataField="NEWS_ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                SortExpression="NEWS_ID" />
            <asp:BoundField DataField="CHANNEL_ID" HeaderText="Channel" SortExpression="CHANNEL_ID" />
            <asp:BoundField DataField="USERID" HeaderText="User" SortExpression="USERID" />
            <asp:BoundField DataField="NGAY" HeaderText="Ngày" SortExpression="NGAY" />
            <asp:CommandField  SelectText="Sửa" ShowSelectButton="True" ButtonType="Image" SelectImageUrl="~/ViettoolEng/images/giohang.gif" />
        </Columns>
        <HeaderStyle BackColor="YellowGreen" />
        <SelectedRowStyle BackColor="Cyan" />
        <PagerStyle BackColor="#8080FF" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>"
        SelectCommand="SELECT [TIEUDE], [USERID], [NGAY], [NEWS_ID], [CHANNEL_ID] FROM [TINTUC01_ENG] WHERE ([CAP_ID] = @CAP_ID)">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="CAP_ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

