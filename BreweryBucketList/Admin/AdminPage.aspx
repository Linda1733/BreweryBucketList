<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" 
    Inherits="BreweryBucketList.Admin.AdminPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />

    <asp:GridView ID="grvBreweries" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="BreweryID" DataSourceID="dsBreweriesAdmin" PageSize="5" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
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
    <asp:SqlDataSource ID="dsBreweriesAdmin" runat="server" ConnectionString="<%$ ConnectionStrings:BreweryBucketListConnectionString %>" SelectCommand="SELECT * FROM [Brewery]"></asp:SqlDataSource>

    <div class="row">
        <div class="col-md-6">
            <h2>Admin Brewery Edit:</h2>
            <table style="width: 50%;">
                <tr>
                    <td>
                        <asp:Label ID="lblBreweryName" runat="server" Text="Brewery Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtBreweryName" runat="server" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtAddress" runat="server" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCity" runat="server" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblState" runat="server" Text="State"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtState" runat="server" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblZip" runat="server" Text="Zip"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtZip" runat="server" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblCounty" runat="server" Text="County"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="dsCounties" DataTextField="CountyName" DataValueField="CountyID">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsCounties" runat="server" ConnectionString="<%$ ConnectionStrings:BreweryBucketListConnectionString %>" SelectCommand="SELECT [CountyName], [CountyID] FROM [County]"></asp:SqlDataSource>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="lblWebsite" runat="server" Text="Website"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtWebsite" runat="server" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnAdd" runat="server" Text="Add" />
                        <asp:Button ID="btnClear" runat="server" Text="Clear" />
                    </td>
                </tr>
                
            </table>
        </div>
        <div class="col-md-6">
            <h2>INSERT ROW </h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
        </div>
    </div>       


</asp:Content>
