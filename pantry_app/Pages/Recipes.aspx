<%@ Page Title="Recipes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Recipes.aspx.cs" Inherits="pantry_app.Recipes" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Recipes</h1>
    <div>
        <div class="col-xs-12">
          <div class="row">
            <div class="col-xs-6 table-responsive">
                <asp:GridView ID="gvRecipes" runat="server" class="table table-bordered table-striped table-condensed" PageSize="5" AllowPaging="True" AllowSorting="True" 
                    AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="RecipesID"  OnPreRender="gvRecipes_PreRender" OnSelectedIndexChanged="gvRecipes_SelectedIndexChanged" >
                    <AlternatingRowStyle BackColor="#3399FF" BorderColor="Black" BorderStyle="Groove" BorderWidth="2px" />
                    <Columns>
                        <asp:TemplateField HeaderText="RecipeNum" SortExpression="RecipeNum">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtRecipeNum" runat="server" Text='<%# Bind("RecipeNum") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblRecipeNum" runat="server" Text='<%# Bind("RecipeNum") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="RecipeName" SortExpression="RecipesName">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtRecipeName" runat="server" Text='<%# Bind("RecipesName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblRecipeName" runat="server" Text='<%# Bind("RecipesName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Instructions" SortExpression="Instructions">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtInstruction" runat="server" Text='<%# Bind("Instructions") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblInstruction" runat="server" Text='<%# Bind("Instructions") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowSelectButton="True" />
                    </Columns>
                    <HeaderStyle BackColor="Black" ForeColor="White" />
                    <PagerStyle CssClass="pagerStyle" HorizontalAlign="Center"  />
                    <PagerSettings Mode="NumericFirstLast"/>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PantryWiseDBConnectionString %>" SelectCommand="SELECT [RecipesID], [RecipeNum], [RecipesName], [Instructions] FROM [Recipes]">
                </asp:SqlDataSource>
             </div>

        <div class="col-xs-5">
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="175px" AutoGenerateRows="False" DataKeyNames="RecipesID" DataSourceID="SqlDataSource2"
                 CssClass="table table-condensed table-bordered table-striped" OnItemDeleted="DetailsView1_ItemDeleted" OnItemUpdated="DetailsView1_ItemUpdated" OnItemInserted="DetailsView1_ItemInserted" AlternatingRowStyle-BackColor="Black" BorderStyle="Solid" BorderWidth="2px">
                <AlternatingRowStyle BackColor="Silver" BorderColor="Black" BorderStyle="Inset" ForeColor="#0066FF"></AlternatingRowStyle>
                <Fields>
                    <asp:BoundField DataField="RecipeNum" HeaderText="RecipeNum" SortExpression="RecipeNum" />
                    <asp:BoundField DataField="RecipesName" HeaderText="RecipesName" SortExpression="RecipesName" />
                    <asp:BoundField DataField="Instructions" HeaderText="Instructions" SortExpression="Instructions" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Fields>
                <HeaderStyle BackColor="Black" ForeColor="White" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:PantryWiseDBConnectionString %>" DeleteCommand="DELETE FROM [Recipes] WHERE [RecipesID] = @original_RecipesID AND (([RecipeNum] = @original_RecipeNum) OR ([RecipeNum] IS NULL AND @original_RecipeNum IS NULL)) AND (([RecipesName] = @original_RecipesName) OR ([RecipesName] IS NULL AND @original_RecipesName IS NULL)) AND (([Instructions] = @original_Instructions) OR ([Instructions] IS NULL AND @original_Instructions IS NULL))" InsertCommand="INSERT INTO [Recipes] ([RecipesID], [RecipeNum], [RecipesName], [Instructions]) VALUES (@RecipesID, @RecipeNum, @RecipesName, @Instructions)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [RecipesID], [RecipeNum], [RecipesName], [Instructions] FROM [Recipes] WHERE ([RecipesID] = @RecipesID)" UpdateCommand="UPDATE [Recipes] SET [RecipeNum] = @RecipeNum, [RecipesName] = @RecipesName, [Instructions] = @Instructions WHERE [RecipesID] = @original_RecipesID AND (([RecipeNum] = @original_RecipeNum) OR ([RecipeNum] IS NULL AND @original_RecipeNum IS NULL)) AND (([RecipesName] = @original_RecipesName) OR ([RecipesName] IS NULL AND @original_RecipesName IS NULL)) AND (([Instructions] = @original_Instructions) OR ([Instructions] IS NULL AND @original_Instructions IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_RecipesID" Type="Int32" />
                    <asp:Parameter Name="original_RecipeNum" Type="String" />
                    <asp:Parameter Name="original_RecipesName" Type="String" />
                    <asp:Parameter Name="original_Instructions" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="RecipesID" Type="Int32" />
                    <asp:Parameter Name="RecipeNum" Type="String" />
                    <asp:Parameter Name="RecipesName" Type="String" />
                    <asp:Parameter Name="Instructions" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvRecipes" Name="RecipesID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="RecipeNum" Type="String" />
                    <asp:Parameter Name="RecipesName" Type="String" />
                    <asp:Parameter Name="Instructions" Type="String" />
                    <asp:Parameter Name="original_RecipesID" Type="Int32" />
                    <asp:Parameter Name="original_RecipeNum" Type="String" />
                    <asp:Parameter Name="original_RecipesName" Type="String" />
                    <asp:Parameter Name="original_Instructions" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
           </div>
         </div>
        </div>
        
        <div class="col-xs-12">
           <p>To enter a recipe, enter the information below and click the <strong>Add Recipes</strong> button.</p>
            
            <div class="form-group">
                <asp:Label ID="lblRecipeNum" runat="server" CssClass="col-xs-2"  Text="Recipe Number"></asp:Label>
             <div class="col-xs-3">
                <asp:TextBox ID="txtNum" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>
              </div>
             <div class="col-xs-offset-1 col-xs-4">
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="A recipe number is required:" ControlToValidate="txtNum" CssClass="text-danger" ></asp:RequiredFieldValidator>
             </div>
         </div>
       
         <div class="form-group">
            <asp:Label ID="lblRecipeName" runat="server" Text="Recipe Name" CssClass="col-xs-2" ></asp:Label>
         <div class="col-xs-3">
            <asp:TextBox ID="txtName" runat="server" MaxLength="50" CssClass="form-control" ></asp:TextBox>
         </div>
            <div class="col-xs-offset-1 col-xs-4">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Recipe name is required:" CssClass="text-danger" ControlToValidate="txtName"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <asp:Label ID="Instruction" runat="server" Text="Recipe Instructions" CssClass="col-xs-2" ></asp:Label>
         <div class="col-xs-3">
            <asp:TextBox ID="txtInstruction2" class="form-control" runat="server" Height="100" Width="200" Row="5" TextMode="MultiLine"></asp:TextBox>
                </div>
            <div class="col-xs-offset-1 col-xs-4">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="text-danger" ErrorMessage ="The instructions are required:" ControlToValidate="txtInstruction2"></asp:RequiredFieldValidator>
            </div>
        </div>
        
        <div class="form-group">
            <div class="col-xs-offset-2 col-xs-2">
                <asp:Button ID="btAddRecipes" runat="server" Text="Add Recipes"  CssClass="btn btn-primary" OnClick="btAddRecipes_Click" CommandName="Insert" />
            </div>
            <div class="col-xs-2">
                <asp:Button ID="btClear" runat="server" Text="Clear" CssClass="btn btn-primary" OnClick="btClear_Click" CausesValidation="False" />
            </div>
        </div>
       
        <p>
           <asp:Label ID="lblError" runat="server" CssClass="text-danger" EnableViewState="False"></asp:Label>
        </p>
        <p>
            <asp:Label ID="Label1" runat="server" ></asp:Label>

        </p>
        <p> 
           <asp:ValidationSummary ID="ValidationSummary1" HeaderText="Please fix these issues:" CssClass="text-danger" runat="server" EnableViewState="True" />

     </div>
</div>

</asp:Content>
