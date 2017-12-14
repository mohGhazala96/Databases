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

    public partial class RemoveRegularEmployeeProject_manager : System.Web.UI.Page
    {
        
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
     


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {

                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand cmd = new SqlCommand("getProjectsAviavlableHavingRegularEmpolyees", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@manager_name", Session["Username"].ToString()));

                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                Label Title = new Label();
                Title.Text = "Choose the Project you want to remove Regular Empolyees from" + "<br />" + "<br />";

                form1.Controls.Add(Title);
                if (!rdr.HasRows)
                {
                    Label errorName = new Label();
                    errorName.Text = "No Projects are available";

                    form1.Controls.Add(errorName);
                }
                while (rdr.Read())
                {
                  
                    Label projectTitle = new Label();
                    string project_title = rdr.GetString(rdr.GetOrdinal("project_name"));
                    projectTitle.Text = "<br />"+"ProjectTitle: " +project_title
                 
                       + "<br />";
                    Button ViewRegularEmployees = new Button();
                    ViewRegularEmployees.CommandName = rdr.GetString(rdr.GetOrdinal("project_name"));
                    form1.Controls.Add(projectTitle);
                    ViewRegularEmployees.Text = "See regeluar Employees avaliable";

                    ViewRegularEmployees.Click += new EventHandler(viewRegularEmployeesAvailable);
                    form1.Controls.Add(ViewRegularEmployees);

                }


            }
            else
            {
                Response.Redirect("Login.aspx", true);
            }


        }
        protected void viewRegularEmployeesAvailable(object sender, EventArgs e){
            Session["ProjectFor_RegualrEmployees_Avialable"] = ((Button)sender).CommandName;
            Response.Redirect("RemoveRegularEmployeeProject_manager_Redirected.aspx", true);

            
        }
            
    
    }
}
