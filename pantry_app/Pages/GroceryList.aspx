﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GroceryList.aspx.cs" Inherits="pantry_app.WebForm3" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <div class="jumbotron">
        <h2>Wecome to the Grocery list</h2>
    </div>
     <div class="row">
         <div class="col-sm-6 table-responsive">
     <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:PantryWiseDBConnectionString %>' SelectCommand="SELECT [category_name] FROM [groceryCategories] ORDER BY [category_name]"></asp:SqlDataSource>
    <asp:DropDownList ID="groceryCategoryDdl" CssClass="btn btn-default dropdown-toggle" runat="server" DataSourceID="SqlDataSource1" DataTextField="category_name" DataValueField="category_name"></asp:DropDownList>
    <asp:TextBox ID="nameTxt" runat="server" placeholder="Enter Item Name"></asp:TextBox>
    <asp:TextBox ID="quantityTxt" runat="server" placeholder="Enter Quantity"></asp:TextBox>
             </div>
         <div class="col-sm-6">
              <asp:Button ID="addFoodToGroceryList" runat="server" Text="Add To List" CssClass="btn btn-primary" OnClick="addFoodToGroceryList_Click" />
         </div>
         </div>
            <div class="jumbotron">
        <h2>Everything in your list</h2>
    </div>
    <div class="col-sm-6 table-responsive">
           <asp:GridView ID="GroceryListTable" runat="server" AutoGenerateColumns="False" AllowSorting="True" Width="542px" CellPadding="4" ForeColor="#333333" GridLines="None">
               <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="category_name" HeaderText="Food Category" SortExpression="category_name"></asp:BoundField>
                <asp:BoundField DataField="item_name" HeaderText="Pantry Item" SortExpression="item_name"></asp:BoundField>
                <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity"></asp:BoundField>
                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
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
        <asp:Button ID="testing" runat="server" Text="testing to see if it fixed the merge issue" />
     </div>

    </asp:Content>