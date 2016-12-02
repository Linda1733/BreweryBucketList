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
    <asp:DropDownList ID="ddlCounties" runat="server" DataSourceID="dsCounties" DataTextField="CountyName" AutoPostBack="True" DataValueField="CountyID" AppendDataBoundItems="True" >
        <asp:ListItem Value="0">-Select County-</asp:ListItem>
    </asp:DropDownList>      
    <asp:SqlDataSource ID="dsCounties" runat="server" ConnectionString="<%$ ConnectionStrings:BreweryBucketListConnectionString %>" SelectCommand="SELECT [CountyID], [CountyName] FROM [County]"></asp:SqlDataSource>
     <br />
    <asp:Label ID="lblResults" runat="server" BorderColor="#003366" BorderStyle="Solid" Text="Label"></asp:Label>
    <br />
    
    
    
    <asp:DataList ID="dlBreweries" runat="server" DataSourceID="dsBreweries" 
        Font-Bold="False" Font-Italic="False" Font-Names="Garamond" Font-Overline="False" Font-Size="Large" 
        Font-Strikeout="False" Font-Underline="False" RepeatColumns="2" RepeatDirection="Horizontal" BackColor="White" 
        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="5px" GridLines="Horizontal" CellSpacing="20" CellPadding="20" >  
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <FooterTemplate>
        <strong>Brewery Bucket List</strong>
        </FooterTemplate>
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <HeaderTemplate>
            List of Breweries<br />
        </HeaderTemplate>
        <ItemStyle ForeColor="#000066" />
        <ItemTemplate>
            <asp:CheckBoxList ID="cblBrewerySelection" runat="server" BorderColor="Gray" DataSourceID="dsBreweryUserPage" DataTextField="BreweryName" DataValueField="BreweryID" Height="16px" RepeatColumns="1" Width="100px">
            </asp:CheckBoxList>
            BreweryName:
            <asp:Label ID="BreweryNameLabel" runat="server" Text='<%# Eval("BreweryName") %>' />
            <br />
            <%--<asp:CheckBox ID="chkBreweryName" runat="server" />--%>
            &nbsp;<asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
            <br />
            City:
            <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' /> 
            <br />
            State: <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' />
            <br />
            Zip:
            <asp:Label ID="ZipLabel" runat="server" Text='<%# Eval("Zip") %>' />
            <br />
            Website:
            <asp:Label ID="WebsiteLabel" runat="server" Text='<%# Eval("Website") %>' />
            <br />
            <br />
        </ItemTemplate>
        <SelectedItemStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
    </asp:DataList>

    
    <asp:SqlDataSource ID="dsBreweries" runat="server" ConnectionString="<%$ ConnectionStrings:BreweryBucketListConnectionString %>" 
        SelectCommand="SELECT BreweryName, Address, City, State, Zip, Website FROM Brewery WHERE (CountyID = @CountyID)">
        <FilterParameters>
            <asp:ControlParameter ControlID="ddlCounties" Name="CountyID" PropertyName="SelectedValue" Type="String"  />
        </FilterParameters>       
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlCounties" Name="CountyID" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    
    <br />
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" Width="100px" OnClick="btnSubmit_Click1" />
    <br />
    <br />
    
    <asp:CheckBoxList ID="cblBrewerySelection" runat="server" DataSourceID="dsBreweryUserPage" DataTextField="BreweryName" DataValueField="BreweryID" 
        CellPadding="50" CellSpacing="50" Height="16px" RepeatColumns="1" Width="100px" BorderColor="Gray">

    </asp:CheckBoxList>
    <asp:SqlDataSource ID="dsBreweryUserPage" runat="server" ConnectionString="<%$ ConnectionStrings:BreweryBucketListConnectionString %>" 
        SelectCommand="SELECT Brewery.*, County.CountyName FROM Brewery INNER JOIN County ON Brewery.CountyID = County.CountyID"></asp:SqlDataSource>
    <br />

    
    <br />
    
</asp:Content>
