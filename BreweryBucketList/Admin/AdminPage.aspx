<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" 
    Inherits="BreweryBucketList.Admin.AdminPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server" >

    <br />

    <asp:GridView ID="grvBreweries" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="dsBreweriesAdmin" PageSize="5" 
        OnSelectedIndexChanged="grvBreweries_SelectedIndexChanged" DataKeyNames="BreweryID">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="BreweryName" HeaderText="BreweryName" SortExpression="BreweryName" />
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
            <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" />
            <asp:BoundField DataField="CountyName" HeaderText="CountyName" SortExpression="CountyName" />
            <asp:BoundField DataField="Website" HeaderText="Website" SortExpression="Website" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="dsBreweriesAdmin" runat="server" ConnectionString="<%$ ConnectionStrings:BreweryBucketListConnectionString %>" 
        SelectCommand="SELECT Brewery.BreweryName, Brewery.Address, Brewery.City, Brewery.State, Brewery.Zip, County.CountyName, Brewery.Website, Brewery.BreweryID FROM Brewery INNER JOIN County ON Brewery.CountyID = County.CountyID" DeleteCommand="DELETE FROM Brewery WHERE (BreweryID = @BreweryID)" UpdateCommand="UPDATE Brewery SET BreweryName = @BreweryName, Address = @Address, City = @City, State = @State, Zip = @Zip, Website = @Website, CountyName = @CountyName FROM Brewery INNER JOIN County ON Brewery.CountyID = County.CountyID">
        <DeleteParameters>
            <asp:ControlParameter ControlID="grvBreweries" Name="BreweryID" PropertyName="SelectedValue" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="grvBreweries" Name="BreweryName" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="grvBreweries" Name="Address" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="grvBreweries" Name="City" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="grvBreweries" Name="State" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="grvBreweries" Name="Zip" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="grvBreweries" Name="Website" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="grvBreweries" Name="CountyName" PropertyName="SelectedValue" />
        </UpdateParameters>
    </asp:SqlDataSource>

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
                        <asp:DropDownList ID="ddlCounties" runat="server" DataSourceID="dsCounties" DataTextField="CountyName" AppendDataBoundItems="True">
                            <asp:ListItem>--Select--</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsCounties" runat="server" ConnectionString="<%$ ConnectionStrings:BreweryBucketListConnectionString %>" SelectCommand="SELECT [CountyName] FROM [County]"></asp:SqlDataSource>
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
                        <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />
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
