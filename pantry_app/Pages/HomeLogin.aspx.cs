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
            Response.Redirect("Default.aspx");
        }
    }
}