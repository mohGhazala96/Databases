using System;

using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace iWork.Manager
{

    public partial class DefineTask_manager : System.Web.UI.Page
    {

            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        protected void DefineTask_btn(object sender, EventArgs e)
            {
                SqlConnection conn = new SqlConnection(connStr);
           
            SqlCommand defineTask = new SqlCommand("Define_task", conn);
            SqlCommand Assign_to_Task = new SqlCommand("Assign_regular_employee_on_task", conn);

            defineTask.CommandType = CommandType.StoredProcedure;
            defineTask.Parameters.Add(new SqlParameter("@manager_name", Session["Username"].ToString()));
            defineTask.Parameters.Add(new SqlParameter("@task_in", task_in.Text));
            defineTask.Parameters.Add(new SqlParameter("@project_name_in", project_name_in.Text ));
            defineTask.Parameters.Add(new SqlParameter("@description_in", description_in.Text));
     
            Assign_to_Task.CommandType = CommandType.StoredProcedure;
            Assign_to_Task.Parameters.Add(new SqlParameter("@manager_name", Session["Username"].ToString()));
            Assign_to_Task.Parameters.Add(new SqlParameter("@task_in", task_in.Text));
            Assign_to_Task.Parameters.Add(new SqlParameter("@project_name_in", project_name_in.Text ));
            Assign_to_Task.Parameters.Add(new SqlParameter("@regular_employee_in", regularEmployee_in.Text));
            regularEmployee_in.Text = "";


                try
                {
                if (
                    project_name_in.Text.Length == 0
                    ||task_in.Text.Length == 0||
                    deadline_in.Text.Length == 0||
                    description_in.Text.Length==0)
                   
                    {
                        Response.Write("Fill all the inputs");                   

                    }
                else{
                    defineTask.Parameters.Add(new SqlParameter("@deadline_in", deadline_in.Text));

                    try
                    {
                        SqlParameter output = defineTask.Parameters.Add(new SqlParameter("@errorDetection", SqlDbType.Int));
                        SqlParameter output2 = Assign_to_Task.Parameters.Add(new SqlParameter("@errorDetection", SqlDbType.Int));

                        output.Direction = ParameterDirection.Output;
                        output2.Direction = ParameterDirection.Output;
                  
                            conn.Open();
                            defineTask.ExecuteNonQuery();
                            conn.Close();
                            if (output.Value.ToString().Equals("1"))
                            {
                                Response.Write("An error has occured");

                            }
                            conn.Open();
                            Assign_to_Task.ExecuteNonQuery();
                            conn.Close();

                            if (output2.Value.ToString().Equals("1"))
                            {
                                Response.Write("An error has occured");

                            }
                            else
                            {

                                Response.Redirect("DefineTask_manager.aspx", true);
                            }

                    }
                    catch
                    {
                        Response.Write("Make sure that the regular employee is assigned to this project");

                    }
                }
                }
                catch
                {
                    Response.Write("Write the date in a valid form");

                }
         
            }


        }
    }

     
