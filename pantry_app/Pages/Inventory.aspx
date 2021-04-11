<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="pantry_app.WebForm2" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <span class="style1">Inventory</span><br />

    <h5>Inventory</h5>
    <p>
        <asp:FormView ID="FormView1" runat="server" AllowPaging="True" CellPadding="4" DataKeyNames="InventoryID" DataSourceID="SqlDataSource3" ForeColor="#333333">
            <EditItemTemplate>
                InventoryID:
                <asp:Label ID="InventoryIDLabel1" runat="server" Text='<%# Eval("InventoryID") %>' />
                <br />
                ItemName:
                <asp:TextBox ID="ItemNameTextBox" runat="server" Text='<%# Bind("ItemName") %>' />
                <br />
                Quanity:
                <asp:TextBox ID="QuanityTextBox" runat="server" Text='<%# Bind("Quanity") %>' />
                <br />
                UserID:
                <asp:TextBox ID="UserIDTextBox" runat="server" Text='<%# Bind("UserID") %>' />
                <br />
                Description:
                <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                <br />
                CategoryID:
                <asp:TextBox ID="CategoryIDTextBox" runat="server" Text='<%# Bind("CategoryID") %>' />
                <br />
                CategoryName:
                <asp:TextBox ID="CategoryNameTextBox" runat="server" Text='<%# Bind("CategoryName") %>' />
                <br />
                ExpirationDate:
                <asp:TextBox ID="ExpirationDateTextBox" runat="server" Text='<%# Bind("ExpirationDate") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                InventoryID:
                <asp:TextBox ID="InventoryIDTextBox" runat="server" Text='<%# Bind("InventoryID") %>' />
                <br />
                ItemName:
                <asp:TextBox ID="ItemNameTextBox" runat="server" Text='<%# Bind("ItemName") %>' />
                <br />
                Quanity:
                <asp:TextBox ID="QuanityTextBox" runat="server" Text='<%# Bind("Quanity") %>' />
                <br />
                UserID:
                <asp:TextBox ID="UserIDTextBox" runat="server" Text='<%# Bind("UserID") %>' />
                <br />
                Description:
                <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                <br />
                CategoryID:
                <asp:TextBox ID="CategoryIDTextBox" runat="server" Text='<%# Bind("CategoryID") %>' />
                <br />
                CategoryName:
                <asp:TextBox ID="CategoryNameTextBox" runat="server" Text='<%# Bind("CategoryName") %>' />
                <br />
                ExpirationDate:
                <asp:TextBox ID="ExpirationDateTextBox" runat="server" Text='<%# Bind("ExpirationDate") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                InventoryID:
                <asp:Label ID="InventoryIDLabel" runat="server" Text='<%# Eval("InventoryID") %>' />
                <br />
                ItemName:
                <asp:Label ID="ItemNameLabel" runat="server" Text='<%# Bind("ItemName") %>' />
                <br />
                Quanity:
                <asp:Label ID="QuanityLabel" runat="server" Text='<%# Bind("Quanity") %>' />
                <br />
                UserID:
                <asp:Label ID="UserIDLabel" runat="server" Text='<%# Bind("UserID") %>' />
                <br />
                Description:
                <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Bind("Description") %>' />
                <br />
                CategoryID:
                <asp:Label ID="CategoryIDLabel" runat="server" Text='<%# Bind("CategoryID") %>' />
                <br />
                CategoryName:
                <asp:Label ID="CategoryNameLabel" runat="server" Text='<%# Bind("CategoryName") %>' />
                <br />
                ExpirationDate:
                <asp:Label ID="ExpirationDateLabel" runat="server" Text='<%# Bind("ExpirationDate") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add New Item" />
            </ItemTemplate>
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:PantryWiseDBConnectionString %>" DeleteCommand="DELETE FROM [Inventory] WHERE [InventoryID] = @InventoryID" InsertCommand="INSERT INTO [Inventory] ([InventoryID], [ItemName], [Quanity], [UserID], [Description], [CategoryID], [CategoryName], [ExpirationDate]) VALUES (@InventoryID, @ItemName, @Quanity, @UserID, @Description, @CategoryID, @CategoryName, @ExpirationDate)" SelectCommand="SELECT [InventoryID], [ItemName], [Quanity], [UserID], [Description], [CategoryID], [CategoryName], [ExpirationDate] FROM [Inventory]" UpdateCommand="UPDATE [Inventory] SET [ItemName] = @ItemName, [Quanity] = @Quanity, [UserID] = @UserID, [Description] = @Description, [CategoryID] = @CategoryID, [CategoryName] = @CategoryName, [ExpirationDate] = @ExpirationDate WHERE [InventoryID] = @InventoryID">
            <DeleteParameters>
                <asp:Parameter Name="InventoryID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="InventoryID" Type="Int32" />
                <asp:Parameter Name="ItemName" Type="String" />
                <asp:Parameter Name="Quanity" Type="String" />
                <asp:Parameter Name="UserID" Type="Int32" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="CategoryID" Type="Int32" />
                <asp:Parameter Name="CategoryName" Type="String" />
                <asp:Parameter DbType="Date" Name="ExpirationDate" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ItemName" Type="String" />
                <asp:Parameter Name="Quanity" Type="String" />
                <asp:Parameter Name="UserID" Type="Int32" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="CategoryID" Type="Int32" />
                <asp:Parameter Name="CategoryName" Type="String" />
                <asp:Parameter DbType="Date" Name="ExpirationDate" />
                <asp:Parameter Name="InventoryID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        Choose Category</p>
    <p>
        
        
        <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSource5" DataTextField="CategoryName" DataValueField="CategoryID" CssClass="form-control" Height="65px" Width="1092px">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:PantryWiseDBConnectionString %>" 
                            SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Category] ORDER BY [CategoryName]">

        </asp:SqlDataSource>
        
      </p>
    <p>
        
        &nbsp;</p>
    <p>
        
        <asp:GridView ID="grdCategories" runat="server" AutoGenerateColumns="False" DataKeyNames="InventoryID" 
                      DataSourceID="SqlDataSource2" CssClass="table table-bordered table-condensed table-hover" AllowPaging="True" AllowSorting="True" Height="227px" Width="1092px"  
                        >

            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField HeaderText="InventoryID" DataField="InventoryID" SortExpression="InventoryID" ReadOnly="True" /> 
                <asp:BoundField HeaderText="ItemName" DataField="ItemName" SortExpression="ItemName" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Quanity" HeaderText="Quanity" SortExpression="Quanity" />
                <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" />
                <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" SortExpression="CategoryName" />
                <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" SortExpression="CategoryName" />
                <asp:BoundField DataField="ExpirationDate" HeaderText="ExpirationDate" SortExpression="ExpirationDate" />
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PantryWiseDBConnectionString %>" DeleteCommand="DELETE FROM [Inventory] WHERE [InventoryID] = @InventoryID" InsertCommand="INSERT INTO [Inventory] ([InventoryID], [ItemName], [Description], [Quanity], [UserID], [CategoryID], [CategoryName], [ExpirationDate]) VALUES (@InventoryID, @ItemName, @Description, @Quanity, @UserID, @CategoryID, @CategoryName, @ExpirationDate)" SelectCommand="SELECT * FROM [Inventory] WHERE ([CategoryID] = @CategoryID)" UpdateCommand="UPDATE [Inventory] SET [ItemName] = @ItemName, [Description] = @Description, [Quanity] = @Quanity, [UserID] = @UserID, [CategoryID] = @CategoryID, [CategoryName] = @CategoryName, [ExpirationDate] = @ExpirationDate WHERE [InventoryID] = @InventoryID">
            <DeleteParameters>
                <asp:Parameter Name="InventoryID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="InventoryID" Type="Int32" />
                <asp:Parameter Name="ItemName" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Quanity" Type="String" />
                <asp:Parameter Name="UserID" Type="Int32" />
                <asp:Parameter Name="CategoryID" Type="Int32" />
                <asp:Parameter Name="CategoryName" Type="String" />
                <asp:Parameter DbType="Date" Name="ExpirationDate" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlCategory" Name="CategoryID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="ItemName" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Quanity" Type="String" />
                <asp:Parameter Name="UserID" Type="Int32" />
                <asp:Parameter Name="CategoryID" Type="Int32" />
                <asp:Parameter Name="CategoryName" Type="String" />
                <asp:Parameter DbType="Date" Name="ExpirationDate" />
                <asp:Parameter Name="InventoryID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>


   

    </asp:Content>

