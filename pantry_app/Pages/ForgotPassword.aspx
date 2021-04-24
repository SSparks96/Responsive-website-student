<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="pantry_app.ForgotPassword" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Login Page</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
.login-form {
    width: 340px;
    margin: 50px auto;
  	font-size: 15px;
}
.login-form form {
    margin-bottom: 15px;
    background: #f7f7f7;
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    padding: 30px;
}
.login-form h2 {
    margin: 0 0 15px;
}
.form-control, .btn {
    min-height: 38px;
    border-radius: 2px;
}
.btn {        
    font-size: 15px;
    font-weight: bold;
}
</style>
</head>
<body>
<div class="login-form">
    <form runat="server">
        <h3 class="text-center">Welcome</h3> 
        <h4 class="text-center">Use this to recover your password</h4>       

        <div class="clearfix">
        <div class="form-group">
            <asp:TextBox ID="ForgotPasswordlTxt" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Show Password" CssClass="btn btn-primary btn-block" OnClick="Button1_Click" />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="281px">
                <Columns>
                    <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                </Columns>
            </asp:GridView>
            <asp:Button ID="Button2" runat="server" CssClass="btn btn-danger btn-block" Text="Return to the login screen" OnClick="Button2_Click" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PantryWiseDBConnectionString %>" SelectCommand="SELECT DISTINCT [Password] FROM [UserRegistration] WHERE ([Email] = @Email)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ForgotPasswordlTxt" DefaultValue="null" Name="Email" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        </div>
    </form>
    </div>
    <p>
        &nbsp;</p>
</body>
</html>
