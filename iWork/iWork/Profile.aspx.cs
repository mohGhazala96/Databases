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
    public partial class Profile : System.Web.UI.Page
    {
        string connStr= ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                if (!IsPostBack)
                {
                    SqlConnection conn = new SqlConnection(connStr);

                    SqlCommand cmd = new SqlCommand("View_Information", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@username", Session["Username"].ToString()));

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                    while (reader.Read())
                    {
                        txt_username.Text = reader.GetString(reader.GetOrdinal("username"));
                        txt_personal_email.Text = reader.GetString(reader.GetOrdinal("personal_email"));
                        txt_first_name.Text = reader.GetString(reader.GetOrdinal("first_name"));
                        txt_middle_name.Text = reader.GetString(reader.GetOrdinal("middle_name"));
                        txt_last_name.Text = reader.GetString(reader.GetOrdinal("last_name"));
                        txt_birth_date.Text = reader.GetDateTime(reader.GetOrdinal("birth_date")).ToString();
                        lbl_age_value.Text = "" + reader.GetInt32(reader.GetOrdinal("age"));
                        txt_years_of_exp.Text = reader.GetInt32(reader.GetOrdinal("years_of_experience")).ToString();
                    }

                }
                Staff_Member.Visible = false;
                Regular_Employee.Visible = false;
                Manager.Visible = false;
                HR_Employee.Visible = false;
                Job_Seeker.Visible = false;
                switch (Session["userType"])
                {
                    case "Manager":
                        Staff_Member.Visible = true;
                        Manager.Visible = true;
                        break;
                    case "Regular Employee":
                        Staff_Member.Visible = true;
                        Regular_Employee.Visible = true;
                        break;
                    case "HR Employee":
                        Staff_Member.Visible = true;
                        HR_Employee.Visible = true;
                        break;
                    case "Job Seeker":
                        Job_Seeker.Visible = true;
                        break;
                    default:
                        Staff_Member.Visible = false;
                        Regular_Employee.Visible = false;
                        HR_Employee.Visible = false;
                        Manager.Visible = false;
                        Job_Seeker.Visible = false;
                        break;
                }
            }
            else
            {
                Response.Redirect("Login.aspx", true);
            }
        }

        protected void changePass(object sender, EventArgs e)
        {
            Response.Redirect("changePassword.aspx",true);
        }
        protected void updateInfo(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand cmd = new SqlCommand("Edit", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@oldusername", Session["Username"].ToString()));
                cmd.Parameters.Add(new SqlParameter("@newusername", txt_username.Text));
                cmd.Parameters.Add(new SqlParameter("@personal_email", txt_personal_email.Text));
                cmd.Parameters.Add(new SqlParameter("@birth_date", DateTime.Parse(txt_birth_date.Text)));
                cmd.Parameters.Add(new SqlParameter("@years_of_experience", Int32.Parse(txt_years_of_exp.Text)));
                cmd.Parameters.Add(new SqlParameter("@first_name", txt_first_name.Text));
                cmd.Parameters.Add(new SqlParameter("@middle_name", txt_middle_name.Text));
                cmd.Parameters.Add(new SqlParameter("@last_name", txt_last_name.Text));
                // output parm
                SqlParameter output = cmd.Parameters.Add(new SqlParameter("@result", SqlDbType.Int));
                output.Direction = ParameterDirection.Output;
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                if (output.Value.ToString().Equals("1"))
                {
                    lbl_info_status.Text = "Information Updated";
                    Session["Username"] = txt_username.Text;
                }
                else
                {
                    lbl_info_status.Text = "New username is already taken";
                }
            }catch{
                lbl_info_status.Text = "An error occured. Please make sure that you input valid information";
            }
        }
        protected void checkIn(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand cmd = new SqlCommand("Check_in", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@username", Session["Username"].ToString()));
                SqlParameter output = cmd.Parameters.Add(new SqlParameter("@result", SqlDbType.Int));
                output.Direction = ParameterDirection.Output;
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                if (output.Value.ToString().Equals("1"))
                {
                    lbl_shoutbox.Text = "Checked in";
                }
                else if (output.Value.ToString().Equals("2"))
                {
                    lbl_shoutbox.Text = "Already Checked in today";
                }
                else
                {
                    lbl_shoutbox.Text = "Trying to check in on a day off";
                }
            }catch{
                lbl_shoutbox.Text = "Invalid checkin";
            }
        }
        protected void checkOut(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand cmd = new SqlCommand("Check_out", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@username", Session["Username"].ToString()));
                SqlParameter output = cmd.Parameters.Add(new SqlParameter("@result", SqlDbType.Int));
                output.Direction = ParameterDirection.Output;
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                if (output.Value.ToString().Equals("1"))
                {
                    lbl_shoutbox.Text = "Checked out";
                }
                else
                {
                    lbl_shoutbox.Text = "Trying to checkout while you didn't check in";
                }
            }catch{
                lbl_shoutbox.Text = "Checkout invalid";
            }
        }
        protected void checkAttendance(object sender, EventArgs e)
        {
            Response.Redirect("Check_Attendance.aspx",true);
        }
        protected void leaveRequest(object sender, EventArgs e)
        {
            Response.Redirect("Leave_Request.aspx", true);
        }
        protected void businessRequest(object sender, EventArgs e)
        {
            Response.Redirect("Business_Request.aspx", true);
        }
        protected void viewRequests(object sender, EventArgs e)
        {
            Response.Redirect("View_Requests.aspx", true);
        }
        protected void sendEmail(object sender, EventArgs e)
        {
            Response.Redirect("Send_Email.aspx", true);
        }
        protected void viewEmails(object sender, EventArgs e)
        {
            Response.Redirect("View_Emails.aspx", true);
        }
        protected void viewAnnouncements(object sender, EventArgs e)
        {
            Response.Redirect("View_Announcements.aspx", true);
        }
        protected void viewRequests_manager(object sender, EventArgs e)
        {
            Response.Redirect("Manager/ViewReuqests_Manager.aspx", true);
        }
        protected void ReviewRequests_manager(object sender, EventArgs e)
        {
            Response.Redirect("Manager/ReviewRequests_manager.aspx", true);
        }
        protected void ReviewJobs_manager(object sender, EventArgs e)
        {
            Response.Redirect("Manager/viewJobsManager.aspx", true);
        }
        protected void Create_Projects_manager(object sender, EventArgs e)
        {
            Response.Redirect("Manager/Create_Projects_Manager.aspx", true);
        }
        protected void assignRegularOnProject_manager(object sender, EventArgs e){
            Response.Redirect("Manager/AssignEmployeesOnProject.aspx", true);

        }
        protected void removeRegularOnProject_manager(object sender, EventArgs e)
        {
            Response.Redirect("Manager/RemoveRegularEmployeeProject_manager.aspx", true);

        }
        //DefineTask_manager
        protected void defineTask_manager(object sender, EventArgs e)
        {
            Response.Redirect("Manager/DefineTask_manager.aspx", true);

        }
        protected void ChangeRegular_manager(object sender, EventArgs e)
        {
            Response.Redirect("Manager/ChangeRegularOnTask.aspx", true);

        }
        protected void ReviewTask_manager(object sender, EventArgs e)
        {
            Response.Redirect("Manager/ReviewTaskInProject_Main.aspx", true);

        }

        // HR Employees
        protected void HR_Employees_Add_Job(object sender, EventArgs e)
        {
            Response.Redirect("HR/Add_Job.aspx", true);
        }

        protected void HR_Employees_Create_Announcement(object sender, EventArgs e)
        {
            Response.Redirect("HR/Create_Announcement.aspx", true);
        }

        protected void HR_Employees_High_Achievers(object sender, EventArgs e)
        {
            Response.Redirect("HR/High_Achievers.aspx", true);
        }

        protected void HR_Employees_List_Jobs(object sender, EventArgs e)
        {
            Response.Redirect("HR/List_Jobs.aspx", true);
        }

        protected void HR_Employees_Total_Hours(object sender, EventArgs e)
        {
            Response.Redirect("HR/Total_Hours.aspx", true);
        }

        protected void HR_Employees_View_Applications(object sender, EventArgs e)
        {
            Response.Redirect("HR/View_Applications.aspx", true);
        }

        protected void HR_Employees_View_Attendance(object sender, EventArgs e)
        {
            Response.Redirect("HR/View_Attendance.aspx", true);
        }

        protected void HR_Employees_View_Requests(object sender, EventArgs e)
        {
            Response.Redirect("HR/View_Requests.aspx", true);
        }
    }
}
