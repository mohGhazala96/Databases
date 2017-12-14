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
    public partial class View_Attendance : System.Web.UI.Page
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

            grid.Visible = false;

            if (!IsPostBack)
            {
                return;
            }

            error.Text = "";

            DateTime start = new DateTime();

            if(!DateTime.TryParse(start_date.Text, out start))
            {
                error.Text = "Start time is not a valid datetime format.";
            }

            DateTime end = new DateTime();

            if (!DateTime.TryParse(end_date.Text, out end))
            {
                error.Text += " End time is not a valid datetime format.";
            }

            if(error.Text == "")
            {
                if(end < start)
                {
                    error.Text = "End date is before start date.";
                }
            }

            if(error.Text != "") {
                error.Visible = true;
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("HR_Employees_view_attendance", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@username", Session["Username"]));
            cmd.Parameters.Add(new SqlParameter("@start_datetime", start));
            cmd.Parameters.Add(new SqlParameter("@end_datetime", end));
            cmd.Parameters.Add(new SqlParameter("@staff_member", staff_member.Text));

            conn.Open();

            if (cmd.ExecuteScalar() == null)
            {
                error.Visible = true;
                error.Text = "No attendance records found in this period.";
                return;
            }

            grid.Visible = true;

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            grid.DataSource = dt;
            grid.DataBind();

            conn.Close();
        }
    }
}