using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace pantry_app
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["PantryWiseDBConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
           

        }
        void clear()
        {

            nameTxt.Text = "";
            quantityTxt.Text = "";
        }
        protected void addFoodToGroceryList_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {

                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO dbo.groceryList values('" + groceryCategoryDdl.SelectedValue + "','" + nameTxt.Text + "','" + quantityTxt.Text + "')", con);
                int t = cmd.ExecuteNonQuery();
                if (t > 0)
                {

                    autoUpdateGroceryListTable();

                }

            }

            clear();
            autoUpdateGroceryListTable();

        }
        protected void autoUpdateGroceryListTable()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {

                con.Open();
                SqlCommand cmd = new SqlCommand("select * from groceryList", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows == true)
                {
                    GroceryListTable.DataSource = dr;
                    GroceryListTable.DataBind();


                }
            }
        }
    }
}