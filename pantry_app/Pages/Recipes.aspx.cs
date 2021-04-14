using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;



namespace pantry_app
{
    public partial class Recipes : System.Web.UI.Page
    {



        protected void gvRecipes_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void gvRecipes_PreRender(object sender, EventArgs e)
        {
            gvRecipes.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
            }
            else if (e.AffectedRows == 0)
                lblError.Text = ConcurrencyErrorMessage();
            else
                gvRecipes.DataBind();
        }

        protected void DetailsView1_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
                lblError.Text = ConcurrencyErrorMessage();
            else
                gvRecipes.DataBind();
        }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
                e.KeepInInsertMode = true;
            }
            else
                gvRecipes.DataBind();
        }

        private string DatabaseErrorMessage(string errorMag)
        {
            return $"<b>A database error has occured:</b> {errorMag}";
        }
        private string ConcurrencyErrorMessage()
        {
            return "Another user may have updated that category. Please try again!";
        }


        protected void btAddRecipes_Click(object sender, EventArgs e)
        {
            //string sqlStmt;
            //string conString;
            // SqlConnection cn = null;
            // try
            // {

            // sqlStmt = "insert into Recipes (RecipesNum,RecipesName,Instructions) Values (@RecipeNum,@RecipesNames,@Instructions)  ";
            // conString = "PantryWiseDBConnectionString";
            // cn = new SqlConnection(conString);
            //  SqlCommand cmd = new SqlCommand(sqlStmt, cn);
            //  cmd.Parameters.Add(new SqlParameter("@RecipeNum", SqlDbType.NVarChar, 50));
            //  cmd.Parameters.Add(new SqlParameter("@RecipesName", SqlDbType.NVarChar, 50));
            //  cmd.Parameters.Add(new SqlParameter("@Instructions", SqlDbType.NVarChar, 1000));

            //  cmd.Parameters["@RecipeNum"].Value = txtNum.Text;
            //  cmd.Parameters["@RecipesName"].Value = txtName.Text;
            //  cmd.Parameters["@Instructions"].Value = txtInstruction2.Text;

            //   cn.Open();
            //   cmd.ExecuteNonQuery();
            //   Label1.Text = "Recipe added succesfully!";

            //  }
            //  catch (Exception ex)
            // {
            //    lblError.Text = DatabaseErrorMessage(ex.Message);

            //   }
            //  finally
            //  {
            // cn.Close();
            //  }
            if (IsValid)
            {
                var parameters = SqlDataSource1.InsertParameters;
                parameters["RecipeNum"].DefaultValue = txtNum.Text;
                parameters["RecipesName"].DefaultValue = txtName.Text;
                parameters["Instructions"].DefaultValue = txtInstruction2.Text;
                try
                {
                    SqlDataSource1.Insert();
                    txtNum.Text = "";
                    txtName.Text = "";
                    txtInstruction2.Text = "";
                }
                catch (Exception ex)
                {
                    lblError.Text = "A database error has occurred. " + "Message: " + ex.Message;

                }
            }
        }

        protected void btClear_Click(object sender, EventArgs e)
        {
            txtNum.Text = "";
            txtName.Text = "";
            txtInstruction2.Text = "";
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }
    }




}

