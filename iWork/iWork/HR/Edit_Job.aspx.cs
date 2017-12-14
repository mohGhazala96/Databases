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
    public partial class Edit_Job : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            error.Text = "";
            error.Visible = false;

            if (Session["userType"] == null || Session["userType"].ToString() != "HR Employee")
            {
                error.Text = "You are not logged in or you are not an HR employee.";
                data.Visible = false;
                error.Visible = true;
                return;
            }

            if (Request.QueryString["title"] == null)
            {
                error.Text = "title GET parameter is missing. Please access this page properly.";
                data.Visible = false;
                error.Visible = true;
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            if (!IsPostBack)
            {
                SqlCommand cmd = new SqlCommand("HR_Employees_view_job", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@username", Session["Username"].ToString()));
                cmd.Parameters.Add(new SqlParameter("@title", Request.QueryString["title"]));

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                if (!reader.Read())
                {
                    error.Visible = true;
                    data.Visible = false;
                    error.Text = "Job title not found";
                    return;
                }

                title.Text = reader.GetString(reader.GetOrdinal("title"));
                short_description.Text = reader.GetString(reader.GetOrdinal("short_description"));
                detailed_description.Text = reader.GetString(reader.GetOrdinal("detailed_description"));
                min_experience.Text = reader.GetInt32(reader.GetOrdinal("min_experience")).ToString();
                salary.Text = reader.GetInt32(reader.GetOrdinal("salary")).ToString();
                deadline.Text = reader.GetDateTime(reader.GetOrdinal("deadline")).ToString();
                no_of_vacancies.Text = reader.GetInt32(reader.GetOrdinal("no_of_vacancies")).ToString();
                working_hours.Text = reader.GetInt32(reader.GetOrdinal("working_hours")).ToString();

                reader.Close();

                SqlCommand cmd2 = new SqlCommand("HR_Employees_view_job_question", conn);
                cmd2.CommandType = CommandType.StoredProcedure;
                cmd2.Parameters.Add(new SqlParameter("@username", Session["Username"].ToString()));
                cmd2.Parameters.Add(new SqlParameter("@title", Request.QueryString["title"]));

                SqlDataAdapter sda = new SqlDataAdapter(cmd2);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                grid.DataSource = dt;
                grid.DataBind();

                conn.Close();
            }
            else
            {
                SqlCommand cmd = new SqlCommand("HR_Employees_update_job", conn);

                int my_min_experience;
                float my_salary;
                DateTime my_deadline;
                int my_no_of_vacancies;
                int my_working_hours;

                if (!int.TryParse(min_experience.Text, out my_min_experience))
                {
                    error.Text += " Minimum experience is not a numeric string.";
                }

                if (!float.TryParse(salary.Text, out my_salary))
                {
                    error.Text += " Salary is not a numeric string.";
                }

                if (!DateTime.TryParse(deadline.Text, out my_deadline))
                {
                    error.Text += " Deadline is not a valid Datetime string.";
                }

                if (!int.TryParse(no_of_vacancies.Text, out my_no_of_vacancies))
                {
                    error.Text += " Number of vacancies is not a numeric string.";
                }

                if (!int.TryParse(working_hours.Text, out my_working_hours))
                {
                    error.Text += " Working hours is not a numeric string.";
                }

                if (error.Text != "")
                {
                    error.Visible = true;
                    return;
                }

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@username", Session["Username"].ToString()));
                cmd.Parameters.Add(new SqlParameter("@title", Request.QueryString["title"]));
                cmd.Parameters.Add(new SqlParameter("@new_title", title.Text));
                cmd.Parameters.Add(new SqlParameter("@new_short_description", short_description.Text));
                cmd.Parameters.Add(new SqlParameter("@new_detailed_description", detailed_description.Text));
                cmd.Parameters.Add(new SqlParameter("@new_min_experience", Int32.Parse(min_experience.Text)));
                cmd.Parameters.Add(new SqlParameter("@new_salary", Int32.Parse(salary.Text)));
                cmd.Parameters.Add(new SqlParameter("@new_deadline", DateTime.Parse(deadline.Text)));
                cmd.Parameters.Add(new SqlParameter("@new_no_of_vacancies", Int32.Parse(no_of_vacancies.Text)));
                cmd.Parameters.Add(new SqlParameter("@new_working_hours", Int32.Parse(working_hours.Text)));

                conn.Open();
                int affectedRows = cmd.ExecuteNonQuery();
                conn.Close();

                if (affectedRows < 1)
                {
                    error.Visible = true;
                    error.Text = "Updating job didn't work, please check all fields and try again.";
                }
                else
                {
                    Response.Redirect("/HR/Edit_Job.aspx?title=" + title.Text);
                }
            }
        }
    }
}