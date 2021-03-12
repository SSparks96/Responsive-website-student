<%@ Page Title="Recipes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Recipes.aspx.cs" Inherits="pantry_app.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Recipes</h1>
    <div>
        <div class="row">
            <div class="col-xs-6">
                <asp:GridView ID="gvRecipes" runat="server"></asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
            </div>
        </div>
        <div class="col-xs-5">
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px"></asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
