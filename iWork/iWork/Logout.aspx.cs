using System;
using System.Web;
using System.Web.UI;

namespace iWork
{

    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Username"] = null;
            Session["userType"] = null;
            Response.Redirect("Default.aspx",true);
        }
    }
}
