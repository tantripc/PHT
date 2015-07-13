<%@ Page Language="C#" MasterPageFile="~/ViettoolEng/MasterPage.master" AutoEventWireup="true" CodeFile="ChiTietTT.aspx.cs" Inherits="ViettoolEng_Default4" Title="Cap Nhat - Website" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="float:left;width:720px;min-height:1px"></div>
    <div style="float:left;width:110px;min-height:1px">
        <div style="float:left;width:60px;min-height:1px">
            <asp:LinkButton ID="lbtnNew" CssClass="topLinks smallText" runat="server" 
                onclick="lbtnNew_Click">Tin mới</asp:LinkButton>
        </div>
        <div style="float:left;width:50px;min-height:1px">
            <asp:LinkButton ID="lbtnAll" CssClass="topLinks smallText" runat="server" 
                onclick="lbtnAll_Click">Tất cả</asp:LinkButton>
        </div>
    </div>
    <div style="clear:both;height:5px;font-size:0px"></div>
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
            <asp:BoundField DataField="TENSANPHAM" HeaderText="Tên nội dung MN" 
                HtmlEncode="False" />
            <asp:BoundField DataField="NOIDUNG" ItemStyle-Width="75px" DataFormatString="Text" HeaderText="Nội dung"
                HtmlEncode="False" SortExpression="TOMTAT" />
            <asp:BoundField DataField="NGAY" ItemStyle-Width="75px" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Ng&#224;y" SortExpression="NGAY" />
            <asp:BoundField DataField="USERID" HeaderText="User" ItemStyle-Width="65px" SortExpression="USERID" />
            <asp:CommandField  SelectText="Sửa" ShowSelectButton="True" ButtonType="Image" SelectImageUrl="~/ViettoolEng/images/icon_pencil.gif" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:ImageButton  ID="LinkButton1" runat="server" CausesValidation="true" CommandName="Delete"
                       OnClientClick="return (confirm ('Bạn Có Chắc Xóa Không ???'))" AlternateText="Xóa" ImageUrl="~/ViettoolEng/images/icon_trashcan.gif" ></asp:ImageButton>
                </ItemTemplate>
            </asp:TemplateField>
            
        </Columns>
        <HeaderStyle BackColor="SkyBlue" />
    </asp:GridView>
    &nbsp;<br />
    &nbsp;
    <asp:ImageButton ID="ImageButton1" runat="server" AlternateText="Tin mới" 
        ImageUrl="~/ViettoolEng/images/icon1.gif" Width="16px" Height="16px" />&nbsp;
    <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Tin mới</asp:LinkButton><br />
</asp:Content>

