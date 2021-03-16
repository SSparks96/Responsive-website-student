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
                <asp:BoundField HeaderText="Item Name" />
                <asp:BoundField HeaderText="Category ID" />
                <asp:BoundField HeaderText="Item ID" />
                <asp:BoundField HeaderText="Units of Measurement" />
                <asp:BoundField HeaderText="Quantity on Hand" />
            </Columns>
        </asp:GridView>
    </p>
    <p>
        
        &nbsp;</p>
    <p>
 <div class="col-xs-12">
                <p>To create a new category, enter the category information 
                    and click Add New Category</p>
                <p><asp:Label ID="lblError" runat="server" EnableViewState="false" 
                        CssClass="text-danger"></asp:Label></p>

                <div class="form-group">
                    <label for="txtID" class="col-sm-2">CategoryID</label>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txtID" runat="server" MaxLength="10" 
                            CssClass="form-control"></asp:TextBox>
                    </div>
                   <div class="form-group">
                    <label for="txtID" class="col-sm-2">Item Name</label>
                    <div class="col-sm-3">
                        <asp:TextBox ID="TextBox1" runat="server" MaxLength="10" 
                            CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label for="txtItemtName" class="col-sm-2">Short Name</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtItemName" runat="server" MaxLength="15" 
                            CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-offset-2 col-sm-4">
                        <asp:RequiredFieldValidator ID="rfvUnitOfMeasurement" runat="server" 
                        ControlToValidate="txtUnitOfMeasurement" CssClass="text-danger" 
                        ErrorMessage="Measurement is a required field">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>              
                <div class="form-group">
                    <label for="txtLongName" class="col-sm-2">Long Name</label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="txtLongName" runat="server" MaxLength="50" 
                            CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-4">
                        <asp:RequiredFieldValidator ID="rfvQuantityOnHand" runat="server" 
                        ControlToValidate="txtQuantityOnHand" CssClass="text-danger" 
                        ErrorMessage="Quantity on hand is a required field">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>

                <asp:Button ID="btnAdd" runat="server" Text="Add New Item" 
                    CssClass="btn" OnClick="btnAdd_Click" />
            </div>  

        
    </p>
    <p>
        
        &nbsp;</p>
    <p>
        
        &nbsp;</p>

    </asp:Content>
