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
        protected void gvRecipes_PreRender(object sender, EventArgs e)
        {
            gvRecipes.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void gvRecipes_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}