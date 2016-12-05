<%@ Page Title="Welcome" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" 
    CodeBehind="Default.aspx.cs" Inherits="BreweryBucketList._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1>Welcome to Brewery Bucket List!</h1>
        <a runat="server" href="~/">
            <asp:Image ID="Logo" runat="server" ImageUrl="~/Images/logo.jpg" Height=100% Width=100% BorderStyle="None" />
        </a>
        <h3>The website is a member based application set up for users to record their visits to the craft breweries of Pennsylvania.</h3>
    </div>
</asp:Content>
