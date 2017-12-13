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

    public partial class ChangeRegularOnTask : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();



        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {

                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand cmd = new SqlCommand("getTasks", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@manager_name", Session["Username"].ToString()));

                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                Label Title = new Label();
                Title.Text = "Choose the Task you want to change the Regular Empolyee working in" + "<br />" + "<br />";
                form1.Controls.Add(Title);
                if (!rdr.HasRows)
                {
                    Label errorName = new Label();
                    errorName.Text = "No Taks are available";

                    form1.Controls.Add(errorName);
                }
                while (rdr.Read())
                {

                    Label projectTitle = new Label();
                    projectTitle.Text = "<br />" + "Title: " + rdr.GetString(rdr.GetOrdinal("project"));
                    Label taskTitle = new Label();
                    taskTitle.Text = " Title: " + rdr.GetString(rdr.GetOrdinal("name")) + "<br />";

                    form1.Controls.Add(projectTitle);
                    form1.Controls.Add(taskTitle);

                    Button changeRegularEmployee_btn = new Button();
                    changeRegularEmployee_btn.ID = rdr.GetString(rdr.GetOrdinal("name"))+","+rdr.GetString(rdr.GetOrdinal("project"));
                    changeRegularEmployee_btn.Text = "Change Regular Employee";
                    changeRegularEmployee_btn.Click += new EventHandler(changeRegularEmployee);
                    form1.Controls.Add(changeRegularEmployee_btn);

                }
            }
            else
            {
                Response.Redirect("Login.aspx", true);
            }
        }
        protected void changeRegularEmployee(object sender, EventArgs e)
        {
            String twoStrings = ((Button)sender).ID;
            char[] separatingChars = { ',' };  

            String[] concatination = twoStrings.Split(separatingChars);
            Session["Task_For_RegualrEmployees_Avialable"] = concatination[0];
            Session["Project_For_RegualrEmployees_Avialable"] = concatination[1];
            //Response.Write(Session["Task_For_RegualrEmployees_Avialable"]);
            //Response.Write(Session["Project_For_RegualrEmployees_Avialable"]);

            Response.Redirect("ChangeRegularOnTask_Redirected.aspx", true);
        }
    }
}
