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

    public partial class ReviewTaskInProject_Redirected : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        int buttonIndex = 0;
        ArrayList textBoxes = new ArrayList();



        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {

                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand cmd = new SqlCommand("View_list_of_tasks_in_project", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@manager_name", Session["Username"].ToString()));
                cmd.Parameters.Add(new SqlParameter("@project_name_in", Session["projectName"].ToString()));
                cmd.Parameters.Add(new SqlParameter("@status_in", Session["StatusType"].ToString()));

                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                if (!rdr.HasRows)
                {
                    Label errorName = new Label();
                    errorName.Text = "No Taks are available";

                    form1.Controls.Add(errorName);
                }
                Label taskMainTitle = new Label();
                taskMainTitle.Text = "Tasks";
                form1.Controls.Add(taskMainTitle);


                if (!Session["StatusType"].Equals("Fixed")) { 
                while (rdr.Read())
                {
                    Label taskTitle = new Label();
                    taskTitle.Text = "<br />" + " Task: " + rdr.GetString(rdr.GetOrdinal("name")) 
                        + " Deadline: " + rdr.GetDateTime(rdr.GetOrdinal("deadline")).ToString("G")
                        + " Description: " + rdr.GetString(rdr.GetOrdinal("description"))
                        + " Regular Employee: " + rdr.GetString(rdr.GetOrdinal("regular_employee")) + "<br />";
                        form1.Controls.Add(taskTitle);


                }
                    if (rdr.NextResult())
                    {
                        Label TaskComments = new Label();
                        TaskComments.Text = "Task Comments" + "<br />";
                        form1.Controls.Add(TaskComments);
                        while (rdr.Read())
                        {
                     
                            Label taskComments = new Label();
                            taskComments.Text = "Task : " + rdr.GetString(rdr.GetOrdinal("task_name"))
                                + " Project: " + rdr.GetString(rdr.GetOrdinal("project"))+
                                " Comment:" + rdr.GetString(rdr.GetOrdinal("comment")) +  "<br />" + "<br />";

                            form1.Controls.Add(taskComments);
                        }
                    }
                }else{


                    while (rdr.Read())
                    {
                        Label taskTitle = new Label();
                        taskTitle.Text = "<br />" +"<br />" + " Task: " + rdr.GetString(rdr.GetOrdinal("name")) 
                            + " Deadline: " + rdr.GetDateTime(rdr.GetOrdinal("deadline")).ToString("G")
                            + " Description: " + rdr.GetString(rdr.GetOrdinal("description"))
                            + " Regular Employee: " + rdr.GetString(rdr.GetOrdinal("regular_employee")) + "<br />";

                        Button acceptTaskbtn = new Button();
                        acceptTaskbtn.Text = "Accept";
                        acceptTaskbtn.Click += new EventHandler(acceptTask);
                        acceptTaskbtn.CommandName = rdr.GetString(rdr.GetOrdinal("name"));

                        Label space = new Label();
                        space.Text = "<br />" + " " + "<br />";
                        Label newDeadlinetitle = new Label();
                        newDeadlinetitle.Text =   "<br />" +"New Deadline:" + "<br />";

                        Button rejectTaskbtn = new Button();
                        rejectTaskbtn.Text = "Reject";
                        rejectTaskbtn.Click += new EventHandler(rejecttTask);
                        rejectTaskbtn.CommandName = rdr.GetString(rdr.GetOrdinal("name"));

                        TextBox newDeadline = new TextBox();
                        newDeadline.Columns = 20;
                        newDeadline.Enabled = true;
                        newDeadline.Rows = 1;
                        newDeadline.TextMode = TextBoxMode.DateTime;
                        textBoxes.Add(newDeadline);
                        rejectTaskbtn.ID = buttonIndex + "";
                        buttonIndex++;

                        form1.Controls.Add(space);
                        form1.Controls.Add(taskTitle);
                        form1.Controls.Add(acceptTaskbtn);
                        form1.Controls.Add(space);
                        form1.Controls.Add(rejectTaskbtn);
                        form1.Controls.Add(newDeadlinetitle);
                        form1.Controls.Add(newDeadline);


                    }
                    if (rdr.NextResult())
                    {
                        Label TaskComments = new Label();
                        TaskComments.Text = "<br />"+ "<br />"+"Task Comments" + "<br />";
                        form1.Controls.Add(TaskComments);
                        while (rdr.Read())
                        {

                            Label taskComments = new Label();
                            taskComments.Text = "Task : " + rdr.GetString(rdr.GetOrdinal("task_name"))
                                + " Project: " + rdr.GetString(rdr.GetOrdinal("project")) +
                                " Comment:" + rdr.GetString(rdr.GetOrdinal("comment")) + "<br />" + "<br />";

                            form1.Controls.Add(taskComments);
                        }
                    }





                }


            }
        }

        protected void acceptTask(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("Review_task_in_a_project", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@manager_name", Session["Username"].ToString()));
            cmd.Parameters.Add(new SqlParameter("@task_in", ((Button)sender).CommandName  ));
            cmd.Parameters.Add(new SqlParameter("@project_name_in", Session["projectName"]));
            cmd.Parameters.Add(new SqlParameter("@accept_or_recject", 1));
            cmd.Parameters.Add(new SqlParameter("@deadline_in", ""));
            conn.Open();
            cmd.ExecuteNonQuery();
      
            conn.Close();
            Response.Redirect("ReviewTaskInProject_Redirected.aspx", true);
        }

        protected void rejecttTask(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connStr);
            String date = ((TextBox)textBoxes[ int.Parse(((Button)sender).ID)]).Text;
            if (date.Equals("")) {
            Response.Write("please enter the date as a new deadline");
            }
            else
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("Review_task_in_a_project", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@manager_name", Session["Username"].ToString()));
                    cmd.Parameters.Add(new SqlParameter("@task_in", ((Button)sender).CommandName));

                    cmd.Parameters.Add(new SqlParameter("@project_name_in", Session["projectName"]));
                    cmd.Parameters.Add(new SqlParameter("@accept_or_recject", 0));
                    cmd.Parameters.Add(new SqlParameter("@deadline_in", DateTime.Parse(date)));
                    conn.Open();
                    if( cmd.ExecuteNonQuery()==0){
                        Response.Write("please enter the date in a valid form and make sure the date you entered  is greater than the deadline");

                    }

                    conn.Close();
                    Response.Redirect("ReviewTaskInProject_Redirected.aspx", true);
                }
                catch{
                    Response.Write("please enter the date in a valid form and make sure the date you entered  is greater than the deadline");

                }
            }
        }
    }
}
