<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="pantry_app.WebForm2" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Inventory </h1>

    <h5>Inventory</h5>
    <p>
        <asp:FormView ID="FormView1" runat="server" AllowPaging="True" CellPadding="4" DataKeyNames="InventoryID" DataSourceID="SqlDataSource2" ForeColor="#333333" Width="220px" Height="165px">
            <EditItemTemplate>
                InventoryID:
                <asp:DynamicControl ID="InventoryIDDynamicControl" runat="server" DataField="InventoryID" Mode="ReadOnly" />
                <br />
                ItemName:
                <asp:DynamicControl ID="ItemNameDynamicControl" runat="server" DataField="ItemName" Mode="Edit" />
                <br />
                Description:
                <asp:DynamicControl ID="DescriptionDynamicControl" runat="server" DataField="Description" Mode="Edit" />
                <br />
                Quanity:
                <asp:DynamicControl ID="QuanityDynamicControl" runat="server" DataField="Quanity" Mode="Edit" />
                <br />
                CategoryID:
                <asp:DynamicControl ID="CategoryIDDynamicControl" runat="server" DataField="CategoryID" Mode="Edit" />
                <br />
                CategoryName:
                <asp:DynamicControl ID="CategoryNameDynamicControl" runat="server" DataField="CategoryName" Mode="Edit" />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ValidationGroup="Insert" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                InventoryID:
                <asp:DynamicControl ID="InventoryIDDynamicControl" runat="server" DataField="InventoryID" Mode="Insert" ValidationGroup="Insert" />
                <br />
                ItemName:
                <asp:DynamicControl ID="ItemNameDynamicControl" runat="server" DataField="ItemName" Mode="Insert" ValidationGroup="Insert" />
                <br />
                Description:
                <asp:DynamicControl ID="DescriptionDynamicControl" runat="server" DataField="Description" Mode="Insert" ValidationGroup="Insert" />
                <br />
                Quanity:
                <asp:DynamicControl ID="QuanityDynamicControl" runat="server" DataField="Quanity" Mode="Insert" ValidationGroup="Insert" />
                <br />
                CategoryID:
                <asp:DynamicControl ID="CategoryIDDynamicControl" runat="server" DataField="CategoryID" Mode="Insert" ValidationGroup="Insert" />
                <br />
                CategoryName:
                <asp:DynamicControl ID="CategoryNameDynamicControl" runat="server" DataField="CategoryName" Mode="Insert" ValidationGroup="Insert" />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" ValidationGroup="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                InventoryID:&nbsp;<asp:DynamicControl ID="InventoryIDDynamicControl" runat="server" DataField="InventoryID" Mode="ReadOnly" />
                <br />
                ItemName:
                <asp:DynamicControl ID="ItemNameDynamicControl" runat="server" DataField="ItemName" Mode="ReadOnly" />
                <br />
                Description:
                <asp:DynamicControl ID="DescriptionDynamicControl" runat="server" DataField="Description" Mode="ReadOnly" />
                <br />
                Quanity:
                <asp:DynamicControl ID="QuanityDynamicControl" runat="server" DataField="Quanity" Mode="ReadOnly" />
                <br />
                CategoryID:
                <asp:DynamicControl ID="CategoryIDDynamicControl" runat="server" DataField="CategoryID" Mode="ReadOnly" />
                <br />
                CategoryName:
                <asp:DynamicControl ID="CategoryNameDynamicControl" runat="server" DataField="CategoryName" Mode="ReadOnly" />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:FormView>
    </p>
    <p>
        <asp:FormView ID="FormView2" runat="server" DataSourceID="SqlDataSource4">
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>
    </p>
    <p>Choose Category</p>
    <p>
        
        
        <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSource1" DataTextField="CategoryName" DataValueField="CategoryID" CssClass="form-control">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PantryWiseDBConnectionString %>" 
                            SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Category] ORDER BY [CategoryName]">

        </asp:SqlDataSource>
        
      </p>
    <p>
        
        &nbsp;</p>
    <p>
        
        <asp:GridView ID="grdCategories" runat="server" AutoGenerateColumns="False" DataKeyNames="InventoryID" 
                      DataSourceID="SqlDataSource2" CssClass="table table-bordered table-condensed table-hover" AllowPaging="True" AllowSorting="True" Height="227px" Width="1144px"  
                        >

            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField HeaderText="InventoryID" DataField="InventoryID" SortExpression="InventoryID" ReadOnly="True" /> 
                <asp:BoundField HeaderText="ItemName" DataField="ItemName" SortExpression="ItemName" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Quanity" HeaderText="Quanity" SortExpression="Quanity" />
                <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" />
                <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" SortExpression="CategoryName" />
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PantryWiseDBConnectionString %>" 
             SelectCommand="SELECT [InventoryID], [ItemName], [Description], [Quanity], [CategoryID], [CategoryName] FROM [Inventory] WHERE ([CategoryID] = @CategoryID)" 
             DeleteCommand="DELETE FROM [Inventory] WHERE [InventoryID] = @InventoryID" 
             InsertCommand="INSERT INTO [Inventory] ([InventoryID], [ItemName], [Description], [Quanity], [CategoryID], [CategoryName]) VALUES (@InventoryID, @ItemName, @Description, @Quanity, @CategoryID, @CategoryName)" 
             UpdateCommand="UPDATE [Inventory] SET [ItemName] = @ItemName, [Description] = @Description, [Quanity] = @Quanity, [CategoryID] = @CategoryID, [CategoryName] = @CategoryName WHERE [InventoryID] = @InventoryID">
            
            <DeleteParameters>
                <asp:Parameter Name="InventoryID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="InventoryID" Type="String" />
                <asp:Parameter Name="ItemName" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Quanity" Type="String" />
                <asp:Parameter Name="CategoryID" Type="String" />
                <asp:Parameter Name="CategoryName" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlCategory" Name="CategoryID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="ItemName" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Quanity" Type="String" />
                <asp:Parameter Name="CategoryID" Type="String" />
                <asp:Parameter Name="CategoryName" Type="String" />
                <asp:Parameter Name="InventoryID" Type="String" />
            </UpdateParameters>

        </asp:SqlDataSource>
    </p>

   

    </asp:Content>

