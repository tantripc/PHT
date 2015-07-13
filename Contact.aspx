<%@ Page Title="" Language="C#" MasterPageFile="~/MainView.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="clear:both;height:15px;font-size:0px"></div>
    <div style="float:left;width:22px;min-height:1px"></div>
    <div style="float:left;width:572px;min-height:1px">
        <div style="float:left;width:312px;min-height:1px" class="contactTopLeftText">
            Bạn có thể đặt câu hỏi và góp ý tại đây.
        </div>
        <div style="float:left;width:260px;min-height:1px;text-align:right" class="contactTopRightText">
            * những chỗ bắt buộc phải nhập
        </div>
        <div style="clear:both;height:20px;font-size:0px"></div>
        <div style="margin-left:auto;margin-right:auto;width:485px;min-height:1px">
            <asp:Panel ID="pnlContact" runat="server" DefaultButton="btnSend">
                <div style="float:left;width:150px;min-height:1px;text-align:right" class="contactLabel">
                    Họ và tên:
                </div>
                <div style="float:left;width:15px;min-height:1px"></div>
                <div style="float:left;width:320px;min-height:1px">
                    <asp:TextBox ID="txtName" CssClass="contactText" Width="300px" runat="server"></asp:TextBox>
                    <a class="contactMark">*</a>
                    <div style="clear:both"></div>
                    <asp:RequiredFieldValidator ID="requireName" runat="server" CssClass="contactErrorMessage" ForeColor="Yellow"
                        ControlToValidate="txtName" Display="Dynamic" ErrorMessage="Tên không được để trống!"></asp:RequiredFieldValidator>
                </div>
                <div style="clear:both;height:10px;font-size:0px"></div>
                <div style="float:left;width:150px;min-height:1px;text-align:right" class="contactLabel">
                    Email:
                </div>
                <div style="float:left;width:15px;min-height:1px"></div>
                <div style="float:left;width:320px;min-height:1px">
                    <asp:TextBox ID="txtEmail" CssClass="contactText" Width="300px" runat="server"></asp:TextBox>
                    <a class="contactMark">*</a>
                    <div style="clear:both"></div>
                    <asp:RequiredFieldValidator ID="requireEmail" runat="server" CssClass="contactErrorMessage" ForeColor="Yellow"
                        ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email không được để trống!"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regularEmail" ControlToValidate="txtEmail"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        runat="server" Display="Dynamic" CssClass="contactErrorMessage" ForeColor="Yellow"
                        ErrorMessage="Email không hợp lệ!"></asp:RegularExpressionValidator>
                </div>
                <div style="clear:both;height:10px;font-size:0px"></div>
                <div style="float:left;width:150px;min-height:1px;text-align:right" class="contactLabel">
                    Tiêu đề:
                </div>
                <div style="float:left;width:15px;min-height:1px"></div>
                <div style="float:left;width:320px;min-height:1px">
                    <asp:TextBox ID="txtSubject" CssClass="contactText" Width="300px" runat="server"></asp:TextBox>
                    <a class="contactMark">*</a>
                    <div style="clear:both"></div>
                    <asp:RequiredFieldValidator ID="requireSubject" runat="server" CssClass="contactErrorMessage" ForeColor="Yellow"
                        ControlToValidate="txtSubject" Display="Dynamic" ErrorMessage="Tiêu đề không được để trống!"></asp:RequiredFieldValidator>
                </div>
                <div style="clear:both;height:10px;font-size:0px"></div>
                <div style="float:left;width:150px;min-height:1px;text-align:right" class="contactLabel">
                    Nội dung:
                </div>
                <div style="float:left;width:15px;min-height:1px"></div>
                <div style="float:left;width:320px;min-height:1px">
                    <div style="float:left;width:310px;min-height:1px">
                        <asp:TextBox ID="txtMessage" TextMode="MultiLine" Height="90px" CssClass="contactText" Width="300px" runat="server"></asp:TextBox>
                    </div>
                    <div style="float:left;width:10px;min-height:1px">
                        <a class="contactMark">*</a>
                    </div>
                    <div style="clear:both"></div>
                    <asp:RequiredFieldValidator ID="requireMessage" runat="server" CssClass="contactErrorMessage" ForeColor="Yellow"
                        ControlToValidate="txtMessage" Display="Dynamic" ErrorMessage="Nội dung không được để trống!"></asp:RequiredFieldValidator>
                </div>
                <div style="clear:both;height:15px;font-size:0px"></div>
                <div style="float:left;width:165px;min-height:1px"></div>
                <div style="float:left;width:320px;min-height:1px">
                    <asp:Button ID="btnSend" Width="80px" CssClass="midText" runat="server" Text="Gửi"
                        onclick="btnSend_Click" />
                    <input id="btnReset" type="reset" style="width:80px;margin-left:20px" class="midText" value="Huỷ" />
                </div>
            </asp:Panel>
            <div id="contactErrorDV" runat="server" style="float:left;width:485px;min-height:1px" visible="false">
                <div style="clear:both;height:10px;font-size:0px"></div>
                <asp:Label ID="lblContactErrorMessage" CssClass="contactErrorMessage" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>
    <div style="clear:both;height:15px;font-size:0px"></div>
</asp:Content>