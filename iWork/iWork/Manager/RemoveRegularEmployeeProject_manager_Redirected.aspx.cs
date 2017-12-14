using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


namespace iWork.Manager
{

    public partial class RemoveRegularEmployeeProject_manager_Redirected : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();



        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {

                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand cmd = new SqlCommand("getRegularEmployeesWorkingOnProject", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@manager_name", Session["Username"].ToString()));
                cmd.Parameters.Add(new SqlParameter("@project_name_in", Session["ProjectFor_RegualrEmployees_Avialable"].ToString()));

                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (!rdr.HasRows)
                {
                    Label errorName = new Label();
                    errorName.Text = "No regular Employees are available";

                    form1.Controls.Add(errorName);
                }
                while (rdr.Read())
                {

                    Label employeeName = new Label();
                    string employee_text = rdr.GetString(rdr.GetOrdinal("username"));
                    employeeName.Text = "<br />" + "Title: " + employee_text

                       + "<br />";
                    Button RemoveEmployee = new Button();
                    RemoveEmployee.CssClass = "table table-striped";
                    RemoveEmployee.ID = rdr.GetString(rdr.GetOrdinal("username"));
                    form1.Controls.Add(employeeName);
                    RemoveEmployee.Text = "Remove";

                    RemoveEmployee.Click += new EventHandler(RemoveRegular);
                    form1.Controls.Add(RemoveEmployee);
                }

            }
            else
            {
                Response.Redirect("Login.aspx", true);
            }


        }
        protected void RemoveRegular(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("Remove_regular_employee_from_project", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@manager_name", Session["Username"].ToString()));
            cmd.Parameters.Add(new SqlParameter("@project_name_in", Session["ProjectFor_RegualrEmployees_Avialable"].ToString()));
            cmd.Parameters.Add(new SqlParameter("@regular_employee_in", ((Button)sender).ID));


            conn.Open();
            cmd.ExecuteNonQuery();


            conn.Close();
            Response.Redirect("RemoveRegularEmployeeProject_manager_Redirected.aspx", true);



        }
    }
}
