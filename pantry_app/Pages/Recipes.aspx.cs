using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.ComponentModel;



namespace pantry_app
{   [DataObject(true)]
    public partial class Recipes : System.Web.UI.Page
    {

        protected void gvRecipes_PreRender(object sender, EventArgs e)
        {
            gvRecipes.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
        protected void btAddRecipes_Click(object sender, EventArgs e)
        {
            
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

        protected void gvRecipes_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            if (e.Exception == null)
            {
                lblError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblError.Text = ConcurrencyErrorMessage();
            }
        }


        protected void gvRecipes_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception == null)
            {
                lblError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblError.Text = ConcurrencyErrorMessage();
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

        private string DatabaseErrorMessage(string errorMag)
        {
            return $"<b>A database error has occured:</b> {errorMag}";
        }
        private string ConcurrencyErrorMessage()
        {
            return "Another user may have updated that category. Please try again!";
        }

        protected void gvRecipes_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }




}




