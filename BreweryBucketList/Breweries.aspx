<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Breweries.aspx.cs" Inherits="BreweryBucketList.Breweries" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<!-- First row   Auto Generated table by using the text search box-->  
  <div class="row">
        <div class="col-md-12">
            <h2>Search for Brewery by Name</h2>
            <asp:Label ID="lblSearch" runat="server" Text="Brewery Search" Width="200px"></asp:Label>
        <br />
        <asp:TextBox ID="txtBrewerySearch" runat="server" Width="250px"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" />
    <br />
    <br />
    <asp:GridView ID="grvSearch" runat="server" CellPadding="15" ForeColor="#333333" GridLines="None" Width="60%" >
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="Visit">
                <ItemTemplate>
                    <asp:CheckBox ID="chkVisited" runat="server" HeaderText="Visit"/>
                </ItemTemplate>
            </asp:TemplateField>            
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

    </div>
      <div class="row">

      </div>
    <div class="col-md-12">
        <h2>Search by County</h2>
         <br />
                    <asp:Label ID="lblCounties" runat="server" Text="Label">Please Choose a County:</asp:Label>
                    <asp:DropDownList ID="ddlCounties" runat="server" DataSourceID="dsCounties" DataTextField="CountyName" 
                        DataValueField="CountyID" AutoPostBack="True" AppendDataBoundItems="True" >
                        <asp:ListItem Value="0">-Select County-</asp:ListItem>
                        </asp:DropDownList>      
    
                            <asp:SqlDataSource ID="dsCounties" runat="server" ConnectionString="<%$ ConnectionStrings:BreweryBucketListConnectionString %>"
                                SelectCommand="SELECT [CountyID], [CountyName] FROM [County]"></asp:SqlDataSource>

                <asp:SqlDataSource ID="dsBreweries" runat="server" ConnectionString="<%$ ConnectionStrings:BreweryBucketListConnectionString %>" 
                                SelectCommand="SELECT BreweryName, Address, City, State, Zip, Website FROM Brewery WHERE (CountyID = @CountyID)">
                    <FilterParameters>
                        <asp:ControlParameter ControlID="ddlCounties" Name="CountyID" PropertyName="SelectedValue" Type="String"  />
                    </FilterParameters>       
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlCounties" Name="CountyID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
    
        <asp:GridView ID="grvBreweries" runat="server" DataSourceID="dsBreweries" CellPadding="20" ForeColor="#333333"
            GridLines="None" Width="60%" AllowPaging="True" AutoGenerateColumns="False" AllowSorting="True" >
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkVisited" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CheckBoxField HeaderText="Visit" SortExpression="Visit" />
                    <asp:BoundField DataField="BreweryName" HeaderText="Brewery Name" SortExpression="BreweryName" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:TemplateField HeaderText="Website">
                        <ItemTemplate>
                            <asp:HyperLink ID="Website" runat="server" HeaderText="Website" Text="Link" 
                                NavigateUrl='<%# Eval("Website") %>' Target="_blank" NullDisplayText="No Website" />
                        </ItemTemplate>
                    </asp:TemplateField>
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
        <br />
        <asp:Button ID="btnAddtoList" runat="server" Text="Add to List" Width="100px" OnClick="btnAddtoList_Click" />
        <br />
        <br />    

         <asp:GridView ID="grvSelected" runat="server" CellPadding="20" ForeColor="#333333"
            GridLines="None" Width="60%" AllowPaging="True" AutoGenerateColumns="False" AllowSorting="True" >
                <AlternatingRowStyle BackColor="White" ForeColor="#284775"  />
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkVisited" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CheckBoxField HeaderText="Visit" SortExpression="Visit" />
                    <asp:BoundField DataField="BreweryName" HeaderText="Brewery Name" SortExpression="BreweryName" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:TemplateField HeaderText="Website">
                        <ItemTemplate>
                            <asp:HyperLink ID="Website" runat="server" HeaderText="Website" Text="Link" 
                                NavigateUrl='<%# Eval("Website") %>' Target="_blank" NullDisplayText="No Website" />
                        </ItemTemplate>
                    </asp:TemplateField>
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
        <br />
        <br />
        </div>       
    </div>
        
    
</asp:Content>
