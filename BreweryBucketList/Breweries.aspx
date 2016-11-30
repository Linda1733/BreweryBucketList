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
    <asp:DropDownList ID="ddlCounties" runat="server" DataSourceID="dsCounties" DataTextField="CountyName" AutoPostBack="True" DataValueField="CountyID" >
    </asp:DropDownList>      
    <asp:SqlDataSource ID="dsCounties" runat="server" ConnectionString="<%$ ConnectionStrings:BreweryBucketListConnectionString %>" SelectCommand="SELECT [CountyID], [CountyName] FROM [County]"></asp:SqlDataSource>
     <br />
    <br />
    
    <asp:DataList ID="dlBreweries" runat="server" DataSourceID="dsBreweries" CellPadding="10" Font-Bold="False" Font-Italic="False" Font-Names="Garamond" Font-Overline="False" Font-Size="Large" Font-Strikeout="False" Font-Underline="False" RepeatColumns="2" RepeatDirection="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal" CellSpacing="20" >  
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <ItemStyle ForeColor="#000066" />
        <ItemTemplate>
            <%--<strong>Brewery Name:</strong>--%>
            <strong><asp:Label ID="BreweryNameLabel" runat="server" Text='<%# Eval("BreweryName") %>' /></strong>
            <br />
            <%--Address:--%>
            <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
            <br />
            <%--<strong>City:</strong>--%>
            <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
            <br />
            <strong>Website:</strong>
            <asp:Label ID="WebsiteLabel" runat="server" Text='<%# Eval("Website") %>' />
            <br />
            <br />
        </ItemTemplate>
        <SelectedItemStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
    </asp:DataList>

    
    <asp:SqlDataSource ID="dsBreweries" runat="server" ConnectionString="<%$ ConnectionStrings:BreweryBucketListConnectionString %>" SelectCommand="SELECT [BreweryName], [Address], [City], [Website] FROM [Brewery] WHERE ([CountyID] = @CountyID)">
        <FilterParameters>
            <asp:ControlParameter ControlID="ddlCounties" Name="CountyID" PropertyName="SelectedValue" Type="String"  />
        </FilterParameters>       
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlCounties" Name="CountyID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    
    <br />
    
</asp:Content>
