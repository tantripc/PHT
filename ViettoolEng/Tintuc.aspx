<%@ Page Language="C#" MasterPageFile="~/ViettoolEng/MasterPage.master" AutoEventWireup="true" CodeFile="Tintuc.aspx.cs" Inherits="ViettoolEng_Default4" Title="Cap Nhat - Website" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    &nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
        DataSourceID="SqlDataSource1" HorizontalAlign="Center" Width="735px" 
        onrowdeleting="GridView1_RowDeleting" 
        onselectedindexchanged="GridView1_SelectedIndexChanged">
    <Columns>
        <asp:BoundField DataField="NEWS_ID" HeaderText="ID" 
            SortExpression="TIEUDE" />
        <asp:BoundField DataField="TIEUDE" HeaderText="Tiêu đề"
                SortExpression="NOIDUNG" >
                <ItemStyle Width="300px" Font-Bold="True" /> 
        </asp:BoundField>
        <asp:BoundField DataField="NGAY" HeaderText="Ngày" SortExpression="NGAY" />
        <asp:BoundField DataField="USERID" HeaderText="User" 
            SortExpression="USERID" />
        <asp:CommandField  SelectText="Sửa" ShowSelectButton="True" ButtonType="Image" SelectImageUrl="~/ViettoolEng/images/giohang.gif" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                   
                    <asp:ImageButton  ID="LinkButton2" runat="server" CausesValidation="true" CommandName="Delete"
                       OnClientClick="return (confirm ('Bạn Có Chắc Xóa Không ???'))" AlternateText="Xóa" ImageUrl="~/ViettoolEng/images/icon_trashcan.gif" ></asp:ImageButton>
                </ItemTemplate>
            </asp:TemplateField>
             
    </Columns>
    <HeaderStyle BackColor="YellowGreen" />
        <SelectedRowStyle BackColor="Cyan" />
        <PagerStyle BackColor="#8080FF" />
</asp:GridView>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VinhTuongConnectionString2 %>"
        
    
        SelectCommand="SELECT [NEWS_ID], [TIEUDE], [NGAY], [USERID] FROM [TINTUC01] WHERE ([CAP_ID] = @CAP_ID)">
    <SelectParameters>
        <asp:Parameter DefaultValue="2" Name="CAP_ID" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>

