<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" 
    Inherits="BreweryBucketList.Admin.AdminPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server" >

    <br />
 <h1>Administration Page</h1>
    <br />
   
    <h4>Edit or Delete the Brewery.  </h4>
    <h4>Please click on either the Edit or Delete button in order to change the contents of that cell.
        When you have finished, either choose "Update" or "Cancel" to save or discard your changes.</h4>
    <asp:GridView ID="grvBreweries" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="dsBreweriesAdmin" PageSize="5" 
        OnSelectedIndexChanged="grvBreweries_SelectedIndexChanged" DataKeyNames="BreweryID" CellPadding="4" ForeColor="#333333" GridLines="None" Width="60%">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" />
            <asp:BoundField DataField="BreweryName" HeaderText="BreweryName" SortExpression="BreweryName" />
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
            <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" />
            <asp:BoundField DataField="CountyName" HeaderText="CountyName" SortExpression="CountyName" />
            <asp:BoundField DataField="Website" HeaderText="Website" SortExpression="Website" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
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
            <h2>Add Brewery.</h2>
            <h4>Fill in the information to create a new brewery in the database.</h4>
            <table style="border: thin solid #C0C0C0; width: 60%;" id="tblEdit">
                <tr>
                    <td class="modal-sm" style="width: 319px">
                        <asp:Label ID="lblBreweryName" runat="server" Text="Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtBreweryName" runat="server" Width="275px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="modal-sm" style="width: 319px">
                        <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtAddress" runat="server" Width="275px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="modal-sm" style="width: 319px">
                        <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCity" runat="server" Width="275px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="modal-sm" style="width: 319px">
                        <asp:Label ID="lblState" runat="server" Text="State"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtState" runat="server" Width="275px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="modal-sm" style="width: 319px">
                        <asp:Label ID="lblZip" runat="server" Text="Zip"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtZip" runat="server" Width="275px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="modal-sm" style="width: 319px">
                        <asp:Label ID="lblCounty" runat="server" Text="County"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlCounties" runat="server" DataSourceID="dsCounties" DataTextField="CountyName" AppendDataBoundItems="True" Width="250px">
                            <asp:ListItem>--Select--</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsCounties" runat="server" ConnectionString="<%$ ConnectionStrings:BreweryBucketListConnectionString %>" SelectCommand="SELECT [CountyName] FROM [County]"></asp:SqlDataSource>
                    </td>
                </tr>

                <tr>
                    <td class="modal-sm" style="width: 319px">
                        <asp:Label ID="lblWebsite" runat="server" Text="Website"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtWebsite" runat="server" Width="275px"></asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td class="modal-sm" style="width: 319px">
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
        </div>
    </div>       


</asp:Content>
