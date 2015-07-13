<%@ Page Title="" Language="C#" MasterPageFile="~/MainView_En.master" AutoEventWireup="true" CodeFile="Pictures_En.aspx.cs" Inherits="Pictures_En" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="Styles/paging/Style3.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="float:left;width:622px;min-height:1px">
        <asp:Repeater ID="rptPicturesList" runat="server">
            <ItemTemplate>
                <div style="float:left;width:622px;min-height:1px">
                    <img width="622px" style="height:auto" src='images/image/<%# Eval("HINH") %>' />
                </div>
            </ItemTemplate>
            <SeparatorTemplate>
                <div style="clear:both;height:10px;font-size:0px"></div>
            </SeparatorTemplate>
        </asp:Repeater>
    </div>
    <div style="clear:both;height:10px;font-size:0px"></div>
    <div style="float:left;width:622px;min-height:1px">
        <webdiyer:aspnetpager id="AspNetPager1" runat="server" 
            onpagechanged="AspNetPager1_PageChanged" PageSize="10" NumericButtonCount="10"
            Width="100%" HorizontalAlign="center" AlwaysShowFirstLastPageNumber="true" PagingButtonSpacing="10px"
            CssClass="pages" CurrentPageButtonClass="cpb">
        </webdiyer:aspnetpager>
    </div>
    <div style="clear:both;height:15px;font-size:0px"></div>
</asp:Content>