<%@ Page Title="Recipes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Recipes.aspx.cs" Inherits="pantry_app.Recipes" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Recipes</h1>
    <div>
        <div class="row">
            <div class="col-xs-6">
                <asp:GridView ID="gvRecipes" runat="server" class="table table-bordered table-striped table-responsive" >
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
            </div>
        </div>
        <div class="col-xs-5">
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" class="table table-bordered table-condensed table-stripe"></asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
        </div>
        <div class="row">
            <div class="col-xs-6">
                <asp:Label ID="lblError" runat="server" CssClass="text-danger"></asp:Label>
            </div>
        </div>
   </div>
</asp:Content>
