<%@ Page Title="Recipes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Recipes.aspx.cs" Inherits="pantry_app.Recipes" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Recipes</h1>
    <div>
        <div class="row">
            <div class="col-xs-6 table-responsive">
                <asp:GridView ID="gvRecipes" runat="server" class="table table-bordered table-striped table-condensed" AllowPaging="True" AllowSorting="True" 
                    AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="RecipesID"  OnPreRender="gvRecipes_PreRender" OnSelectedIndexChanged="gvRecipes_SelectedIndexChanged" >
                    <AlternatingRowStyle BackColor="#3399FF" BorderColor="Black" BorderStyle="Groove" BorderWidth="2px" />
                    <Columns>
                        <asp:BoundField DataField="RecipesID" HeaderText="RecipesID" SortExpression="RecipesID" ReadOnly="True" />
                        <asp:BoundField DataField="RecipesName" HeaderText="RecipesName" SortExpression="RecipesName" />
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                        <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                    </Columns>
                    <HeaderStyle BackColor="Black" ForeColor="White" />
                    <PagerStyle CssClass="pagerStyle" HorizontalAlign="Center" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PantryWiseDBConnectionString %>" SelectCommand="SELECT [RecipesID], [RecipesName], [Description] FROM [Recipes]">
                </asp:SqlDataSource>
            </div>
        </div>
        <div class="col-xs-5">
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="RecipesID" DataSourceID="SqlDataSource2"
                 CssClass="table table-condensed">
                <Fields>
                    <asp:TemplateField HeaderText="RecipesID" SortExpression="RecipesID">
                        <EditItemTemplate>
                            <asp:Label ID="lblRecipesID" runat="server" Text='<%# Eval("RecipesID") %>'></asp:Label>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtRecipesID" runat="server" Text='<%# Bind("RecipesID") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblRecipesID" runat="server" Text='<%# Bind("RecipesID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="RecipesName" SortExpression="RecipesName">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtRecipesName" runat="server" Text='<%# Bind("RecipesName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtRecipesName" runat="server" Text='<%# Bind("RecipesName") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblRecipesName" runat="server" Text='<%# Bind("RecipesName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Description" SortExpression="Description">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <div class="col-xs-11 col-insert">
                            <asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>' MaxLength="100"></asp:TextBox>
                            </div>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:PantryWiseDBConnectionString %>" DeleteCommand="DELETE FROM [Recipes] WHERE [RecipesID] = @original_RecipesID AND (([RecipesName] = @original_RecipesName) OR ([RecipesName] IS NULL AND @original_RecipesName IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL))" InsertCommand="INSERT INTO [Recipes] ([RecipesID], [RecipesName], [Description]) VALUES (@RecipesID, @RecipesName, @Description)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [RecipesID], [RecipesName], [Description] FROM [Recipes] WHERE ([RecipesID] = @RecipesID)" UpdateCommand="UPDATE [Recipes] SET [RecipesName] = @RecipesName, [Description] = @Description WHERE [RecipesID] = @original_RecipesID AND (([RecipesName] = @original_RecipesName) OR ([RecipesName] IS NULL AND @original_RecipesName IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_RecipesID" Type="Int32" />
                    <asp:Parameter Name="original_RecipesName" Type="String" />
                    <asp:Parameter Name="original_Description" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="RecipesID" Type="Int32" />
                    <asp:Parameter Name="RecipesName" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvRecipes" Name="RecipesID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="RecipesName" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="original_RecipesID" Type="Int32" />
                    <asp:Parameter Name="original_RecipesName" Type="String" />
                    <asp:Parameter Name="original_Description" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <div class="row">
            <div class="col-xs-3">
                <asp:Button ID="btAddRecipes" runat="server" Text="Add Recipes"  CssClass="btn btn-primary" OnClick="btAddRecipes_Click" />
            </div>
        </div>
            <p>
              <asp:Label ID="lblError" runat="server" CssClass="text-danger" EnableViewState="False"></asp:Label>
            </p>
            <p> 
              <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Please fix these issues:" class="text-danger"/>
        
   </div>
</asp:Content>
