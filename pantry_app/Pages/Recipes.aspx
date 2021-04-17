﻿<%@ Page Title="Recipes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Recipes.aspx.cs" Inherits="pantry_app.Recipes" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Recipes</h1>
    <div>
        <div class="col-xs-12">
          <div class="row">
            <div class="col-xs-6 table-responsive">
                <asp:GridView ID="gvRecipes" runat="server" class="table table-bordered table-striped table-condensed" PageSize="5" AllowPaging="True" AllowSorting="True" 
                    AutoGenerateColumns="False" DataSourceID="SqlDataSource1"  OnPreRender="gvRecipes_PreRender" OnSelectedIndexChanged="gvRecipes_SelectedIndexChanged" DataKeyNames="RecipesID" CellPadding="4" ForeColor="#333333" GridLines="None" >
                    <AlternatingRowStyle BackColor="White" BorderColor="Black" BorderStyle="Groove" BorderWidth="2px" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField HeaderText="RecipeNum" SortExpression="RecipeNum">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtRecipeNum" runat="server" Text='<%# Bind("RecipeNum") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblRecipeNum" runat="server" Text='<%# Bind("RecipeNum") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="RecipesName" SortExpression="RecipesName">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtRecipesName" runat="server" Text='<%# Bind("RecipesName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblRecipesName" runat="server" Text='<%# Bind("RecipesName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Instructions" SortExpression="Instructions">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtInstructions" runat="server" Text='<%# Bind("Instructions") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblInstructions" runat="server" Text='<%# Bind("Instructions") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                    <PagerStyle CssClass="pagerStyle" HorizontalAlign="Center" BackColor="#284775" ForeColor="White"  />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PantryWiseDBConnectionString %>" SelectCommand="SELECT [RecipeNum], [RecipesName], [Instructions], [RecipesID] FROM [Recipes] ORDER BY [RecipeNum]" OldValuesParameterFormatString="original_{0}" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Recipes] WHERE [RecipesID] = @original_RecipesID AND (([RecipeNum] = @original_RecipeNum) OR ([RecipeNum] IS NULL AND @original_RecipeNum IS NULL)) AND (([RecipesName] = @original_RecipesName) OR ([RecipesName] IS NULL AND @original_RecipesName IS NULL)) AND (([Instructions] = @original_Instructions) OR ([Instructions] IS NULL AND @original_Instructions IS NULL))" InsertCommand="INSERT INTO [Recipes] ([RecipeNum], [RecipesName], [Instructions], [RecipesID]) VALUES (@RecipeNum, @RecipesName, @Instructions, @RecipesID)" UpdateCommand="UPDATE [Recipes] SET [RecipeNum] = @RecipeNum, [RecipesName] = @RecipesName, [Instructions] = @Instructions WHERE [RecipesID] = @original_RecipesID AND (([RecipeNum] = @original_RecipeNum) OR ([RecipeNum] IS NULL AND @original_RecipeNum IS NULL)) AND (([RecipesName] = @original_RecipesName) OR ([RecipesName] IS NULL AND @original_RecipesName IS NULL)) AND (([Instructions] = @original_Instructions) OR ([Instructions] IS NULL AND @original_Instructions IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_RecipesID" Type="Int32" />
                        <asp:Parameter Name="original_RecipeNum" Type="String" />
                        <asp:Parameter Name="original_RecipesName" Type="String" />
                        <asp:Parameter Name="original_Instructions" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="RecipeNum" Type="String" />
                        <asp:Parameter Name="RecipesName" Type="String" />
                        <asp:Parameter Name="Instructions" Type="String" />
                        <asp:Parameter Name="RecipesID" Type="Int32" />
                    </InsertParameters>
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

        <div class="col-xs-5">
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="175px" AutoGenerateRows="False" DataKeyNames="RecipesID" DataSourceID="SqlDataSource2"
                 CssClass="table table-condensed table-bordered table-striped" OnItemDeleted="DetailsView1_ItemDeleted" OnItemUpdated="DetailsView1_ItemUpdated" OnItemInserted="DetailsView1_ItemInserted" AlternatingRowStyle-BackColor="Black" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" BorderColor="Black" BorderStyle="Inset" ForeColor="#284775"></AlternatingRowStyle>
                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                <EditRowStyle BackColor="#999999" />
                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                <Fields>
                    <asp:TemplateField HeaderText="RecipeNum" SortExpression="RecipeNum">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtRecipeNum2" runat="server" Text='<%# Bind("RecipeNum") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtRecipeNum2" runat="server" Text='<%# Bind("RecipeNum") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblRecipeNum" runat="server" Text='<%# Bind("RecipeNum") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="RecipesName" SortExpression="RecipesName">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtRecipesName2" runat="server" Text='<%# Bind("RecipesName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtRecipesName2" runat="server" Text='<%# Bind("RecipesName") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblRecipesName" runat="server" Text='<%# Bind("RecipesName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Instructions" SortExpression="Instructions">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtInstructions3" runat="server" TextMode="MultiLine" Text='<%# Bind("Instructions") %>' Height="100" Width="200" Rows="5"></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtInstructions3" runat="server" Text='<%# Bind("Instructions") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblInstructions" runat="server" Text='<%# Bind("Instructions") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Fields>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:PantryWiseDBConnectionString %>" DeleteCommand="DELETE FROM [Recipes] WHERE [RecipesID] = @original_RecipesID AND (([RecipeNum] = @original_RecipeNum) OR ([RecipeNum] IS NULL AND @original_RecipeNum IS NULL)) AND (([RecipesName] = @original_RecipesName) OR ([RecipesName] IS NULL AND @original_RecipesName IS NULL)) AND (([Instructions] = @original_Instructions) OR ([Instructions] IS NULL AND @original_Instructions IS NULL))" InsertCommand="INSERT INTO [Recipes]  [RecipeNum], [RecipesName], [Instructions]) VALUES ( @RecipeNum, @RecipesName, @Instructions)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [RecipesID], [RecipeNum], [RecipesName], [Instructions] FROM [Recipes] WHERE ([RecipesID] = @RecipesID)" UpdateCommand="UPDATE [Recipes] SET [RecipeNum] = @RecipeNum, [RecipesName] = @RecipesName, [Instructions] = @Instructions WHERE [RecipesID] = @original_RecipesID AND (([RecipeNum] = @original_RecipeNum) OR ([RecipeNum] IS NULL AND @original_RecipeNum IS NULL)) AND (([RecipesName] = @original_RecipesName) OR ([RecipesName] IS NULL AND @original_RecipesName IS NULL)) AND (([Instructions] = @original_Instructions) OR ([Instructions] IS NULL AND @original_Instructions IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_RecipesID" Type="Int32" />
                    <asp:Parameter Name="original_RecipeNum" Type="String" />
                    <asp:Parameter Name="original_RecipesName" Type="String" />
                    <asp:Parameter Name="original_Instructions" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    
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
          <div class="jumbotron">  
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
       </div>
        <p>
           <asp:Label ID="lblError" runat="server" CssClass="text-danger" EnableViewState="False"></asp:Label>
        </p>
        
        <p> 
           <asp:ValidationSummary ID="ValidationSummary1" HeaderText="Please fix these issues:" CssClass="text-danger" runat="server" EnableViewState="True" />

     </div>
</div>
</div>
</asp:Content>