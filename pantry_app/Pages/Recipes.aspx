<%@ Page Title="Recipes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Recipes.aspx.cs" Inherits="pantry_app.Recipes"  %>

<asp:Content ID="BodyContent1" ContentPlaceHolderID="MainContent" runat="server">
    
    <h1 style="background-color:coral; background-blend-mode:lighten; border-block-color:lightblue; border-style: outset;">Recipes</h1>
    <div>
        <div class="row form-group">
          <div class="col-xs-12 table-responsive">
            <asp:GridView ID="gvRecipes" runat="server" class="table table-bordered table-striped table-condensed" PageSize="5" AllowPaging="True" AllowSorting="True" 
                    AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnPreRender="gvRecipes_PreRender"  DataKeyNames="RecipesID"
                     OnRowDeleted="grRecipes_RowDeleted" OnRowUpdated="grRecipes_RowUpdated" >
                    <AlternatingRowStyle BackColor="#2582B3" ForeColor="Black" BorderColor="Black" BorderStyle="Groove" BorderWidth="2px" />
                    <Columns>
                        <asp:BoundField DataField="RecipesID" HeaderText="Recipes ID" InsertVisible="False" ReadOnly="True" SortExpression="RecipesID" HeaderStyle-CssClass="text-center" ControlStyle-CssClass="col-xs-1" >
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Recipe Name" SortExpression="RecipesName" HeaderStyle-CssClass="text-center">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtRecipesName" CssClass="form-control form" runat="server" Text='<%# Bind("RecipesName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblRecipesName" CssClass="form-label" runat="server" Text='<%# Bind("RecipesName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ingredients" HeaderStyle-CssClass="text-center" SortExpression="Ingreidents">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtIngredients" CssClass="form-control" TextMode="MultiLine" runat="server" Text='<%# Bind("Ingreidents") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblIngredient" CssClass="form-label"  runat="server" Text='<%# Bind("Ingreidents") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Instructions" HeaderStyle-CssClass="text-center" SortExpression="Instructions">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtInstructions" CssClass="form-control" TextMode="MultiLine" runat="server" Text='<%# Bind("Instructions") %>' Wrap="False"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblInstructions" CssClass="form-label"  runat="server" Text='<%# Bind("Instructions") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ButtonType="Button"  ShowEditButton="True" />
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
                    </Columns>
                    <AlternatingRowStyle CssClass="alt-row"/>
                    <HeaderStyle BackColor="Black" ForeColor="White" />
                    <EditRowStyle CssClass="warning"/>
                    <PagerStyle CssClass="pagerStyle" HorizontalAlign="Center"  />
                    <PagerSettings Mode="NumericFirstLast"/>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PantryWiseDBConnectionString %>" SelectCommand="SELECT [RecipesID], [RecipesName], [Ingreidents], [Instructions] FROM [Recipes]" OldValuesParameterFormatString="original_{0}" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Recipes] WHERE [RecipesID] = @original_RecipesID AND (([RecipesName] = @original_RecipesName) OR ([RecipesName] IS NULL AND @original_RecipesName IS NULL)) AND (([Ingreidents] = @original_Ingreidents) OR ([Ingreidents] IS NULL AND @original_Ingreidents IS NULL)) AND (([Instructions] = @original_Instructions) OR ([Instructions] IS NULL AND @original_Instructions IS NULL))" InsertCommand="INSERT INTO [Recipes] ([RecipesName], [Ingreidents], [Instructions]) VALUES (@RecipesName, @Ingreidents, @Instructions)" UpdateCommand="UPDATE [Recipes] SET [RecipesName] = @RecipesName, [Ingreidents] = @Ingreidents, [Instructions] = @Instructions WHERE [RecipesID] = @original_RecipesID AND (([RecipesName] = @original_RecipesName) OR ([RecipesName] IS NULL AND @original_RecipesName IS NULL)) AND (([Ingreidents] = @original_Ingreidents) OR ([Ingreidents] IS NULL AND @original_Ingreidents IS NULL)) AND (([Instructions] = @original_Instructions) OR ([Instructions] IS NULL AND @original_Instructions IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_RecipesID" Type="Int32" />
                        <asp:Parameter Name="original_RecipesName" Type="String" />
                        <asp:Parameter Name="original_Ingreidents" Type="String" />
                        <asp:Parameter Name="original_Instructions" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="RecipesName" Type="String" />
                        <asp:Parameter Name="Ingreidents" Type="String" />
                        <asp:Parameter Name="Instructions" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="RecipesName" Type="String" />
                        <asp:Parameter Name="Ingreidents" Type="String" />
                        <asp:Parameter Name="Instructions" Type="String" />
                        <asp:Parameter Name="original_RecipesID" Type="Int32" />
                        <asp:Parameter Name="original_RecipesName" Type="String" />
                        <asp:Parameter Name="original_Ingreidents" Type="String" />
                        <asp:Parameter Name="original_Instructions" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
             </div>
      <div class="col-xs-12 jumbotron3">
       <div class="row form-group">
        <div class="col-xs-6">
            <p> 
                To enter a new recipe, click <strong>Add</strong> enter the required information and click <strong>Insert</strong>!
            </p>
            <p>
                <asp:Label ID="lblError" runat="server" CssClass="text-danger" EnableViewState="False"></asp:Label>
            </p>
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="175px" AutoGenerateRows="False" DataKeyNames="RecipesID" DataSourceID="SqlDataSource2"
                 CssClass="table table-condensed table-bordered table-striped" OnItemDeleted="DetailsView1_ItemDeleted" OnItemUpdated="DetailsView1_ItemUpdated" OnItemInserted="DetailsView1_ItemInserted" AlternatingRowStyle-BackColor="Black" BorderStyle="Solid" BorderWidth="2px">
                <AlternatingRowStyle BackColor="#2582B3" BorderColor="Black" BorderStyle="Inset" ForeColor="White"></AlternatingRowStyle>
                <Fields>
                    <asp:BoundField DataField="RecipesID" HeaderText="Recipe ID" InsertVisible="False" ReadOnly="True" SortExpression="RecipesID" />
                    <asp:TemplateField HeaderText="Recipe Name" SortExpression="RecipesName">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtRecipesName" CssClass="form-control" runat="server" Text='<%# Bind("RecipesName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TxtRecipesName" CssClass="form-control" runat="server" Text='<%# Bind("RecipesName") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblRecipesName" CssClass="form-label" runat="server" Text='<%# Bind("RecipesName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ingredients" SortExpression="Ingreidents">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtIngredients" CssClass="form-control" TextMode="MultiLine" runat="server" Text='<%# Bind("Ingreidents") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtIngredients" CssClass="form-control" TextMode="MultiLine" runat="server" Text='<%# Bind("Ingreidents") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblIngredients" CssClass="form-label" runat="server" Text='<%# Bind("Ingreidents") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Instructions" SortExpression="Instructions">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtInstructions" CssClass="form-control" TextMode="MultiLine" runat="server" Text='<%# Bind("Instructions") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtInstructions" CssClass="form-control" TextMode="MultiLine" runat="server" Text='<%# Bind("Instructions") %>' Wrap="True"></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblInstructions" CssClass="form-label" runat="server" Text='<%# Bind("Instructions") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Button" NewText="Add" ShowInsertButton="True" />
                </Fields>
                <RowStyle />
                <CommandRowStyle CssClass="commandRowStyle"/>
                <HeaderStyle BackColor="Black" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:PantryWiseDBConnectionString %>" DeleteCommand="DELETE FROM [Recipes] WHERE [RecipesID] = @original_RecipesID AND (([RecipesName] = @original_RecipesName) OR ([RecipesName] IS NULL AND @original_RecipesName IS NULL)) AND (([Ingreidents] = @original_Ingreidents) OR ([Ingreidents] IS NULL AND @original_Ingreidents IS NULL)) AND (([Instructions] = @original_Instructions) OR ([Instructions] IS NULL AND @original_Instructions IS NULL))" InsertCommand="INSERT INTO [Recipes] ([RecipesName], [Ingreidents], [Instructions]) VALUES (@RecipesName, @Ingreidents, @Instructions)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [RecipesID], [RecipesName], [Ingreidents], [Instructions] FROM [Recipes]" UpdateCommand="UPDATE [Recipes] SET [RecipesName] = @RecipesName, [Ingreidents] = @Ingreidents, [Instructions] = @Instructions WHERE [RecipesID] = @original_RecipesID AND (([RecipesName] = @original_RecipesName) OR ([RecipesName] IS NULL AND @original_RecipesName IS NULL)) AND (([Ingreidents] = @original_Ingreidents) OR ([Ingreidents] IS NULL AND @original_Ingreidents IS NULL)) AND (([Instructions] = @original_Instructions) OR ([Instructions] IS NULL AND @original_Instructions IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_RecipesID" Type="Int32" />
                    <asp:Parameter Name="original_RecipesName" Type="String" />
                    <asp:Parameter Name="original_Ingreidents" Type="String" />
                    <asp:Parameter Name="original_Instructions" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    
                    <asp:Parameter Name="RecipesName" Type="String" />
                    <asp:Parameter Name="Ingreidents" Type="String" />
                    <asp:Parameter Name="Instructions" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="RecipesName" Type="String" />
                    <asp:Parameter Name="Ingreidents" Type="String" />
                    <asp:Parameter Name="Instructions" Type="String" />
                    <asp:Parameter Name="original_RecipesID" Type="Int32" />
                    <asp:Parameter Name="original_RecipesName" Type="String" />
                    <asp:Parameter Name="original_Ingreidents" Type="String" />
                    <asp:Parameter Name="original_Instructions" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
           </div>
         </div>
        </div>
     </div>
  </div>

</asp:Content>