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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PantryWiseDBConnectionString %>" SelectCommand="SELECT [RecipesID], [RecipesName], [Description] FROM [Recipes]">
                </asp:SqlDataSource>
            </div>

        <div class="col-xs-5">
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="175px" AutoGenerateRows="False" DataKeyNames="RecipesID" DataSourceID="SqlDataSource2"
                 CssClass="table table-condensed table-bordered table-striped" OnItemDeleted="DetailsView1_ItemDeleted" OnItemUpdated="DetailsView1_ItemUpdated" OnItemInserted="DetailsView1_ItemInserted" AlternatingRowStyle-BackColor="Black" BorderStyle="Solid" BorderWidth="2px">
                <AlternatingRowStyle BackColor="Silver" BorderColor="Black" BorderStyle="Inset" ForeColor="#0066FF"></AlternatingRowStyle>
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
                            <asp:TextBox ID="txtRecipesName" runat="server" CssClass="form-control" MaxLength="50" Text='<%# Bind("RecipesName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtRecipesName" runat="server" CssClass="form-control" MaxLength="50" Text='<%# Bind("RecipesName") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblRecipesName" runat="server" Text='<%# Bind("RecipesName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Description" SortExpression="Description">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" MaxLength="100" Text='<%# Bind("Description") %>' Height="100" Width="200" TextMode="MultiLine"></asp:TextBox>
                         </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>' MaxLength="100" CssClass="form-control" Height="100" Width="200"></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Fields>
                <HeaderStyle BackColor="Black" ForeColor="White" />
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
         </div>
        </div>

        <div class="col-xs-12">
           <p>To enter a recipe, enter the information below and click the <strong>Add Recipes</strong> button.</p>
            
            <div class="form-group">
                <asp:Label ID="lblRecipeID" runat="server" CssClass="col-xs-2" Text="Recipe ID"></asp:Label>
             <div class="col-xs-3">
                <asp:TextBox ID="txtID" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>
              </div>
             <div class="col-xs-offset-1 col-xs-4">
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RecipeID is required:" ControlToValidate="txtID" CssClass="text-danger" ></asp:RequiredFieldValidator>
             </div>
         </div>
       
         <div class="form-group">
            <asp:Label ID="lblRecipeName" runat="server" Text="Recipe Name" CssClass="col-xs-2" ></asp:Label>
         <div class="col-xs-3">
            <asp:TextBox ID="txtName" runat="server" MaxLength="10" CssClass="form-control" ></asp:TextBox>
         </div>
            <div class="col-xs-offset-1 col-xs-4">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Recipe name is required:" CssClass="text-danger" ControlToValidate="txtName"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <asp:Label ID="Description" runat="server" Text="Description" CssClass="col-xs-2" ></asp:Label>
         <div class="col-xs-3">
            <asp:TextBox ID="txtDecription2" class="form-control" runat="server" Height="100" Width="200" TextMode="MultiLine"></asp:TextBox>
                </div>
            <div class="col-xs-offset-1 col-xs-4">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="text-danger" ErrorMessage ="A discription is required:" ControlToValidate="txtDecription2"></asp:RequiredFieldValidator>
            </div>
        
        <div class="row">
            <div class="col-xs-3">
                <asp:Button ID="btAddRecipes" runat="server" Text="Add Recipes"  CssClass="btn btn-primary" OnClick="btAddRecipes_Click" />
            </div>
        </div>
        </div>
            
         <p>
            <asp:Label ID="lblError" runat="server" CssClass="text-danger" EnableViewState="False"></asp:Label>
          </p>
          <p> 
              <asp:ValidationSummary ID="ValidationSummary1" HeaderText="Please fix these issues:" CssClass="text-danger" runat="server" EnableViewState="True" />
          </p>

     
    

   </div>
</div>
</asp:Content>
