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
    public partial class View_Applications : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userType"] == null || Session["userType"].ToString() != "HR Employee")
            {
                data.Visible = false;
                form1.Visible = false;
                error.Visible = true;
                return;
            }
            else
            {
                error.Visible = false;
            }

            if (Request.QueryString["title"] == null)
            {
                grid.Visible = false;

                if (IsPostBack)
                {
                    Response.Redirect("/HR/View_Applications.aspx?title=" + job_title.Text);
                }

                return;
            }

            form1.Visible = false;

            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("HR_Employees_view_applications", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@username", Session["Username"]));
            cmd.Parameters.Add(new SqlParameter("@job_title", Request.QueryString["title"]));

            conn.Open();

            if (cmd.ExecuteScalar() == null)
            {
                error.Visible = true;
                grid.Visible = false;
                error.Text = "No applications found for a job with this title.";
                return;
            }

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            grid.DataSource = dt;
            grid.DataBind();

            conn.Close();
        }

        protected void applicationAction(object sender, GridViewCommandEventArgs e)
        {
            String response = "";

            if(e.CommandName.ToString() == "acceptApplication")
            {
                response = "Approved";
            } else if(e.CommandName.ToString() == "rejectApplication")
            {
                response = "Rejected";
            }

            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("HR_Employees_accept_reject_applications", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@username", Session["Username"]));
            cmd.Parameters.Add(new SqlParameter("@job_seeker", grid.Rows[int.Parse(e.CommandArgument.ToString())].Cells[5].Text));
            cmd.Parameters.Add(new SqlParameter("@job", grid.Rows[int.Parse(e.CommandArgument.ToString())].Cells[0].Text));
            cmd.Parameters.Add(new SqlParameter("@response", response));

            conn.Open();
            int affectedRows = cmd.ExecuteNonQuery();
            conn.Close();

            if (affectedRows < 1)
            {
                error.Visible = true;
                grid.Visible = false;
                error.Text = "Updating application status failed.";
                return;
            } else
            {
                // Refresh page
                Response.Redirect(Request.RawUrl);
            }
        }
    }
}