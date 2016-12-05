<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditDatabase.aspx.cs" Inherits="BreweryBucketList.Admin.EditDatabase" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <asp:GridView ID="grvEditDatabase" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="BreweryID" 
        DataSourceID="dsEditDatabase" Width="100%" >
        <Columns>
            <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
            <asp:BoundField DataField="BreweryID" HeaderText="BreweryID" InsertVisible="False" ReadOnly="True" SortExpression="BreweryID" />
            <asp:BoundField DataField="BreweryName" HeaderText="BreweryName" SortExpression="BreweryName" />
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
            <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" />
            <asp:BoundField DataField="CountyID" HeaderText="CountyID" SortExpression="CountyID" />
            <asp:BoundField DataField="Website" HeaderText="Website" SortExpression="Website" />
        </Columns>
</asp:GridView>

<br />
<asp:SqlDataSource ID="dsEditDatabase" runat="server" ConnectionString="<%$ ConnectionStrings:BreweryBucketListConnectionString %>" SelectCommand="SELECT * FROM [Brewery]"></asp:SqlDataSource>

</asp:Content>
