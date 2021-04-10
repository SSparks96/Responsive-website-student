<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomeLogin.aspx.cs" Inherits="pantry_app.Pages.login1" %>

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
        <h2 class="text-center">Welcome</h2> 
        <h2 class="text-center">Login to access Pantry Wise</h2>       
        <div class="form-group">
             <asp:TextBox ID="LoginEmailTxt" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>
        </div>
        <div class="form-group">
             <asp:TextBox ID="LoginPasswordTxt" runat="server" CssClass="form-control" placeholder="Password"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button ID="loginBtn" runat="server" Text="Login" CssClass="btn btn-primary btn-block" OnClick="loginBtn_Click1" />
        </div>
        <div class="clearfix">
            <label class="float-left form-check-label"><input type="checkbox"> Remember me</label>
            <a href="#" class="float-right">Forgot Password?</a>
        </div> 
        <div class="form-group">
            <asp:Button ID="registerBtn" runat="server" Text="Please Click to Register"  CssClass="btn btn-block btn-dark" OnClick="registerBtn_Click" />
        </div>
    </form>
  
</div>
</body>
</html>
