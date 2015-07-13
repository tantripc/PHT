<%@ Page Title="" Language="C#" MasterPageFile="~/Viettool/MasterPage.master" AutoEventWireup="true" CodeFile="Websites.aspx.cs" Inherits="Viettool_Websites" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="float:left;width:890px;min-height:1px">
        <div style="clear:both;height:20px;font-size:0px"></div>
        <div style="margin-left:auto;margin-right:auto;width:780px;min-height:1px">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvWebsites" runat="server" Width="780px" CssClass="midText"
                        AllowPaging="true" PageSize="20" onpageindexchanging="gvWebsites_PageIndexChanging"
                        AutoGenerateColumns="False" EnableModelValidation="True" BackColor="White" 
                        BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                        GridLines="None" onrowcancelingedit="gvWebsites_RowCancelingEdit" 
                        onrowdeleting="gvWebsites_RowDeleting" 
                        onrowediting="gvWebsites_RowEditing" 
                        onrowupdating="gvWebsites_RowUpdating">
                        <AlternatingRowStyle BackColor="#F7F7F7" />
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
                                ItemStyle-Width="50px" HeaderStyle-HorizontalAlign="Center" 
                                ItemStyle-HorizontalAlign="Right" >
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Tiêu đề">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtTiUp" autocomplete="off" runat="server" CssClass="midText" Width="290px" Text='<%# Bind("TITLE") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblTi" runat="server" Text='<%# Bind("TITLE") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" Width="300px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Đường dẫn">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtLiUp" autocomplete="off" runat="server" CssClass="midText" Width="290px" Text='<%# Bind("LINK") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblLi" runat="server" Text='<%# Bind("LINK") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" Width="300px" />
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="lbtnUpdate" runat="server" CausesValidation="True" 
                                        CommandName="Update" Text="Sửa" CssClass="gridCommandLink"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="lbtnCancel" runat="server" CausesValidation="False" 
                                        CommandName="Cancel" Text="Huỷ" CssClass="gridCommandLink"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnEdit" runat="server" CausesValidation="False" 
                                        CommandName="Edit" Text="Cập nhật" CssClass="gridCommandLink"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="lbtnDelete" runat="server" CausesValidation="False" 
                                        CommandName="Delete" Text="Xoá" OnClientClick="return (confirm('Bạn có chắc chắn ?'))"
                                        CssClass="gridCommandLink"></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="110px" />
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            Tạm thời chúng tôi chưa có website nào.
                        </EmptyDataTemplate>
                        <EmptyDataRowStyle CssClass="childDIVText" />
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    </asp:GridView>
                    <div style="clear:both;height:5px;font-size:0px"></div>
                    <div style="float:left;width:780px;min-height:1px">
                        <div style="float:left;width:57px;min-height:1px"></div>
                        <div style="float:left;width:305px;min-height:1px">
                            <asp:TextBox ID="txtTiAdd" autocomplete="off" CssClass="midText" Width="290px" runat="server"></asp:TextBox>
                            <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" TargetControlID="txtTiAdd"
                                runat="server" WatermarkText="Tiêu đề" WatermarkCssClass="childDIVText">
                            </cc1:TextBoxWatermarkExtender>
                        </div>
                        <div style="float:left;width:300px;min-height:1px;text-align:right">
                            <asp:TextBox ID="txtLiAdd" autocomplete="off" CssClass="midText" Width="290px" runat="server"></asp:TextBox>
                            <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" TargetControlID="txtLiAdd"
                                runat="server" WatermarkText="Đường dẫn" WatermarkCssClass="childDIVText">
                            </cc1:TextBoxWatermarkExtender>
                        </div>
                        <div style="float:left;width:118px;min-height:1px;text-align:center">
                            <asp:Button ID="btnAddSite" CssClass="midText" Width="90px" runat="server" 
                                Text="Thêm site" onclick="btnAddSite_Click" />
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                <ContentTemplate>
                    <div id="errorDV" runat="server" visible="false">
                        <div style="clear:both;height:10px;font-size:0px"></div>
                        <asp:Label ID="lblErrorMessage" CssClass="errorMessage" runat="server" Text=""></asp:Label>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="gvWebsites" EventName="RowUpdating" />
                    <asp:AsyncPostBackTrigger ControlID="gvWebsites" EventName="RowDeleting" />
                    <asp:AsyncPostBackTrigger ControlID="btnAddSite" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
        <div style="clear:both;height:10px;font-size:0px"></div>
    </div>
</asp:Content>