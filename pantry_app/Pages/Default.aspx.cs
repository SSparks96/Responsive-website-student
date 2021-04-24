using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pantry_app
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetImageUrl();
            }
        }

        private void SetImageUrl()
        {

            Random _rand = new Random();

            int i = _rand.Next(1, 16);

            Image1.ImageUrl = "~/Images/" + i.ToString() + ".jpg";
        }


        protected void Timer1_Tick(object sender, EventArgs e)
        {
            SetImageUrl();
        }

    }
}