<%@ Page Title="" Language="C#" MasterPageFile="~/ViettoolEng/MasterPage.master" AutoEventWireup="true" CodeFile="QuanTriUsers.aspx.cs" Inherits="ViettoolEng_QuanTriUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="clear:both;height:10px;font-size:0px"></div>
    <div style="margin-left:auto;margin-right:auto;width:870px;min-height:1px;background:aliceblue">
        <div style="clear:both;height:10px;font-size:0px"></div>
        <div style="margin-left:auto;margin-right:auto;width:850px;min-height:1px">
            <div style="float:left;width:850px;min-height:1px" class="viettoolAccountTopTitle">QUẢN TRỊ THÀNH VIÊN</div>
            <div style="clear:both;height:10px;font-size:0px"></div>
            <div style="float:left;width:500px;min-height:1px">
                <asp:LinkButton ID="lbtnDelete" CssClass="viettoolAccountTopLink" runat="server" 
                    OnClientClick="return (confirm ('Bạn có chắc chắn xoá user(s) đã chọn?'))"
                    onclick="lbtnDelete_Click">Xoá</asp:LinkButton>
                <a class="viettoolAccountSplit" style="margin-left:2px;margin-right:2px">|</a>
                <asp:LinkButton ID="lbtnLock" CssClass="viettoolAccountTopLink" runat="server"
                    onclick="lbtnLock_Click">Khoá tài khoản</asp:LinkButton>
                <a class="viettoolAccountSplit" style="margin-left:2px;margin-right:2px">|</a>
                <asp:LinkButton ID="lbtnUnLock" CssClass="viettoolAccountTopLink" runat="server"
                    onclick="lbtnUnLock_Click">Mở khoá tài khoản</asp:LinkButton>
                <a class="viettoolAccountSplit" style="margin-left:2px;margin-right:2px">|</a>
                <asp:LinkButton ID="lbtnDoVIP" CssClass="viettoolAccountTopLink" runat="server"
                    onclick="lbtnDoVIP_Click">Kích hoạt VIP</asp:LinkButton>
                <a class="viettoolAccountSplit" style="margin-left:2px;margin-right:2px">|</a>
                <asp:LinkButton ID="lbtnDoNoVIP" CssClass="viettoolAccountTopLink" runat="server"
                    onclick="lbtnDoNoVIP_Click">Tắt kích hoạt VIP</asp:LinkButton>
            </div>
            <div style="float:left;width:350px;min-height:1px;text-align:right">
                <asp:LinkButton ID="lbtnLocked" CssClass="viettoolAccountTopLink" runat="server"
                    onclick="lbtnLocked_Click">Đã khoá</asp:LinkButton>
                <a class="viettoolAccountSplit" style="margin-left:2px;margin-right:2px">|</a>
                <asp:LinkButton ID="lbtnVIP" CssClass="viettoolAccountTopLink" runat="server"
                    onclick="lbtnVIP_Click">VIP</asp:LinkButton>
                <a class="viettoolAccountSplit" style="margin-left:2px;margin-right:2px">|</a>
                <asp:LinkButton ID="lbtnNoVIP" CssClass="viettoolAccountTopLink" runat="server"
                    onclick="lbtnNoVIP_Click">No VIP</asp:LinkButton>
                <a class="viettoolAccountSplit" style="margin-left:2px;margin-right:2px">|</a>
                <asp:LinkButton ID="lbtnViewAll" CssClass="viettoolAccountTopLink" runat="server"
                    onclick="lbtnViewAll_Click">Xem tất cả</asp:LinkButton>
            </div>
            <div style="clear:both;height:10px;font-size:0px"></div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div style="float:left;width:850px;min-height:1px">
                        <asp:GridView ID="gvAccount" runat="server" AutoGenerateColumns="False" 
                            Width="850px" CssClass="viettoolAccountGridMain" GridLines="None"
                            AllowPaging="True" onpageindexchanging="gvAccount_PageIndexChanging" 
                            PageSize="20">
                            <Columns>
                                <asp:TemplateField ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="cboHead1" CssClass="smallText" runat="server" AutoPostBack="true" oncheckedchanged="cboHead1_CheckedChanged" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="cbo1" CssClass="smallText" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="idRegister" HeaderText="ID" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
                                <asp:BoundField DataField="Nickname" ItemStyle-Width="120px" HeaderText="Tên user" />
                                <asp:BoundField DataField="Name" ItemStyle-Width="150px" HeaderText="Họ tên" />
                                <asp:BoundField DataField="tel" ItemStyle-Width="110px" HeaderText="Điện thoại" />
                                <asp:BoundField DataField="email" ItemStyle-Width="200px" HeaderText="Email" />
                                <asp:BoundField DataField="dateCreate" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-Width="110px" ItemStyle-HorizontalAlign="Center" HeaderText="Ngày tạo" />
                                <asp:TemplateField ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <img width="11px" height="14px" src='<%# Eval("Lock") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <img width="21px" height="13px" src='<%# Eval("VIP") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataRowStyle HorizontalAlign="Center" />
                            <EmptyDataTemplate>
                                <a class="viettoolAccountText">Không có dữ liệu nào tồn tại thoả điều kiện.</a>
                            </EmptyDataTemplate>
                            <RowStyle CssClass="viettoolAccountGridRow" />
                            <AlternatingRowStyle CssClass="viettoolAccountGridAltRow" />
                            <PagerStyle CssClass="viettoolAccountGridPage" />
                            <HeaderStyle CssClass="viettoolAccountGridHeader" />
                        </asp:GridView>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="lbtnDelete" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="lbtnLock" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="lbtnUnLock" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="lbtnDoVIP" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="lbtnDoNoVIP" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="lbtnLocked" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="lbtnVIP" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="lbtnNoVIP" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="lbtnViewAll" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <div id="accountErrorDV" runat="server" style="float:left;width:850px;min-height:1px" visible="false">
                        <div style="clear:both;height:10px;font-size:0px"></div>
                        <asp:Label ID="lblAccountErrorMessage" CssClass="viettoolErrorMessage" runat="server" Text=""></asp:Label>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="lbtnDelete" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="lbtnLock" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="lbtnUnLock" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="lbtnDoVIP" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="lbtnDoNoVIP" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="lbtnLocked" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="lbtnVIP" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="lbtnNoVIP" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="lbtnViewAll" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
        <div style="clear:both;height:10px;font-size:0px"></div>
    </div>
    <div style="clear:both;height:20px;font-size:0px"></div>
</asp:Content>