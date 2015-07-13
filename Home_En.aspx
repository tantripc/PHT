<%@ Page Title="" Language="C#" MasterPageFile="~/MainView_En.master" AutoEventWireup="true" CodeFile="Home_En.aspx.cs" Inherits="Home_En" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="float:left;width:622px;min-height:1px">
        <asp:Label ID="lblContent" runat="server" Text="" CssClass="detailContent"></asp:Label>
    </div>
    <div style="clear:both;height:15px;font-size:0px"></div>
    <div style="float:left;width:622px;min-height:1px;padding-top:8px;padding-bottom:8px" class="sitemapBlock">
        <img width="9px" height="8px" src="images/bt02.gif" style="float:left;margin-left:8px;margin-top:3px" />
        <a style="margin-left:4px" class="sitemapText">EVENTS</a>
    </div>
    <div style="clear:both;height:10px;font-size:0px"></div>
    <div style="float:left;width:622px;min-height:1px;font-size:0px">
        <asp:Repeater ID="rptEventsList" runat="server">
            <ItemTemplate>
                <div style="float:left;width:120px;min-height:1px">
                    <img width="122px" height="122px" src='images/image/<%# Eval("HINH") %>' />
                </div>
                <div style="float:left;width:10px;min-height:1px"></div>
                <div style="float:left;width:490px;min-height:1px">
                    <div style="float:left;width:490px;min-height:1px">
                        <a href='English_EventDetail_<%# Eval("NEWS_ID") %>.html' class="listTitle"><%# Eval("TENSANPHAM")%></a>
                    </div>
                    <div style="clear:both;height:5px;font-size:0px"></div>
                    <div style="float:left;width:490px;min-height:1px" class="listDate"><%# Eval("NGAY","{0:dd/MM/yyyy}")%></div>
                    <div style="clear:both;height:5px;font-size:0px"></div>
                    <div style="float:left;width:490px;min-height:1px" class="listSummary"><%# Eval("TOMTAT")%></div>
                    <div style="clear:both;height:5px;font-size:0px"></div>
                    <div style="float:left;width:490px;min-height:1px;text-align:right">
                        <a href='English_EventDetail_<%# Eval("NEWS_ID") %>.html' class="listLink">Detail &raquo;</a>
                    </div>
                </div>
            </ItemTemplate>
            <SeparatorTemplate>
                <div style="clear:both;height:4px;font-size:0px"></div>
                <div style="float:left;width:622px;height:1px;font-size:0px" class="listHorzLine1"></div>
                <div style="clear:both"></div>
                <div style="float:left;width:622px;height:1px;font-size:0px" class="listHorzLine2"></div>
                <div style="clear:both;height:4px;font-size:0px"></div>
            </SeparatorTemplate>
        </asp:Repeater>
    </div>
    <div style="clear:both;height:15px;font-size:0px"></div>
</asp:Content>