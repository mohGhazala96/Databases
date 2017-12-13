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


namespace iWork
{

    public partial class AssignEmployeesOnProject_Redicted : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
       


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {

                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand cmd = new SqlCommand("getRegularEmployeesAvailable", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@manager_name", Session["Username"].ToString()));
                cmd.Parameters.Add(new SqlParameter("@project_name_in",   Session["ProjectFor_RegualrEmployees_Avialable"].ToString()   ));

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
                    employeeName.Text = "<br />"+"Title: " + employee_text

                       + "<br />";
                    Button AddEmployee = new Button();
                    AddEmployee.ID = employee_text;
                    form1.Controls.Add(employeeName);
                    AddEmployee.Text = "Add";

                    AddEmployee.Click += new EventHandler(AddRegular);
                    form1.Controls.Add(AddEmployee);
                }

            }
            else
            {
                Response.Redirect("Login.aspx", true);
            }


        }
        protected void AddRegular(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("Assign_regular_employees_on_projects", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@manager_name", Session["Username"].ToString()));
            cmd.Parameters.Add(new SqlParameter("@project_name_in", Session["ProjectFor_RegualrEmployees_Avialable"].ToString() ));
            cmd.Parameters.Add(new SqlParameter("@regular_employee_in", ((Button)sender).ID  ));
   

            conn.Open();
            cmd.ExecuteNonQuery();


            conn.Close();
            Response.Redirect("AssignEmployeesOnProject_Redicted.aspx", true);



        }
    }
}
