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

    public partial class Review_Job_appliactions_manager : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        int buttonIndex = 0;
        string jobSeeker="";


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {

                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand cmd = new SqlCommand("View_All_Applications", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@manager_name", Session["Username"].ToString()));
                cmd.Parameters.Add(new SqlParameter("@job_name", Session["JobToApplication"].ToString()));

                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (!rdr.HasRows)
                {
                    Label errorName = new Label();
                    errorName.Text = "No Applications are available";

                    Review_Job_appliactions_manager_form.Controls.Add(errorName);
                }
                while (rdr.Read())
                {

                    Label application = new Label();
                    application.Text = "<b>Job:</b> " + rdr.GetString(rdr.GetOrdinal("job"))
                        + "<br/> <b>Score:</b> " + rdr.GetInt32(rdr.GetOrdinal("score"))
                        + "<br/> <b>Personal Email:</b> " + rdr.GetString(rdr.GetOrdinal("personal_email")) +
                        "<br/> <b>Birth date:</b>" + rdr.GetOrdinal("birth_date") +

                        "<br/> <b>Years of experience:</b> " + rdr.GetInt32(rdr.GetOrdinal("years_of_experience")) +
                        "<br/> <b>First Name:</b> " + rdr.GetString(rdr.GetOrdinal("first_name")) +
                        "<br/> <b>Middle Name:</b> " + rdr.GetString(rdr.GetOrdinal("middle_name")) +
                        "<br/> <b>Last Name:</b> " + rdr.GetString(rdr.GetOrdinal("last_name")) +
                        "<br/> <b>Age:</b> " + rdr.GetInt32(rdr.GetOrdinal("age")) +
                        "<br />";
                    Review_Job_appliactions_manager_form.Controls.Add(application);

                    addDetailsToRequestInput(rdr);
                }

            }
            else
            {
                Response.Redirect("Login.aspx", true);
            }


        }
        protected void acceptApplication(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("Edit_Application", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@manager_name", Session["Username"].ToString()));
            cmd.Parameters.Add(new SqlParameter("@manager_in_response", "Approved"));
            cmd.Parameters.Add(new SqlParameter("@job_seeker_in", jobSeeker));
            cmd.Parameters.Add(new SqlParameter("@job_in", Session["JobToApplication"].ToString()));

            conn.Open();
            cmd.ExecuteNonQuery();


            conn.Close();
            Response.Redirect("Review_Job_appliactions_manager.aspx", true);



        }
        protected void rejectApplication(object sender, EventArgs e)
        {


            SqlConnection conn = new SqlConnection(connStr);
  
            SqlCommand cmd = new SqlCommand("Edit_Application", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@manager_name", Session["Username"].ToString()));
                 cmd.Parameters.Add(new SqlParameter("@manager_in_response", "Rejected"));
                cmd.Parameters.Add(new SqlParameter("@job_seeker_in", jobSeeker));
                cmd.Parameters.Add(new SqlParameter("@job_in", Session["JobToApplication"].ToString()));

                conn.Open();
                cmd.ExecuteNonQuery();
         

                conn.Close();
            Response.Redirect("Review_Job_appliactions_manager.aspx", true);




        }
        private void addDetailsToRequestInput(SqlDataReader rdr)
        {
           
            Label space = new Label();
            space.Text = "  " + "<br />" + "  " + "<br />";

            Button buttonAccept = new Button();
            buttonAccept.ID = buttonIndex + "";
            buttonAccept.Text = "Accept Request";
            buttonAccept.CssClass = "btn btn-default";
            buttonAccept.Click += new EventHandler(acceptApplication);
            buttonIndex++;

            Button buttonReject = new Button();
            buttonReject.ID = buttonIndex + "";
            buttonReject.Text = "Reject Request";
            buttonReject.CssClass = "btn btn-default";
            buttonIndex++;

            buttonReject.Click += new EventHandler(rejectApplication);
            Review_Job_appliactions_manager_form.Controls.Add(buttonAccept);
            Review_Job_appliactions_manager_form.Controls.Add(buttonReject);
            Review_Job_appliactions_manager_form.Controls.Add(space);

            jobSeeker = rdr.GetString(rdr.GetOrdinal("username"));
        }

    }
}
