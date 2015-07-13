<%@ Page Language="C#" MasterPageFile="~/Viettool/MasterPage.master" AutoEventWireup="true" CodeFile="ChiTietSP.aspx.cs" Inherits="Viettool_Default4" Title="Cap Nhat - Website" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="clear:both;height:5px;font-size:0px"></div>
    <div style="float:left;width:80px;min-height:1px"></div>
    <div style="float:left;width:730px;min-height:1px">
        <div style="float:left;width:110px;min-height:1px;height:21px;line-height:21px" class="smallText">Hình thức thực hiện</div>
        <div style="float:left;width:150px;min-height:1px">
            <asp:DropDownList ID="ddlForm" CssClass="smallText" runat="server">
                <asp:ListItem Value="0" Selected="True">--- Chọn hình thức ---</asp:ListItem>
                <asp:ListItem Value="1">Đầu tư</asp:ListItem>
                <asp:ListItem Value="2">Xây lắp</asp:ListItem>
                <asp:ListItem Value="3">Tư vấn thiết kế</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div style="float:left;width:70px;min-height:1px;height:21px;line-height:21px" class="smallText">Tình trạng</div>
        <div style="float:left;width:150px;min-height:1px">
            <asp:DropDownList ID="ddlPeriod" CssClass="smallText" runat="server">
                <asp:ListItem Value="0" Selected="True">--- Chọn tình trạng ---</asp:ListItem>
                <asp:ListItem Value="1">Đã hoàn thành</asp:ListItem>
                <asp:ListItem Value="2">Đang thực hiện</asp:ListItem>
                <asp:ListItem Value="3">Trong tương lai</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div style="float:left;width:110px;min-height:1px;height:21px;line-height:21px">
            <asp:CheckBox ID="cboTypical" CssClass="smallText" runat="server" Text="Dự án tiêu biểu" />
        </div>
        <div style="float:left;width:110px;min-height:1px">
            <asp:Button ID="btnSubmit" CssClass="smallText" Width="75px" runat="server" 
                Text="Submit" onclick="btnSubmit_Click" />
        </div>
        <div style="float:left;width:30px;min-height:1px">
            <asp:LinkButton ID="lbtnAll" CssClass="topLinks smallText" runat="server" 
                onclick="lbtnAll_Click">Tất cả</asp:LinkButton>
        </div>
    </div>
    <div style="clear:both;height:10px;font-size:0px"></div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
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
            <asp:BoundField DataField="TENSANPHAM" HeaderText="Tên danh mục sp" 
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
    <asp:ImageButton ID="ImageButton1" runat="server" AlternateText="Thêm Danh mục" ImageUrl="~/Viettool/images/giohang.gif" Width="20px" />
    <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Thêm 
sản phẩm</asp:LinkButton><br />
</asp:Content>

