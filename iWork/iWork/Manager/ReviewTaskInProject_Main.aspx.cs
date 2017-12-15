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

    public partial class ReviewTaskInProject_Main : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {

                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand cmd = new SqlCommand("getProjects", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@manager_name", Session["Username"].ToString()));

                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                Label title = new Label();
                title.Text = "Choose the Project and its Particular status" + "<br />" + "<br />";
                form1.Controls.Add(title);
                if (!rdr.HasRows)
                {
                    Label errorName = new Label();
                    errorName.Text = "No Projects are available" + "<br />" + "<br />";

                    title.Controls.Add(errorName);
                }
                while (rdr.Read())
                {
                    String projectName = rdr.GetString(rdr.GetOrdinal("name"));
                  


                    Label projectTtitle = new Label();
                    projectTtitle.Text = "<br />" +" Project: "+ projectName+"<br />";
                    form1.Controls.Add(projectTtitle);

                    Button buttonFixed = new Button();
                    buttonFixed.Text = "Fixed Status";
                    buttonFixed.Click += new EventHandler(FixedStatus);

                    Button buttonAssigned = new Button();
                    buttonAssigned.Text = "Assigned Status";
                    buttonAssigned.Click += new EventHandler(AssignedStatus);

                    Button buttonOpen = new Button();
                    buttonOpen.Text = "Open Status";
                    buttonOpen.Click += new EventHandler(OpenStatus);

                    Button buttonClosed = new Button();
                    buttonClosed.Text = "Closed Status";
                    buttonClosed.Click += new EventHandler(ClosedStatus);

                    buttonFixed.CommandName = projectName;
                    buttonAssigned.CommandName = projectName;
                    buttonOpen.CommandName = projectName;
                    buttonClosed.CommandName = projectName;

                    buttonOpen.CssClass = "btn btn-default";
                    buttonFixed.CssClass = "btn btn-default";
                    buttonAssigned.CssClass = "btn btn-default";
                    buttonClosed.CssClass = "btn btn-default";

                    form1.Controls.Add(buttonFixed);
                    form1.Controls.Add(buttonAssigned);
                    form1.Controls.Add(buttonOpen);
                    form1.Controls.Add(buttonClosed);

                }

             
            }
            else
            {
                Response.Redirect("Login.aspx", true);
            }


        }
        protected void FixedStatus(object sender, EventArgs e)
        {
            Session["StatusType"] = "Fixed";
            Session["projectName"] = ((Button)sender).CommandName;
            Response.Redirect("ReviewTaskInProject_Redirected.aspx", true);

        }
        protected void AssignedStatus(object sender, EventArgs e)
        {
            Session["StatusType"] = "Assigned";
            Session["projectName"] = ((Button)sender).CommandName;
            Response.Redirect("ReviewTaskInProject_Redirected.aspx", true);


        }
        protected void OpenStatus(object sender, EventArgs e)
        {
            Session["StatusType"] = "Open";
            Session["projectName"] = ((Button)sender).CommandName;
            Response.Redirect("ReviewTaskInProject_Redirected.aspx", true);


        }
        protected void ClosedStatus(object sender, EventArgs e)
        {
            Session["StatusType"] = "Closed";
            Session["projectName"] = ((Button)sender).CommandName;
            Response.Redirect("ReviewTaskInProject_Redirected.aspx", true);


        }
    }
}
