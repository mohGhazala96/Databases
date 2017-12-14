using System;

using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace iWork
{

    public partial class Create_Projects_Manager : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        protected void createProject(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connStr);


            SqlCommand cmd = new SqlCommand("Create_project", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@manager_name", Session["Username"].ToString()));
            cmd.Parameters.Add(new SqlParameter("@name_in", project_name_input.Text));

            try
            {
                cmd.Parameters.Add(new SqlParameter("@start_date_in", DateTime.Parse(startDate_input.Text)));
                cmd.Parameters.Add(new SqlParameter("@end_date_in", DateTime.Parse(endDate_input.Text))); 
                if (project_name_input.Text.Length == 0 || startDate_input.Text.Length == 0 || endDate_input.Text.Length == 0)
                {


                    Response.Write("Fill all inputs");

                }
                else
                {

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Write("Succeeded");
                    Response.Redirect("Create_Projects_Manager.aspx", true);


                }
            }
            catch
            {
                Response.Write("Write the date in a valid form");

            }

         

        
        }

    }
}
