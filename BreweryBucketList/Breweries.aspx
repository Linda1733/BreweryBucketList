<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Breweries.aspx.cs" Inherits="BreweryBucketList.Breweries" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<%--    <asp:GridView ID="grdCounties" runat="server"
        ItemType="BreweryBucketList.Brewery" CssClass="table-bordered table-condensed" DataKeyNames="BreweryID"
        AutoGenerateColumns="false">
        <Columns>            
            <asp:DynamicField DataField="BreweryID" />
            <asp:DynamicField DataField="BreweryName" />
        </Columns>
    </asp:GridView>--%>
    <br />
    <asp:DropDownList ID="ddlCounties" runat="server" DataSourceID="dsCounties" DataTextField="CountyName" DataValueField="CountyName">
    </asp:DropDownList>
    <asp:SqlDataSource ID="dsCounties" runat="server" ConnectionString="<%$ ConnectionStrings:BreweryBucketListConnectionString %>" SelectCommand="SELECT [CountyName] FROM [County]"></asp:SqlDataSource>
    <br />
    <br />
    <asp:GridView ID="gvBreweries" runat="server" CssClass="table-bordered table-condensed" AutoGenerateColumns="False" 
        DataSourceID="dsBreweries" >
        <Columns>
            <asp:BoundField DataField="BreweryName" HeaderText="BreweryName" SortExpression="BreweryName" />
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="CountyName" HeaderText="CountyName" SortExpression="CountyName" />
            <asp:TemplateField HeaderText="Website Address">
                <ItemTemplate>
                    <asp:Hyperlink ID="Website" runat="server" Target="_blank" 
                    Text='<%# Eval("Website") %>' NavigateUrl='<%# Eval("Website") %>'></asp:Hyperlink>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

    </asp:GridView>
    <asp:SqlDataSource ID="dsBreweries" runat="server" ConnectionString="<%$ ConnectionStrings:BreweryBucketListConnectionString %>" 
        SelectCommand="SELECT Brewery.BreweryID, Brewery.BreweryName, Brewery.Address, Brewery.City, Brewery.State, Brewery.Zip, Brewery.Website, County.CountyName FROM Brewery INNER JOIN County ON Brewery.CountyID = County.CountyID"></asp:SqlDataSource>
    
    <br />
    <br />
    
</asp:Content>
