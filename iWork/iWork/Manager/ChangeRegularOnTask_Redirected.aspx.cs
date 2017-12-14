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

    public partial class ChangeRegularOnTask_Redirected : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        protected void DefineTask_btn(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand changeRegularOnTask = new SqlCommand("Change_regular_employee_on_a_task", conn);
            ErrorMessage.Text = "";
            changeRegularOnTask.CommandType = CommandType.StoredProcedure;
            changeRegularOnTask.Parameters.Add(new SqlParameter("@manager_name", Session["Username"].ToString() ));
            changeRegularOnTask.Parameters.Add(new SqlParameter("@project_name_in", Session["Project_For_RegualrEmployees_Avialable"].ToString()));
            changeRegularOnTask.Parameters.Add(new SqlParameter("@task_in", Session["Task_For_RegualrEmployees_Avialable"].ToString()));
            changeRegularOnTask.Parameters.Add(new SqlParameter("@regular_employee_in", RegularEmployee_in.Text));
            try
            {
                if (changeRegularEmployee.Text.Length != 0)
                {
                    conn.Open();
                    changeRegularOnTask.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("../Profile.aspx", true);

                }
                else
                {
                    ErrorMessage.Text = "<br />"+"Please enter a regular employee"+"<br />";
                }
            }
            catch{
                ErrorMessage.Text = "<br />" + "Please enter a valid regular employee" + "<br />";

            }

        }

    }
}
