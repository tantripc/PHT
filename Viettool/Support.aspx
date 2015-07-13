<%@ Page Title="" Language="C#" MasterPageFile="~/Viettool/MasterPage.master" AutoEventWireup="true" CodeFile="Support.aspx.cs" Inherits="Viettool_Support" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script language="javascript" type="text/javascript">
        function openEdit1() {
            var openDV = document.getElementById("editZone1");
            var closeDV = document.getElementById("linkToEdit1");
            openDV.style.display = "block";
            closeDV.style.display = "none";
        }
        function closeEdit1() {
            var openDV = document.getElementById("linkToEdit1");
            var closeDV = document.getElementById("editZone1");
            openDV.style.display = "block";
            closeDV.style.display = "none";
        }

        function openEdit2() {
            var openDV = document.getElementById("editZone2");
            var closeDV = document.getElementById("linkToEdit2");
            openDV.style.display = "block";
            closeDV.style.display = "none";
        }
        function closeEdit2() {
            var openDV = document.getElementById("linkToEdit2");
            var closeDV = document.getElementById("editZone2");
            openDV.style.display = "block";
            closeDV.style.display = "none";
        }

        function openEdit3() {
            var openDV = document.getElementById("editZone3");
            var closeDV = document.getElementById("linkToEdit3");
            openDV.style.display = "block";
            closeDV.style.display = "none";
        }
        function closeEdit3() {
            var openDV = document.getElementById("linkToEdit3");
            var closeDV = document.getElementById("editZone3");
            openDV.style.display = "block";
            closeDV.style.display = "none";
        }
    </script>
    <div style="float:left;width:890px;min-height:1px">
        <div style="clear:both;height:20px;font-size:0px"></div>
        <div style="margin-left:auto;margin-right:auto;width:650px;min-height:1px">
            <span style="color:#005AAA" class="labelBold midText">Sale 1</span>
            <div style="clear:both;height:10px;font-size:0px"></div>
            <div id="linkToEdit1" style="float:left;width:650px;min-height:1px;display:block;height:21px;line-height:21px">
                <div style="float:left;min-height:1px">
                    <span class="midText labelBold">Current phone: </span>
                    <asp:Label ID="lblCurrentPhone1" CssClass="midText" runat="server" Text=""></asp:Label>
                </div>
                <div style="float:left;width:20px;min-height:1px"></div>
                <div style="float:left;min-height:1px">
                    <span class="midText labelBold">Current IM: </span>
                    <asp:Label ID="lblCurrentIM1" CssClass="midText" runat="server" Text=""></asp:Label>
                </div>
                <div style="float:left;width:20px;min-height:1px"></div>
                <div style="float:left;min-height:1px">
                    <asp:LinkButton ID="lbtnToEdit1" CssClass="singleLink_Green" runat="server"
                        OnClientClick="openEdit1();return false;">Edit</asp:LinkButton>
                </div>
            </div>
            <div id="editZone1" style="float:left;width:650px;min-height:1px;display:none;height:21px;line-height:21px">
                <span class="labelBold midText">Phone: </span>
                <asp:TextBox ID="txtPhone1" autocomplete="off" CssClass="midText" Width="180px" runat="server"></asp:TextBox> 
                <span class="labelBold midText">IM: </span>
                <asp:TextBox ID="txtIM1" autocomplete="off" CssClass="midText" Width="180px" runat="server"></asp:TextBox> 
                <asp:Button ID="btnEdit1" CssClass="midText" Width="70px" runat="server" 
                    Text="Edit" onclick="btnEdit1_Click" />
                <asp:Button ID="btnCloseEdit1" CssClass="midText" Width="70px" runat="server" Text="Close"
                    OnClientClick="closeEdit1();return false;" />
            </div>
            <div style="clear:both;height:20px;font-size:0px"></div>
            <span style="color:#005AAA" class="labelBold midText">Sale 2</span>
            <div style="clear:both;height:10px;font-size:0px"></div>
            <div id="linkToEdit2" style="float:left;width:650px;min-height:1px;display:block;height:21px;line-height:21px">
                <div style="float:left;min-height:1px">
                    <span class="midText labelBold">Current phone: </span>
                    <asp:Label ID="lblCurrentPhone2" CssClass="midText" runat="server" Text=""></asp:Label>
                </div>
                <div style="float:left;width:20px;min-height:1px"></div>
                <div style="float:left;min-height:1px">
                    <span class="midText labelBold">Current IM: </span>
                    <asp:Label ID="lblCurrentIM2" CssClass="midText" runat="server" Text=""></asp:Label>
                </div>
                <div style="float:left;width:20px;min-height:1px"></div>
                <div style="float:left;min-height:1px">
                    <asp:LinkButton ID="lbtnToEdit2" CssClass="singleLink_Green" runat="server"
                        OnClientClick="openEdit2();return false;">Edit</asp:LinkButton>
                </div>
            </div>
            <div id="editZone2" style="float:left;width:650px;min-height:1px;display:none;height:21px;line-height:21px">
                <span class="labelBold midText">Phone: </span>
                <asp:TextBox ID="txtPhone2" autocomplete="off" CssClass="midText" Width="180px" runat="server"></asp:TextBox> 
                <span class="labelBold midText">IM: </span>
                <asp:TextBox ID="txtIM2" autocomplete="off" CssClass="midText" Width="180px" runat="server"></asp:TextBox> 
                <asp:Button ID="btnEdit2" CssClass="midText" Width="70px" runat="server" 
                    Text="Edit" onclick="btnEdit2_Click" />
                <asp:Button ID="btnCloseEdit2" CssClass="midText" Width="70px" runat="server" Text="Close"
                    OnClientClick="closeEdit2();return false;" />
            </div>
            <div style="clear:both;height:20px;font-size:0px"></div>
            <span style="color:#005AAA" class="labelBold midText">Sale 3</span>
            <div style="clear:both;height:10px;font-size:0px"></div>
            <div id="linkToEdit3" style="float:left;width:650px;min-height:1px;display:block;height:21px;line-height:21px">
                <div style="float:left;min-height:1px">
                    <span class="midText labelBold">Current phone: </span>
                    <asp:Label ID="lblCurrentPhone3" CssClass="midText" runat="server" Text=""></asp:Label>
                </div>
                <div style="float:left;width:20px;min-height:1px"></div>
                <div style="float:left;min-height:1px">
                    <span class="midText labelBold">Current IM: </span>
                    <asp:Label ID="lblCurrentIM3" CssClass="midText" runat="server" Text=""></asp:Label>
                </div>
                <div style="float:left;width:20px;min-height:1px"></div>
                <div style="float:left;min-height:1px">
                    <asp:LinkButton ID="lbtnToEdit3" CssClass="singleLink_Green" runat="server"
                        OnClientClick="openEdit3();return false;">Edit</asp:LinkButton>
                </div>
            </div>
            <div id="editZone3" style="float:left;width:650px;min-height:1px;display:none;height:21px;line-height:21px">
                <span class="labelBold midText">Phone: </span>
                <asp:TextBox ID="txtPhone3" autocomplete="off" CssClass="midText" Width="180px" runat="server"></asp:TextBox> 
                <span class="labelBold midText">IM: </span>
                <asp:TextBox ID="txtIM3" autocomplete="off" CssClass="midText" Width="180px" runat="server"></asp:TextBox> 
                <asp:Button ID="btnEdit3" CssClass="midText" Width="70px" runat="server" 
                    Text="Edit" onclick="btnEdit3_Click" />
                <asp:Button ID="btnCloseEdit3" CssClass="midText" Width="70px" runat="server" Text="Close"
                    OnClientClick="closeEdit3();return false;" />
            </div>
            <div id="errorDV" runat="server" visible="false">
                <div style="clear:both;height:20px;font-size:0px"></div>
                <asp:Label ID="lblErrorMessage" CssClass="errorMessage" runat="server" Text=""></asp:Label>
            </div>
        </div>
        <div style="clear:both;height:40px;font-size:0px"></div>
    </div>
</asp:Content>