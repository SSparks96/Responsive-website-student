using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pantry_app
{
    public partial class Recipes : System.Web.UI.Page
    {
       // protected void gvRecipes_SelectedIndexChanged(object sender, EntityDataSourceSelectedEventArgs e)
        //{ 
        
       // }
        
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
    
    
    }

}