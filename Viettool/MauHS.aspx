<%@ Page Title="" Language="C#" MasterPageFile="~/Viettool/MasterPage.master" AutoEventWireup="true" CodeFile="MauHS.aspx.cs" Inherits="Viettool_MauHS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script src="../Scripts/jquery.MultiFile.js" type="text/javascript"></script>
    <div style="float:left;width:890px;min-height:1px">
        <div style="clear:both;height:50px;font-size:0px"></div>
        <div style="float:left;width:270px;min-height:1px"></div>
        <div style="float:left;width:400px;min-height:1px">
            <div style="float:left;width:400px;min-height:1px;font-weight:bold" class="allText">Upload mẫu hồ sơ</div>
            <div style="clear:both;height:5px;font-size:0px"></div>
            <div style="float:left;width:400px;line-height:1px;height:1px;border-bottom:solid 1px black"></div>
            <div style="clear:both;height:5px;font-size:0px"></div>
            <div style="float:left;width:400px;min-height:1px">
                <div style="float:left;width:150px;min-height:1px" class="allText">Chọn file</div>
                <div style="float:left;width:250px;min-height:1px;text-align:right">
                    <asp:FileUpload ID="FileUpload1" runat="server" class="multi" /> 
                </div>
            </div>
            <div style="clear:both;height:10px;font-size:0px"></div>
            <div style="margin-left:auto;margin-right:auto;width:400px;min-height:1px;text-align:right">
                <asp:Button ID="btnUpload" runat="server" Text="Upload All" Width="80px" CssClass="allText" 
                    onclick="btnUpload_Click" />
            </div>
            <div id="succeed" runat="server" style="margin-left:auto;margin-right:auto;width:400px;min-height:1px" visible="false">
                <div style="clear:both;height:20px;font-size:0px"></div>
                <asp:Label ID="lblSucceed" CssClass="smallText" runat="server" Text=""></asp:Label>
            </div>
            <div id="errMSS" runat="server" style="margin-left:auto;margin-right:auto;width:400px;min-height:1px" visible="false">
                <div style="clear:both;height:20px;font-size:0px"></div>
                <asp:Label ID="lblMessage" CssClass="smallText" ForeColor="Red" runat="server" Text=""></asp:Label>
            </div>
            <div style="clear:both;height:5px;font-size:0px"></div>
            <div style="float:left;width:400px;height:1px;border-bottom:solid 1px black"></div>
            <div style="clear:both;height:5px;font-size:0px"></div>
            <div style="float:left;width:400px;min-height:1px">
                <asp:ListView ID="lvFiles" runat="server" GroupItemCount="1"
                    onitemcommand="lvFiles_ItemCommand">
                    <LayoutTemplate>
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <table border="0" cellpadding="0" cellspacing="0">
                                        <asp:PlaceHolder runat="server" ID="groupPlaceHolder"></asp:PlaceHolder>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <td valign="top" style="float:left">
                            <div style="float:left;width:400px;min-height:1px">
                                <div style="float:left;width:300px;min-height:1px" class="smallText">
                                    <%# Eval("Name") %>
                                </div>
                                <div style="float:left;width:100px;min-height:1px">
                                    <asp:LinkButton ID="lbtnDelete" OnClientClick="return (confirm('Are you sure?'))" runat="server" CommandName="DeleteOld">Delete</asp:LinkButton>
                                </div>
                            </div>
                            <div style="clear:both"></div>
                        </td>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <a class="smallText">Chưa có mẫu hồ sơ nào.</a>
                    </EmptyDataTemplate>
                    <GroupTemplate>
                        <tr>
                            <asp:PlaceHolder runat="server" ID="itemPlaceHolder"></asp:PlaceHolder>
                        </tr>
                    </GroupTemplate>
                    <GroupSeparatorTemplate>
                        <tr>
                            <td colspan="2">
                                <div style="clear:both;height:2px;font-size:0px"></div>
                                <div style="float:left;width:400px;height:1px;border-bottom:solid 1px black"></div>
                                <div style="clear:both;height:2px;font-size:0px"></div>
                            </td>
                        </tr>
                    </GroupSeparatorTemplate>
                </asp:ListView>
            </div>
        </div>
        <div style="clear:both;height:20px;font-size:0px"></div>
    </div>
</asp:Content>