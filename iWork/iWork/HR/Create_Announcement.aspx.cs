using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace iWork.HR
{
    public partial class Create_Announcement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write("a7a?");
            if (Session["userType"] == null || Session["userType"].ToString() != "HR Employee")
            {
                data.Visible = false;
                return;
            }
            else
            {
                error.Visible = false;
            }

            if (IsPostBack) {
                error.Visible = false;

                string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand cmd = new SqlCommand("HR_Employees_create_announcement", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@username", Session["Username"]));
                cmd.Parameters.Add(new SqlParameter("@title", title.Text));
                cmd.Parameters.Add(new SqlParameter("@type", type.Text));
                cmd.Parameters.Add(new SqlParameter("@description", description.Text));

                conn.Open();
                int affectedRows = cmd.ExecuteNonQuery();
                conn.Close();

                if (affectedRows < 1)
                {
                    error.Visible = true;
                    data.Visible = false;
                    error.Text = "Creating announcement failed.";
                    return;
                }
            }
        }
    }
}