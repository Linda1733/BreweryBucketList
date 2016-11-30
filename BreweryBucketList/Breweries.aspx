<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Breweries.aspx.cs" Inherits="BreweryBucketList.Breweries" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%--<asp:GridView ID="grdCounties" runat="server"
        ItemType="BreweryBucketList.Brewery" CssClass="table-bordered table-condensed" DataKeyNames="BreweryID"
        AutoGenerateColumns="false">
        <Columns>            
            <asp:DynamicField DataField="BreweryID" />
            <asp:DynamicField DataField="BreweryName" />
        </Columns>
    </asp:GridView>--%>
    <br />
   
    <br />
    <br />
    <asp:Label ID="lblCounties" runat="server" Text="Label">Please Choose a County:</asp:Label>
    <asp:DropDownList ID="ddlCounties" runat="server" DataSourceID="dsCounties" DataTextField="CountyName" AutoPostBack="True">
    </asp:DropDownList>      
    <asp:SqlDataSource ID="dsCounties" runat="server" ConnectionString="<%$ ConnectionStrings:BreweryBucketListConnectionString %>" SelectCommand="SELECT [CountyName] FROM [County]"></asp:SqlDataSource>
     <br />
    <br />
    
    <asp:DataList ID="dlBreweries" runat="server" DataSourceID="dsBreweries" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" >  
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <ItemTemplate>
            BreweryName:
            <asp:Label ID="BreweryNameLabel" runat="server" Text='<%# Eval("BreweryName") %>' />
            <br />
            Address:
            <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
            <br />
            City:
            <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
            <br />
            CountyName:
            <asp:Label ID="CountyNameLabel" runat="server" Text='<%# Eval("CountyName") %>' />
            <br />
            Website:
            <asp:Label ID="WebsiteLabel" runat="server" Text='<%# Eval("Website") %>' />
<br />
            <br />
        </ItemTemplate>
        <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
    </asp:DataList>

    
    <asp:SqlDataSource ID="dsBreweries" runat="server" ConnectionString="<%$ ConnectionStrings:BreweryBucketListConnectionString %>" SelectCommand="SELECT Brewery.BreweryName, Brewery.Address, Brewery.City, County.CountyName, Brewery.Website FROM Brewery INNER JOIN County ON Brewery.CountyID = County.CountyID">
        <FilterParameters>
            <asp:ControlParameter ControlID="ddlCounties" Name="CountyID" PropertyName="SelectedValue" Type="String"  />
        </FilterParameters>       
    </asp:SqlDataSource>

    
    <br />
    
</asp:Content>
