using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArticulosWeb
{
	public partial class Error : System.Web.UI.Page
	{
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["error"] != null)
                lblError.Text = Session["error"].ToString();
        }
        protected void btnVolver_Click(object sender, EventArgs e)
        {   
            Response.Redirect("~/Default.aspx");
        }

    }
}