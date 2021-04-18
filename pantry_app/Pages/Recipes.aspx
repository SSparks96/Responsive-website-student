<%@ Page Title="Recipes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Recipes.aspx.cs" Inherits="pantry_app.Recipes" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Recipes</h1>
    <div>
        <div class="row">
          <div class="col-xs-12 table-responsive">
            <asp:GridView ID="gvRecipes" runat="server" class="table table-bordered table-striped table-condensed" PageSize="5" AllowPaging="True" AllowSorting="True" 
                    AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnPreRender="gvRecipes_PreRender"  DataKeyNames="RecipesID"
                     OnRowDeleted="grRecipes_RowDeleted" OnRowUpdated="grRecipes_RowUpdated" >
                    <AlternatingRowStyle BackColor="#3399FF" BorderColor="Black" BorderStyle="Groove" BorderWidth="2px" />
                    <Columns>
                        <asp:BoundField DataField="RecipesID" HeaderText="Recipe ID" InsertVisible="False" ReadOnly="True" SortExpression="RecipesID" HeaderStyle-CssClass="text-center" ControlStyle-CssClass="col-xs-1" >
                        
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Recipe Name" SortExpression="RecipesName" HeaderStyle-CssClass="text-center">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtRecipesName" runat="server"  Text='<%# Bind("RecipesName") %>' ></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblRecipesName" runat="server"  Text='<%# Bind("RecipesName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Instructions" SortExpression="Instructions" HeaderStyle-CssClass="text-center">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtInstruction"  runat="server" Text='<%# Bind("Instructions") %>' TextMode="MultiLine" Rows="10"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblInstructions"  runat="server"  Text='<%# Bind("Instructions") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                    <AlternatingRowStyle CssClass="alt-row"/>
                    <HeaderStyle BackColor="Black" ForeColor="White" />
                    <EditRowStyle CssClass="warning"/>
                    <PagerStyle CssClass="pagerStyle" HorizontalAlign="Center"  />
                    <PagerSettings Mode="NumericFirstLast"/>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PantryWiseDBConnectionString %>" SelectCommand="SELECT [RecipesID], [RecipesName], [Instructions] FROM [Recipes]" OldValuesParameterFormatString="original_{0}" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Recipes] WHERE [RecipesID] = @original_RecipesID AND (([RecipesName] = @original_RecipesName) OR ([RecipesName] IS NULL AND @original_RecipesName IS NULL)) AND (([Instructions] = @original_Instructions) OR ([Instructions] IS NULL AND @original_Instructions IS NULL))" InsertCommand="INSERT INTO [Recipes] ([RecipesName], [Instructions]) VALUES (@RecipesName, @Instructions)" UpdateCommand="UPDATE [Recipes] SET [RecipesName] = @RecipesName, [Instructions] = @Instructions WHERE [RecipesID] = @original_RecipesID AND (([RecipesName] = @original_RecipesName) OR ([RecipesName] IS NULL AND @original_RecipesName IS NULL)) AND (([Instructions] = @original_Instructions) OR ([Instructions] IS NULL AND @original_Instructions IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_RecipesID" Type="Int32" />
                        <asp:Parameter Name="original_RecipesName" Type="String" />
                        <asp:Parameter Name="original_Instructions" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="RecipesName" Type="String" />
                        <asp:Parameter Name="Instructions" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="RecipesName" Type="String" />
                        <asp:Parameter Name="Instructions" Type="String" />
                        <asp:Parameter Name="original_RecipesID" Type="Int32" />
                        <asp:Parameter Name="original_RecipesName" Type="String" />
                        <asp:Parameter Name="original_Instructions" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
             </div>
        <div class="row">
        <div class="col-xs-6">
            <p> 
                To enter a new recipe, click <strong>Add</strong> enter the required information and click <strong>Insert</strong>!
            </p>
            <p>
                <asp:Label ID="lblError" runat="server" CssClass="text-danger" EnableViewState="False"></asp:Label>
            </p>
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="175px" AutoGenerateRows="False" DataKeyNames="RecipesID" DataSourceID="SqlDataSource2"
                 CssClass="table table-condensed table-bordered table-striped" OnItemDeleted="DetailsView1_ItemDeleted" OnItemUpdated="DetailsView1_ItemUpdated" OnItemInserted="DetailsView1_ItemInserted" AlternatingRowStyle-BackColor="Black" BorderStyle="Solid" BorderWidth="2px">
                <AlternatingRowStyle BackColor="Silver" BorderColor="Black" BorderStyle="Inset" ForeColor="#0066FF"></AlternatingRowStyle>
                <Fields>
                    <asp:TemplateField HeaderText="Recipe ID" InsertVisible="False" SortExpression="RecipesID" HeaderStyle-CssClass="text-center">
                        <EditItemTemplate>
                            <asp:Label ID="txtRecipesID" runat="server" Text='<%# Eval("RecipesID") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LblRecipesID" runat="server" Text='<%# Bind("RecipesID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Recipe Name" SortExpression="RecipesName" HeaderStyle-CssClass="text-center" >
                        <EditItemTemplate>
                            <asp:TextBox ID="txtRecipesName" runat="server" CssClass="form-control" Text='<%# Bind("RecipesName") %>' ></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtRecipesName" runat="server" CssClass="form-control" Text='<%# Bind("RecipesName") %>' ></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblRecipesName" runat="server" Text='<%# Bind("RecipesName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Instructions" SortExpression="Instructions" HeaderStyle-CssClass="text-center">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtInstruction2" runat="server" CssClass="form-control" Text='<%# Bind("Instructions") %>' TextMode="MultiLine"  Height="100" Width="200" Rows="10"></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtInstructions2" runat="server" CssClass="form-control" Text='<%# Bind("Instructions") %>' Height="100" Width="200" TextMode="MultiLine"  Rows="10"></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblInstructions2" runat="server" Text='<%# Bind("Instructions") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField NewText="Add" ShowInsertButton="True" />
                </Fields>
                <RowStyle />
                <CommandRowStyle CssClass="commandRowStyle"/>
                <HeaderStyle BackColor="Black" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:PantryWiseDBConnectionString %>" DeleteCommand="DELETE FROM [Recipes] WHERE [RecipesID] = @original_RecipesID AND (([RecipesName] = @original_RecipesName) OR ([RecipesName] IS NULL AND @original_RecipesName IS NULL)) AND (([Instructions] = @original_Instructions) OR ([Instructions] IS NULL AND @original_Instructions IS NULL))" InsertCommand="INSERT INTO [Recipes] ([RecipesName], [Instructions]) VALUES (@RecipesName, @Instructions)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [RecipesID], [RecipesName], [Instructions] FROM [Recipes]" UpdateCommand="UPDATE [Recipes] SET [RecipesName] = @RecipesName, [Instructions] = @Instructions WHERE [RecipesID] = @original_RecipesID AND (([RecipesName] = @original_RecipesName) OR ([RecipesName] IS NULL AND @original_RecipesName IS NULL)) AND (([Instructions] = @original_Instructions) OR ([Instructions] IS NULL AND @original_Instructions IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_RecipesID" Type="Int32" />
                    <asp:Parameter Name="original_RecipesName" Type="String" />
                    <asp:Parameter Name="original_Instructions" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    
                    <asp:Parameter Name="RecipesName" Type="String" />
                    <asp:Parameter Name="Instructions" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="RecipesName" Type="String" />
                    <asp:Parameter Name="Instructions" Type="String" />
                    <asp:Parameter Name="original_RecipesID" Type="Int32" />
                    <asp:Parameter Name="original_RecipesName" Type="String" />
                    <asp:Parameter Name="original_Instructions" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
           </div>
         </div>
        </div>
   </div>

</asp:Content>