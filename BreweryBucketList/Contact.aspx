<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="BreweryBucketList.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
  
      <h2><%: Title %></h2>
    
    <h4>Contact Form</h4>
    <br />
    <table>
        <!-- Name -->
        <tr>
            <td>Name:</td>
            <td>
                <asp:TextBox ID="txtSenderName"
                    runat="server"
                    Columns="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtSenderName" 
                    ErrorMessage="Name is required" CssClass="warning">*</asp:RequiredFieldValidator>
            </td>
        </tr>
          <!-- Sender's email message-->
        <tr>
            <td>Your email address:</td>
            <td>
                <asp:TextBox ID="txtSenderEmail"
                    runat="server"
                    Columns="50"></asp:TextBox>
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtSenderEmail" 
                    ErrorMessage="Valid email is required" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="warning">*</asp:RegularExpressionValidator>
            </td>
        </tr>

        <!-- Subject -->
        <tr>
            <td>Subject:
            </td>
            <td>
                <asp:DropDownList ID="ddlSubject" runat="server" AppendDataBoundItems="True">
                    <asp:ListItem Value="-Select-">-Select-</asp:ListItem>
                    <asp:ListItem>Ask a question</asp:ListItem>
                    <asp:ListItem>Report a bug</asp:ListItem>
                    <asp:ListItem>Customer support ticket</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>

        <!-- Message -->
        <tr>
            <td>Message:
            </td>
            <td>
                <asp:TextBox ID="txtMessage"
                    runat="server"
                    Columns="40"
                    Rows="6"
                    TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvTextMessage" runat="server" ControlToValidate="txtMessage" 
                    ErrorMessage="Message is required" CssClass="warning">*</asp:RequiredFieldValidator>
            </td>
        </tr>

        <!-- Submit -->
        <tr>
            <td colspan="2">
                <asp:Button ID="btnSubmit" runat="server"
                    OnClick="btnSubmit_Click"
                    Text="Submit" />
            </td>
        </tr>

        <!-- Results -->
        <tr>
            <td colspan="2">
                <asp:Label ID="lblResult" runat="server" Font-Names="Arial" Height="25px" Width="200px"></asp:Label>
            </td>
        </tr>
    </table>




</asp:Content>
