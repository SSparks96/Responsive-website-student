using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pantry_app.Pages
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        private const string APP_KEY = "viewlist";
        private object ddlCategory;

        protected void Page_Load(object sender, EventArgs e)
        {
            InventoryViewList viewlist;
            if (Application[APP_KEY] == null)
            {
                viewlist = new InventoryViewList();
                Application.Add(APP_KEY, viewlist);
            }
            else
            {
                viewlist = (InventoryViewList)Application[APP_KEY];
                BindViewGrid(viewlist.Display());
            }
        }
        protected void grdCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            InventoryView view = new InventoryView();
            view.InventoryID = grdCategory.SelectedValue.ToString();
            view.ItemName = grdCategory.SelectedRow.Cells[2].Text;
            view.Description = ddlCategory.SelectedValue.ToString();
            view.ViewCount = 1;

            Application.Lock();
            InventoryViewList viewlist = (InventoryViewList)Application[APP_KEY];
            viewlist.Add(view);
            Application.UnLock();

            BindViewGrid(viewlist.Display());
        }

        protected void Reset(object sender, EventArgs e)
        {
            grdCategory.SelectedIndex = -1;
        }


        private void BindViewGrid(List<ProductView> views)
        {
            grdViews.DataSource = views;
            grdViews.DataBind();
        }

        protected void GridView_PreRender(object sender, EventArgs e)
        {
            grdCategory.HeaderRow.TableSection = TableRowSection.TableHeader;
            if (grdViews.HeaderRow != null)
                grdViews.HeaderRow.TableSection = TableRowSection.TableHeader;
        }


    }

    internal class grdViews
    {
        internal static List<ProductView> DataSource;

        internal static void DataBind()
        {
            throw new NotImplementedException();
        }
    }

    internal class ProductView
    {
    }

    internal class InventoryView
    {
        internal object InventoryID;
        internal object ItemName;
        internal object Description;
        internal int ViewCount;
    }

    internal class InventoryViewList
    {
        internal void Add(InventoryView view)
        {
            throw new NotImplementedException();
        }

        internal List<ProductView> Display()
        {
            throw new NotImplementedException();
        }
    }

    internal class grdCategory
    {
        internal static object SelectedValue;
        internal static object SelectedRow;
        internal static int SelectedIndex;
        internal static object HeaderRow;
    }
}