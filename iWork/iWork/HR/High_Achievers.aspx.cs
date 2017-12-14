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
    public partial class High_Achievers : System.Web.UI.Page
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

            if (!IsPostBack)
            {
                grid.Visible = false;
                return;
            }

            int my_year = 0;
            int my_month = 0;

            if (!int.TryParse(year.Text, out my_year))
            {
                error.Text = "Year has invalid numerical format.";
                error.Visible = true;
                return;
            }

            if (!int.TryParse(month.Text, out my_month))
            {
                error.Text = "Month has invalid numerical format.";
                error.Visible = true;
                return;
            } else if(my_month < 1 || my_month > 12)
            {
                error.Text = "Month has invalid numerical format.";
                error.Visible = true;
                return;
            }

            grid.Visible = true;

            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            conn.Open();
            SqlCommand cmd = new SqlCommand("HR_Employees_view_high_achievers", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@username", Session["Username"]));
            cmd.Parameters.Add(new SqlParameter("@year", my_year));
            cmd.Parameters.Add(new SqlParameter("@month", my_month));

            if (cmd.ExecuteScalar() == null)
            {
                error.Visible = true;
                error.Text = "No data found in this period.";
                return;
            }

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            grid.DataSource = dt;
            grid.DataBind();
            conn.Close();
        }
    }
}