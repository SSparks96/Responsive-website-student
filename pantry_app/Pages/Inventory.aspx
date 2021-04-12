<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="pantry_app.WebForm2" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Inventory </h1>

    <h5>Inventory</h5>
    <p>
        <asp:FormView ID="FormView1" runat="server" AllowPaging="True" CellPadding="4" DataKeyNames="InventoryID" DataSourceID="SqlDataSource2" ForeColor="#333333" Width="266px">
            <EditItemTemplate>
                InventoryID:
                <asp:Label ID="InventoryIDLabel1" runat="server" Text='<%# Eval("InventoryID") %>' />
                <br />
                ItemName:
                <asp:TextBox ID="ItemNameTextBox" runat="server" Text='<%# Bind("ItemName") %>' />
                <br />
                Description:
                <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                <br />
                Quanity:
                <asp:TextBox ID="QuanityTextBox" runat="server" Text='<%# Bind("Quanity") %>' />
                <br />
                CategoryID:
                <asp:TextBox ID="CategoryIDTextBox" runat="server" Text='<%# Bind("CategoryID") %>' />
                <br />
                CategoryName:
                <asp:TextBox ID="CategoryNameTextBox" runat="server" Text='<%# Bind("CategoryName") %>' />
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
                Description:
                <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                <br />
                Quanity:
                <asp:TextBox ID="QuanityTextBox" runat="server" Text='<%# Bind("Quanity") %>' />
                <br />
                CategoryID:
                <asp:TextBox ID="CategoryIDTextBox" runat="server" Text='<%# Bind("CategoryID") %>' />
                <br />
                CategoryName:
                <asp:TextBox ID="CategoryNameTextBox" runat="server" Text='<%# Bind("CategoryName") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <table style="width: 100%">
                    <tr>
                        <td style="width: 103px">InventoryID</td>
                        <td style="width: 30px">:</td>
                        <td>
                            <asp:Label ID="InventoryIDLabel" runat="server" Text='<%# Eval("InventoryID") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 103px">ItemName</td>
                        <td style="width: 30px">: </td>
                        <td>
                            <asp:Label ID="ItemNameLabel" runat="server" Text='<%# Bind("ItemName") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 103px">Description</td>
                        <td style="width: 30px">: </td>
                        <td>
                            <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Bind("Description") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 103px">Quanity</td>
                        <td style="width: 30px">:</td>
                        <td>
                            <asp:Label ID="QuanityLabel" runat="server" Text='<%# Bind("Quanity") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 103px">CategoryID</td>
                        <td style="width: 30px">:</td>
                        <td>
                            <asp:Label ID="CategoryIDLabel" runat="server" Text='<%# Bind("CategoryID") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 103px">CategoryName</td>
                        <td style="width: 30px">: </td>
                        <td>
                            <asp:Label ID="CategoryNameLabel" runat="server" Text='<%# Bind("CategoryName") %>' />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add new Item" />
            </ItemTemplate>
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:FormView>
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
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
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

