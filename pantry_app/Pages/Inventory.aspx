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
        
        <asp:GridView ID="GridView1" runat="server">
            <Columns>
                <asp:BoundField HeaderText="Inventory ID" />
                <asp:BoundField HeaderText="Item Name" />
                <asp:BoundField HeaderText="Category ID" />
                <asp:BoundField HeaderText="Item ID" />
                <asp:BoundField HeaderText="Units of Measrement" />
                <asp:BoundField HeaderText="Quantity on Hand" />
            </Columns>
        </asp:GridView>
    </p>

    </asp:Content>
