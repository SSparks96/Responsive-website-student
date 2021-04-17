using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;
using System.Windows;

namespace pantry_app.Pages
{
    public partial class login1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            


        }
        
        protected void registerBtn_Click(object sender, EventArgs e)
        {
           
                Response.Redirect("UserRegistration.aspx");
            
            
        }

        protected void loginBtn_Click1(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = @"Data Source = pantrywise.database.windows.net; Initial Catalog = PantryWiseDB; Persist Security Info = True; User ID = PantryWise; Password = PantryApp1";
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select * from [UserRegistration]where Email=@Email and Password=@Password";
            //cmd.CommandText = "select * from [UserRegistration]where Password=@Password";
            cmd.Parameters.AddWithValue("@Email", LoginEmailTxt.Text);
            cmd.Parameters.AddWithValue("@Password", LoginPasswordTxt.Text);
            cmd.Connection = con;
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.HasRows && IsValid)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                Label1.Visible = true;
                Label1.Text = "Email or Password is incorrect. Please try again";
            }

        }
    }
}