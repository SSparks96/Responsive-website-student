<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="pantry_app.WebForm2" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Inventory </h1>

    <h5>Inventory</h5>
    <p>
        
        Choose Category</p>
    <p>
        
        <asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
    </p>
    <p>
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="InventoryID" DataSourceID="SqlDataSource3">
            <Columns>
                <asp:BoundField HeaderText="InventoryID" DataField="InventoryID" ReadOnly="True" SortExpression="InventoryID" />
                <asp:BoundField HeaderText="ItemName" DataField="ItemName" SortExpression="ItemName" />
                <asp:BoundField HeaderText="Description" DataField="Description" SortExpression="Description" />
                <asp:BoundField HeaderText="Quanity" DataField="Quanity" SortExpression="Quanity" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:PantryWiseDBConnectionString %>" SelectCommand="SELECT [InventoryID], [ItemName], [Description], [Quanity] FROM [Inventory]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    </p>
    <p>
        
        <asp:Button ID="Button1" runat="server" Text="Add New Item" />
    </p>
    <p>
        
        Click Add New Item to Create New Inventory!</p>
    <p>
        
        <asp:Label ID="InventoryID" runat="server" Text="Inventory ID"></asp:Label>
    </p>
    <p>
        
        <asp:TextBox ID="TextBox1" runat="server" Width="192px"></asp:TextBox>
    </p>
    <p>
        
        Item Name</p>
    <p>
        
        <asp:TextBox ID="TextBox2" runat="server" Width="188px"></asp:TextBox>
    </p>
    <p>
        
        Description</p>
    <p>
        
        <asp:TextBox ID="TextBox3" runat="server" Width="187px"></asp:TextBox>
    </p>
    <p>
        
        Quantity</p>
    <p>
        
        <asp:TextBox ID="TextBox4" runat="server" Width="185px"></asp:TextBox>
    </p>
    <p>
        
        Category</p>
    <p>
        
        <asp:TextBox ID="TextBox5" runat="server" Width="184px"></asp:TextBox>
    </p>


   

    </asp:Content>
