<%@ Page Title="" Language="C#" MasterPageFile="~/MainView.master" AutoEventWireup="true" CodeFile="Events.aspx.cs" Inherits="Events" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="Styles/paging/Style3.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="float:left;width:622px;min-height:1px;font-size:0px">
        <asp:Repeater ID="rptEventsList" runat="server">
            <ItemTemplate>
                <div style="float:left;width:120px;min-height:1px">
                    <img width="122px" height="122px" src='images/image/<%# Eval("HINH") %>' />
                </div>
                <div style="float:left;width:10px;min-height:1px"></div>
                <div style="float:left;width:490px;min-height:1px">
                    <div style="float:left;width:490px;min-height:1px">
                        <a href='EventDetail_<%# Eval("NEWS_ID") %>.html' class="listTitle"><%# Eval("TENSANPHAM")%></a>
                    </div>
                    <div style="clear:both;height:5px;font-size:0px"></div>
                    <div style="float:left;width:490px;min-height:1px" class="listDate"><%# Eval("NGAY","{0:dd/MM/yyyy}")%></div>
                    <div style="clear:both;height:5px;font-size:0px"></div>
                    <div style="float:left;width:490px;min-height:1px" class="listSummary"><%# Eval("TOMTAT")%></div>
                    <div style="clear:both;height:5px;font-size:0px"></div>
                    <div style="float:left;width:490px;min-height:1px;text-align:right">
                        <a href='EventDetail_<%# Eval("NEWS_ID") %>.html' class="listLink">Chi tiết &raquo;</a>
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
    <div style="clear:both;height:10px;font-size:0px"></div>
    <div style="float:left;width:622px;min-height:1px">
        <webdiyer:aspnetpager id="AspNetPager1" runat="server" 
            onpagechanged="AspNetPager1_PageChanged" PageSize="20" NumericButtonCount="10"
            Width="100%" HorizontalAlign="center" AlwaysShowFirstLastPageNumber="true" PagingButtonSpacing="10px"
            CssClass="pages" CurrentPageButtonClass="cpb">
        </webdiyer:aspnetpager>
    </div>
    <div style="clear:both;height:15px;font-size:0px"></div>
</asp:Content>