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
    public partial class View_Requests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userType"] == null || Session["userType"].ToString() != "HR Employee")
            {
                data.Visible = false;
                error.Visible = true;
                return;
            }
            else
            {
                error.Visible = false;
            }

            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("HR_Employees_view_requests", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@username", Session["Username"]));

            conn.Open();

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);

            if (ds.Tables[0].Rows.Count < 1 && ds.Tables[1].Rows.Count < 1)
            {
                error.Visible = true;
                data.Visible = false;
                error.Text = "No requests found.";
                conn.Close();
                return;
            }

            business.DataSource = ds.Tables[0];
            business.DataBind();

            leave.DataSource = ds.Tables[1];
            leave.DataBind();

            conn.Close();
        }

        protected void requestAction(object sender, GridViewCommandEventArgs e)
        {

            String response = "";

            if (e.CommandName.ToString().StartsWith("accept"))
            {
                response = "Approved";
            }
            else if (e.CommandName.ToString().StartsWith("reject"))
            {
                response = "Rejected";
            }

            GridView the_view = null;

            if(e.CommandName.ToString().EndsWith("Business"))
            {
                the_view = business;
            } else if (e.CommandName.ToString().EndsWith("Leave"))
            {
                the_view = leave;
            }

            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("HR_Employees_update_requests", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@username", Session["Username"]));
            cmd.Parameters.Add(new SqlParameter("@applicant", the_view.Rows[int.Parse(e.CommandArgument.ToString())].Cells[2].Text));
            cmd.Parameters.Add(new SqlParameter("@start_date", DateTime.Parse(the_view.Rows[int.Parse(e.CommandArgument.ToString())].Cells[0].Text)));
            cmd.Parameters.Add(new SqlParameter("@response", response));

            conn.Open();
            int affectedRows = cmd.ExecuteNonQuery();
            conn.Close();

            if (affectedRows < 1)
            {
                error.Visible = true;
                data.Visible = false;
                error.Text = "Updating request status failed. User doesn't have enough annual leaves.";
                return;
            }
            else
            {
                // Refresh page
                Response.Redirect(Request.RawUrl);
            }
        }
    }
}