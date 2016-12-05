<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="BreweryBucketList.Order1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <br />
    <h2>Order</h2>

    <asp:ListView ID="lvBreweryOrder" runat="server" DataSourceID="dsBreweryOrder" >
    <%--<ItemTemplate>
        <tr style="">
            <td>
                <asp:Label ID="BreweryNameLabel" runat="server" Text='<%# Eval("BreweryName") %>' />
            </td>
            <td>
                <asp:Label ID="CountyNameLabel" runat="server" Text='<%# Eval("CountyName") %>' />
            </td>
            <td>
                <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
            </td>
            <td>
                <asp:Label ID="WebsiteLabel" runat="server" Text='<%# Eval("Website") %>' />
            </td>
        </tr>
    </ItemTemplate>--%>
    <AlternatingItemTemplate>
        <tr style="">
            <td>
                <asp:Label ID="BreweryNameLabel" runat="server" Text='<%# Eval("BreweryName") %>' />
            </td>
            <td>
                <asp:Label ID="CountyNameLabel" runat="server" Text='<%# Eval("CountyName") %>' />
            </td>
            <td>
                <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
            </td>
            <td>
                <asp:Label ID="WebsiteLabel" runat="server" Text='<%# Eval("Website") %>' />
            </td>
        </tr>
    </AlternatingItemTemplate>
    <EditItemTemplate>
        <tr style="">
            <td>
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            </td>
            <td>
                <asp:TextBox ID="BreweryNameTextBox" runat="server" Text='<%# Bind("BreweryName") %>' />
            </td>
            <td>
                <asp:TextBox ID="CountyNameTextBox" runat="server" Text='<%# Bind("CountyName") %>' />
            </td>
            <td>
                <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
            </td>
            <td>
                <asp:TextBox ID="WebsiteTextBox" runat="server" Text='<%# Bind("Website") %>' />
            </td>
        </tr>
    </EditItemTemplate>
    <EmptyDataTemplate>
        <table runat="server" style="">
            <tr>
                <td>No data was returned.</td>
            </tr>
        </table>
    </EmptyDataTemplate>
    <InsertItemTemplate>
        <tr style="">
            <td>
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
            </td>
            <td>
                <asp:TextBox ID="BreweryNameTextBox" runat="server" Text='<%# Bind("BreweryName") %>' />
            </td>
            <td>
                <asp:TextBox ID="CountyNameTextBox" runat="server" Text='<%# Bind("CountyName") %>' />
            </td>
            <td>
                <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
            </td>
            <td>
                <asp:TextBox ID="WebsiteTextBox" runat="server" Text='<%# Bind("Website") %>' />
            </td>
        </tr>
    </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="BreweryNameLabel" runat="server" Text='<%# Eval("BreweryName") %>' />
                </td>
                <td>
                    <asp:Label ID="CountyNameLabel" runat="server" Text='<%# Eval("CountyName") %>' />
                </td>
                <td>
                    <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                </td>
                <td>
                    <asp:Label ID="WebsiteLabel" runat="server" Text='<%# Eval("Website") %>' />
                </td>
            </tr>
        </ItemTemplate>
    <LayoutTemplate>
        <table runat="server" >
            <tr runat="server">
                <td runat="server">
                    <table id="itemPlaceholderContainer" runat="server" border="0" style="width:800px" >
                        <tr runat="server" style="">
                            <th runat="server">BreweryName</th>
                            <th runat="server">CountyName</th>
                            <th runat="server">City</th>
                            <th runat="server">Website</th>
                        </tr>
                        <tr runat="server" id="itemPlaceholder">
                        </tr>
                    </table>
                </td>
            </tr>
            <tr runat="server">
                <td runat="server" style="">
                    <asp:DataPager ID="DataPager1" runat="server">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            <asp:NumericPagerField />
                            <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        </Fields>
                    </asp:DataPager>
                </td>
            </tr>
        </table>
    </LayoutTemplate>
    <SelectedItemTemplate>
        <tr style="">
            <td>
                <asp:Label ID="BreweryNameLabel" runat="server" Text='<%# Eval("BreweryName") %>' />
            </td>
            <td>
                <asp:Label ID="CountyNameLabel" runat="server" Text='<%# Eval("CountyName") %>' />
            </td>
            <td>
                <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
            </td>
            <td>
                <asp:Label ID="WebsiteLabel" runat="server" Text='<%# Eval("Website") %>' />
            </td>
        </tr>
    </SelectedItemTemplate>
</asp:ListView>
<asp:SqlDataSource ID="dsBreweryOrder" runat="server" ConnectionString="<%$ ConnectionStrings:BreweryBucketListConnectionString %>" SelectCommand="SELECT Brewery.BreweryName, County.CountyName, Brewery.City, Brewery.Website FROM Brewery INNER JOIN County ON Brewery.CountyID = County.CountyID"></asp:SqlDataSource>

    <asp:DataPager ID="dpBreweryOrder" runat="server" PagedControlID="lvBreweryOrder" PageSize="5">
    </asp:DataPager>
    
</asp:Content>
