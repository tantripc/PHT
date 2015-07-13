<%@ Page Language="C#" MasterPageFile="~/ViettoolEng/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="ViettoolEng_Default" Title="Cap Nhat - Website" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <br />
    <span style="font-weight: bold; font-size: 11pt">
        Tạo Nhóm Menu
    </span>
    <br />
    <asp:GridView ID="gvMainMenu" runat="server" GridLines="Horizontal"
        AutoGenerateColumns="False" HorizontalAlign="Center"
        Width="860px" BackColor="#F9F8E3" TabIndex="1" 
        onrowdeleting="gvMainMenu_RowDeleting" 
        onselectedindexchanged="gvMainMenu_SelectedIndexChanged" 
        onrowcommand="gvMainMenu_RowCommand">
        <Columns>
            <asp:BoundField ItemStyle-Width="330px" DataField="TIEUDE" HeaderText="Tên nhóm Menu" ItemStyle-HorizontalAlign="Left" />
            <asp:BoundField DataField="NEWS_ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                SortExpression="NEWS_ID" >
                <ItemStyle Width="40px" Font-Bold="True" />
            </asp:BoundField>
            <asp:BoundField DataField="STT" HeaderText="STT" SortExpression="STT" >
                <ItemStyle Width="35px" Font-Bold="True" ForeColor="#C04000" />
            </asp:BoundField>
            <asp:BoundField DataField="USERID" HeaderText="User" SortExpression="USERID" >
                <ItemStyle Width="100px" Font-Bold="False" ForeColor="#C04000" />
            </asp:BoundField>
            <asp:BoundField DataField="NGAY" ItemStyle-Width="100px" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Ng&#224;y" SortExpression="NGAY" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:ImageButton  ID="LinkButton2" runat="server" CausesValidation="true" CommandName="AddMenu"
                       AlternateText="Thêm Menu" ImageUrl="~/ViettoolEng/imgtoolbar/NEW.GIF" ></asp:ImageButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField  SelectText="Sửa" ShowSelectButton="True" ButtonType="Image" SelectImageUrl="~/ViettoolEng/images/icon_pencil.gif" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:ImageButton  ID="LinkButton1" runat="server" CausesValidation="true" CommandName="Delete"
                       OnClientClick="return (confirm ('Bạn Có Chắc Xóa Không ???'))" AlternateText="Xóa" ImageUrl="~/ViettoolEng/images/icon_trashcan.gif" ></asp:ImageButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle BackColor="#EBE8A7" />
        <SelectedRowStyle BackColor="Cyan" />
        <PagerStyle BackColor="#8080FF" />
    </asp:GridView>
    <br />
    <div style="width:801px; text-align:right">
        <asp:ImageButton ID="ImageButton1" runat="server"
        Height="13px" ImageUrl="~/ViettoolEng/images/icon1.gif" OnClientClick="return false;"
        Width="14px" />
        &nbsp;
        <asp:HyperLink ID="HyperLink1" runat="server" 
            NavigateUrl="~/ViettoolEng/AddMenu.aspx?CHANNEL_ID=11" 
            style="text-align: right">Thêm Nhóm Menu</asp:HyperLink>
    </div>
    <asp:DataList ID="dl1" runat="server">
        <ItemTemplate>
            <asp:Panel ID="pnlChildOfList" runat="server">
                <div style="text-align: center">
                    <span style="color: #800000; font-weight: bold; font-size: 11pt">
                        <%# DataBinder.Eval(Container.DataItem, "TIEUDE") %>
                    </span>
                </div>
                    <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="False"
                        HorizontalAlign="Center" GridLines="Horizontal"
                        DataKeyNames="NEWS_ID" DataSource='<%# BindChild((int)DataBinder.Eval(Container.DataItem, "STT")).Tables[0] %>'
                        Width="860px" OnSelectedIndexChanged="GridView7_SelectedIndexChanged"
                        OnRowDeleting="GridView7_RowDeleting"
                        BackColor="Honeydew" TabIndex="1" 
                        onrowcommand="GridView7_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="TIEUDE" ItemStyle-Width="330px" HeaderText="Tên Menu" />
                            <asp:BoundField DataField="NEWS_ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                SortExpression="NEWS_ID" >
                                <ItemStyle Width="40px" Font-Bold="True" />
                            </asp:BoundField>
                            <asp:BoundField Visible="true" ItemStyle-Font-Size="0pt" ItemStyle-Width="0px" DataField="CHANNEL_ID" />
                            <asp:BoundField DataField="STT" HeaderText="STT" SortExpression="STT" >
                                <ItemStyle Width="35px" Font-Bold="True" ForeColor="#C04000" />
                            </asp:BoundField>
                            <asp:BoundField DataField="USERID" HeaderText="User" SortExpression="USERID" >
                                <ItemStyle Width="100px" Font-Bold="False" ForeColor="#C04000" />
                            </asp:BoundField>
                            <asp:BoundField DataField="NGAY" ItemStyle-Width="100px" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Ng&#224;y" SortExpression="NGAY" />
                            <asp:BoundField DataField="CAP_ID" ItemStyle-Font-Size="0pt" ItemStyle-Width="0px" />
                            <asp:CommandField SelectText="Sửa" ShowSelectButton="True" ButtonType="Image" SelectImageUrl="~/ViettoolEng/images/icon_pencil.gif" />
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:ImageButton  ID="LinkButton2" runat="server" CausesValidation="true" CommandName="Delete"
                                       OnClientClick="return (confirm ('Bạn Có Chắc Xóa Không ???'))" AlternateText="Xóa" ImageUrl="~/ViettoolEng/images/icon_trashcan.gif" ></asp:ImageButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="true">
                                <HeaderTemplate>
                                    <asp:Image ID="imgNew" ImageUrl="~/ViettoolEng/images/imgNew.gif" runat="server" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="lbtnAdd" runat="server" CausesValidation="true" CommandName="Add"
                                        AlternateText="Thêm" ImageUrl="~/ViettoolEng/images/icon1.gif" >
                                    </asp:ImageButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="false">
                                <ItemTemplate>
                                    <asp:ImageButton ID="lbtnShowSP" runat="server" CausesValidation="true" CommandName="ShowSP"
                                        AlternateText="ShowSP" ImageUrl="~/ViettoolEng/images/giohang.gif" >
                                    </asp:ImageButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <tr>
                                        <td colspan="100%">
                                            <div id="div<%# Eval("STT") %>" 
                                                    style="display:block;position:relative;left:15px;overflow:auto;width:97%">
                                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                                                    HorizontalAlign="Center" DataKeyNames="NEWS_ID"
                                                    DataSource='<%# BindGrandChild((int)DataBinder.Eval(Container.DataItem, "NEWS_ID")).Tables[0] %>'
                                                    Width="800px" ShowHeader="false" OnRowDeleting="GridView1_RowDeleting"
                                                    OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                                                    BackColor="White" GridLines="Horizontal"
                                                    CaptionAlign="Left" onrowcommand="GridView1_RowCommand" onrowdatabound="GridView1_RowDataBound">
                                                    <Columns>
                                                        <asp:BoundField DataField="TIEUDE" HeaderText="T&#234;n Menu Con" SortExpression="TIEUDE">
                                                            <ItemStyle Width="307px" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="NEWS_ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                                            SortExpression="NEWS_ID">
                                                            <ItemStyle Width="43px" />
                                                        </asp:BoundField>
                                                        <asp:BoundField Visible="true" ItemStyle-Font-Size="0pt" ItemStyle-Width="0px" HeaderText="CHANNEL_ID" DataField="CHANNEL_ID" />
                                                        <asp:BoundField DataField="STT" HeaderText="STT" SortExpression="STT">
                                                            <ItemStyle Width="35px" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="USERID" HeaderText="USER" SortExpression="USERID">
                                                            <ItemStyle Width="100px" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="NGAY" ItemStyle-Width="104px" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Ng&#224;y" SortExpression="NGAY" />
                                                        <asp:BoundField DataField="CAP_ID" HeaderText="CAP_ID" ItemStyle-Font-Size="0pt" ItemStyle-Width="0px" />
                                                         <asp:CommandField SelectText="Sửa" ShowSelectButton="True" ButtonType="Image" SelectImageUrl="~/ViettoolEng/images/icon_pencil.gif" />
                                                        <asp:TemplateField ShowHeader="False">
                                                            <ItemTemplate>
                                                                <asp:ImageButton  ID="LinkButton2" runat="server" CausesValidation="true" CommandName="Delete"
                                                                   OnClientClick="return (confirm ('Bạn Có Chắc Xóa Không ???'))" AlternateText="Xóa" ImageUrl="~/ViettoolEng/images/icon_trashcan.gif" ></asp:ImageButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ShowHeader="false">
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="lbtnShowSP" runat="server" CausesValidation="true" CommandName="ShowSP"
                                                                    AlternateText="ShowSP" ImageUrl="~/ViettoolEng/images/giohang.gif" >
                                                                </asp:ImageButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <%--<HeaderStyle BackColor="PaleGoldenrod" />--%>
                                                </asp:GridView>
                                            </div>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle BackColor="YellowGreen" />
                        <SelectedRowStyle BackColor="Cyan" />
                        <PagerStyle BackColor="#8080FF" />
                    </asp:GridView>
                <br />
            </asp:Panel>
        </ItemTemplate>
    </asp:DataList>
    <br />
    <br />
</center>
</asp:Content>

