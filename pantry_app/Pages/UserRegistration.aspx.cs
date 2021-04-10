using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace pantry_app.Pages
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["PantryWiseDBConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void completeRegistrationBtn_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {

                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO dbo.UserRegistration values('" + registrationEmailTxt.Text + "','" + registrationPasswordTxt.Text + "')", con);
                int t = cmd.ExecuteNonQuery();
                if (t > 0)
                {

                    autoUpdateUserRegistration();

                }

            }


        }

        protected void autoUpdateUserRegistration()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {

                con.Open();
                SqlCommand cmd = new SqlCommand("select * from UserRegistration", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (IsValid)
                {
                    string message = "Your Information was added";
                    MessageBox.Show(message);
                }
                Response.Redirect("HomeLogin.aspx");

            }

            
        }
        
    }
}