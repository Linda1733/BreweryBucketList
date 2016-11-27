<%@ Page Title="Welcome" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BreweryBucketList._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="jumbotron">
        <h1>Craft Brewery Bucket List</h1>
        <a runat="server" href="~/">
                <asp:Image ID="Logo" runat="server" ImageUrl="~/Images/logo.jpg" Height=100% Width=100% BorderStyle="None" />
            </a>
        <p class="lead">This application was created in accordance with the requirements of the Senior Research Project at Elizabethtown College.</p>
        <p><a href="http://www.LindaMull.com" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>
    
    <div class="row">
        <div class="col-md-6">
            <h2>Getting started</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-6">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>       
    </div>

</asp:Content>
