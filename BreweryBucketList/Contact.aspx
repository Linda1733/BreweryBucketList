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
            </td>
        </tr>
          <!-- Sender's email message-->
        <tr>
            <td>Your email address:</td>
            <td>
                <asp:TextBox ID="txtSenderEmail"
                    runat="server"
                    Columns="50"></asp:TextBox>
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
                <asp:Label ID="lblResult" runat="server"></asp:Label>
            </td>
        </tr>
    </table>




</asp:Content>
