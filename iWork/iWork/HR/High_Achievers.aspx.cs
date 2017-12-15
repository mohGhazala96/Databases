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
            }
            else if (my_month < 1 || my_month > 12)
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

        protected void congratulate(object sender, EventArgs e)
        {
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
            }
            else if (my_month < 1 || my_month > 12)
            {
                error.Text = "Month has invalid numerical format.";
                error.Visible = true;
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            for (int i = 0; i < grid.Rows.Count; i++)
            {
                SqlCommand cmd = new SqlCommand("Send_email", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@sender", Session["Username"].ToString()));
                cmd.Parameters.Add(new SqlParameter("@recipient", grid.Rows[i].Cells[0].Text));
                cmd.Parameters.Add(new SqlParameter("@subject", "Congratulations! You're a high achiever!"));
                cmd.Parameters.Add(new SqlParameter("@body", "Congratulations, you're a high achiever for month " + month.Text + " of year " + year.Text + "."));

                SqlParameter output = cmd.Parameters.Add(new SqlParameter("@result", SqlDbType.Int));
                output.Direction = ParameterDirection.Output;
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                error.Text = "";

                if (output.Value.ToString() == "1")
                {
                    error.Text = "Email Sent Successfully";
                }
                else if (output.Value.ToString() == "0")
                {
                    error.Text = "Sorry, You are trying to send an email to someone not in your company";
                }
                else
                {
                    error.Text = "Sorry an error occured";
                }

                error.Visible = true;
            }
        }
    }
}