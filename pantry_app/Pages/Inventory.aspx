<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="pantry_app.WebForm2" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Inventory </h1>

    <h5>Inventory</h5>
    <p>
        
        Choose Category</p>
    <p>
        
        <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True"
                            CssClass="form-control" DataSourceID="SqlDataSource3" 
                            DataTextField="ItemName" DataValueField="Category" 
                            OnSelectedIndexChanged="Reset">
        </asp:DropDownList>
    </p>
    <p>
        
        <asp:GridView ID="grdCategories" runat="server" AutoGenerateColumns="False" DataKeyNames="InventoryID" DataSourceID="SqlDataSource3" Height="79px" Width="742px" CssClass="table-bordered">
            <Columns>
                <asp:BoundField HeaderText="InventoryID" DataField="InventoryID" ReadOnly="True" SortExpression="InventoryID" /> 
                <asp:BoundField HeaderText="ItemName" DataField="ItemName" SortExpression="ItemName" />
                <asp:BoundField HeaderText="Description" DataField="Description" SortExpression="Description" />
                <asp:BoundField HeaderText="Quanity" DataField="Quanity" SortExpression="Quanity" />
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:PantryWiseDBConnectionString %>" SelectCommand="SELECT [InventoryID], [ItemName], [Description], [Quanity] FROM [Inventory]">
                     <InsertParameters>
                        <asp:Parameter Name="InventoryID" Type="String"></asp:Parameter>
                        <asp:Parameter Name="ItemName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Description" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Quanity" Type="String"></asp:Parameter>
                     </InsertParameters>
        </asp:SqlDataSource>

    </p>
    <p>
        
        <asp:Button ID="btnAdd" runat="server" Text="Add New Item" CssClass="btn" />
    </p>
    <p>
        
        Click Add New Item to Create New Inventory!</p>
    <p>
        
        <asp:Label ID="lblError" runat="server" EnableViewState="false" 
                        CssClass="text-danger"></asp:Label></p>
            
        <asp:Label ID="InventoryID" runat="server" Text="Inventory ID"></asp:Label>
    <p>
        <asp:TextBox ID="txtInventoryID" runat="server" Width="192px" CssClass="form-control" MaxLength="15"></asp:TextBox>
    </p>
    <p>
        <asp:RequiredFieldValidator ID="rfvInventoryID" runat="server" ControlToValidate="txtInventoryID" CssClass="text-danger" ErrorMessage="ID is a required field"></asp:RequiredFieldValidator>
    </p>
        
    <p>
        
        Item Name</p>
    <p>
        
        <asp:TextBox ID="txtItemName" runat="server" Width="188px" CssClass="form-control" MaxLength="15"></asp:TextBox>
    </p>
    <p>
        
        <asp:RequiredFieldValidator ID="rfvItemName" runat="server" ControlToValidate="txtItemName" CssClass="text-danger" ErrorMessage="Item Name  is a required field"></asp:RequiredFieldValidator>
    </p>
    <p>
        
        Description</p>
    <p>
        
        <asp:TextBox ID="txtDescription" runat="server" Width="187px" CssClass="form-control"></asp:TextBox>
    </p>
    <p>
        
        <asp:RequiredFieldValidator ID="rfvDescriptionName" runat="server" ControlToValidate="txtDescription" CssClass="text-danger" ErrorMessage="Description  is a required field"></asp:RequiredFieldValidator>
    </p>
    <p>
        
        Quantity</p>
    <p>
        
        <asp:TextBox ID="txtQuantity" runat="server" Width="185px" CssClass="form-control" MaxLength="15"></asp:TextBox>
    </p>
    <p>
        
        <asp:RequiredFieldValidator ID="rfvQuantity" runat="server" ControlToValidate="txtQuantity" CssClass="text-danger" ErrorMessage="Quantity is a required field"></asp:RequiredFieldValidator>
    </p>
    <p>
        
        Category</p>
    <p>
        
        <asp:TextBox ID="txtCategory" runat="server" Width="184px" CssClass="form-control" MaxLength="15"></asp:TextBox>
    </p>
    <p>
        
        <asp:RequiredFieldValidator ID="rfvCategory" runat="server" ControlToValidate="txtCategory" CssClass="text-danger" ErrorMessage="Category is a required field"></asp:RequiredFieldValidator>
    </p>


   

    </asp:Content>

