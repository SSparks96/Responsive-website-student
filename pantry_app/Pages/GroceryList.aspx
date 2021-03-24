<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GroceryList.aspx.cs" Inherits="pantry_app.WebForm2" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>testing for the Grocery List</h1>
    <p>&nbsp;</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="category_name" HeaderText="category_name" SortExpression="category_name" />
                <asp:BoundField DataField="item_name" HeaderText="item_name" SortExpression="item_name" />
                <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PantryWiseDBConnectionString %>" SelectCommand="SELECT [category_name], [item_name], [quantity] FROM [groceryList]"></asp:SqlDataSource>
    </p>

    </asp:Content>