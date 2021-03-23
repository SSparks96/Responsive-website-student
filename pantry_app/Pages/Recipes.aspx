<%@ Page Title="Recipes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Recipes.aspx.cs" Inherits="pantry_app.Recipes" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Recipes</h1>
    <div>
        <div class="row">
            <div class="col-xs-6">
                <asp:GridView ID="gvRecipes" runat="server" class="table table-bordered table-striped table-responsive" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="UserID,RecipeName,Description" EnableViewState="False" OnSelectedIndexChanged="gvRecipes_SelectedIndexChanged" >
                    <Columns>
                        <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                        <asp:BoundField DataField="RecipeName" HeaderText="RecipeName" SortExpression="RecipeName" />
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                        <asp:CommandField ShowSelectButton="True" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pantry_app_db1ConnectionString %>" SelectCommand="SELECT [UserID], [RecipeName], [Description] FROM [Recipes] ORDER BY [RecipeName]">
                </asp:SqlDataSource>
            </div>
        </div>
        <div class="col-xs-6">
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" class="table table-bordered table-condensed table-stripe" AutoGenerateRows="False" DataKeyNames="RecipesID" DataSourceID="SqlDataSource2" EnableViewState="False">
                <Fields>
                    <asp:TemplateField HeaderText="UserID" SortExpression="UserID">
                        <EditItemTemplate>
                            <asp:TextBox ID="lblUserID" runat="server" Text='<%# Bind("UserID") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtUserID" runat="server" Text='<%# Bind("UserID") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="UserID is required:" ControlToValidate="txtUserID" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblUserID" runat="server" Text='<%# Bind("UserID") %>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="RecipesID" SortExpression="RecipesID">
                        <EditItemTemplate>
                            <asp:Label ID="lblRecipesID" runat="server" Text='<%# Eval("RecipesID") %>'></asp:Label>
                        </EditItemTemplate>
                        <InsertItemTemplate >
                            <div class="col-xs-11 col-insert">
                            <asp:TextBox ID="txtRecipesID" runat="server" Text='<%# Bind("RecipesID") %>' CssClass="form-control" MaxLength="50"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RecipesID is required:" ControlToValidate="txtRecipesID" CssClass="text-danger"></asp:RequiredFieldValidator>
                            </div>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblRecipesID" runat="server" Text='<%# Bind("RecipesID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="RecipesName" SortExpression="RecipesName">
                        <EditItemTemplate>
                            <asp:TextBox ID="LblRecipesName" runat="server" Text='<%# Bind("RecipesName") %>'></asp:TextBox>
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
                            <asp:TextBox ID="lblDiscription" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <div class="col-xs-11 col-insert">
                            <asp:TextBox ID="txtDiscription" runat="server" Text='<%# Bind("Description") %>' MaxLength="100" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="txtDiscription" ControlToValidate="txtDiscription" CssClass="text-danger"></asp:RequiredFieldValidator>
                            </div>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDiscription" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:PantryWiseDBConnectionString %>" DeleteCommand="DELETE FROM [Recipes] WHERE [RecipesID] = @original_RecipesID AND (([UserID] = @original_UserID) OR ([UserID] IS NULL AND @original_UserID IS NULL)) AND (([RecipesName] = @original_RecipesName) OR ([RecipesName] IS NULL AND @original_RecipesName IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL))" InsertCommand="INSERT INTO [Recipes] ([UserID], [RecipesID], [RecipesName], [Description]) VALUES (@UserID, @RecipesID, @RecipesName, @Description)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [UserID], [RecipesID], [RecipesName], [Description] FROM [Recipes] WHERE ([UserID] = @UserID)" UpdateCommand="UPDATE [Recipes] SET [UserID] = @UserID, [RecipesName] = @RecipesName, [Description] = @Description WHERE [RecipesID] = @original_RecipesID AND (([UserID] = @original_UserID) OR ([UserID] IS NULL AND @original_UserID IS NULL)) AND (([RecipesName] = @original_RecipesName) OR ([RecipesName] IS NULL AND @original_RecipesName IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_RecipesID" Type="Int32" />
                    <asp:Parameter Name="original_UserID" Type="Int32" />
                    <asp:Parameter Name="original_RecipesName" Type="String" />
                    <asp:Parameter Name="original_Description" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="UserID" Type="Int32" />
                    <asp:Parameter Name="RecipesID" Type="Int32" />
                    <asp:Parameter Name="RecipesName" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvRecipes" Name="UserID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="UserID" Type="Int32" />
                    <asp:Parameter Name="RecipesName" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="original_RecipesID" Type="Int32" />
                    <asp:Parameter Name="original_UserID" Type="Int32" />
                    <asp:Parameter Name="original_RecipesName" Type="String" />
                    <asp:Parameter Name="original_Description" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <div class="row">
            <div class="col-xs-6">
                <asp:Label ID="lblError" runat="server" CssClass="text-danger" EnableViewState="False"></asp:Label>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Please fix these issues:" class="text-danger"/>
            </div>
        </div>
   </div>
</asp:Content>
