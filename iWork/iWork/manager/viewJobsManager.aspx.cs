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

    public partial class viewJobsManager : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
     


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {

                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand cmd = new SqlCommand("getJobs", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@manager_name", Session["Username"].ToString()));

                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                Label Title = new Label();
                Title.Text = "Choose the job you want to show the applicaiton for" + "<br />" + "<br />";
                viewJobsManager_from.Controls.Add(Title);
                if (!rdr.HasRows)
                {
                    Label errorName = new Label();
                    errorName.Text = "No Jobs are available";

                    viewJobsManager_from.Controls.Add(errorName);
                }
                while (rdr.Read())
                {
                  
                    Label jobTitle = new Label();
                    jobTitle.Text = "<br />"+"Title: " +rdr.GetString(rdr.GetOrdinal("title"))
                 
                       + "<br />";
                    Button jobToApplication = new Button();
                    jobToApplication.ID = rdr.GetString(rdr.GetOrdinal("title"));
                    viewJobsManager_from.Controls.Add(jobTitle);
                    jobToApplication.Text = "Open Applications";
                    jobToApplication.CssClass = "btn btn-default";

                    jobToApplication.Click += new EventHandler(openApplications);
                    viewJobsManager_from.Controls.Add(jobToApplication);

                }

            }
            else
            {
                Response.Redirect("Login.aspx", true);
            }


        }
        protected void openApplications(object sender, EventArgs e){
            Session["JobToApplication"] = ((Button)sender).ID;
            Response.Redirect("Review_Job_appliactions_manager.aspx", true);

            
        }
            
    


    }
}
