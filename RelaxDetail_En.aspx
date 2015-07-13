<%@ Page Title="" Language="C#" MasterPageFile="~/MainView_En.master" AutoEventWireup="true" CodeFile="RelaxDetail_En.aspx.cs" Inherits="TrainerDetail_En" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="float:left;width:622px;min-height:1px">
        <asp:Label ID="lblTitle" runat="server" Text="" CssClass="detailTitle"></asp:Label>
    </div>
    <div style="clear:both;height:5px;font-size:0px"></div>
    <div style="float:left;width:622px;min-height:1px">
        <asp:Label ID="lblDate" runat="server" Text="" CssClass="detailDate"></asp:Label>
    </div>
    <div style="clear:both;height:5px;font-size:0px"></div>
    <div style="float:left;width:622px;min-height:1px">
        <asp:Label ID="lblSummary" runat="server" Text="" CssClass="detailSummary"></asp:Label>
    </div>
    <div style="clear:both;height:4px;font-size:0px"></div>
    <div style="float:left;width:622px;height:1px;font-size:0px" class="detailHorzLine1"></div>
    <div style="clear:both"></div>
    <div style="float:left;width:622px;height:1px;font-size:0px" class="detailHorzLine2"></div>
    <div style="clear:both;height:4px;font-size:0px"></div>
    <div style="float:left;width:622px;min-height:1px">
        <asp:Label ID="lblContent" runat="server" Text="" CssClass="detailContent"></asp:Label>
    </div>
    <div style="clear:both;height:15px;font-size:0px"></div>
</asp:Content>