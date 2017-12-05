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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                if(!IsPostBack){
                    SqlConnection conn = new SqlConnection(@"Server=localhost;Database=master;User Id=sa;Password=Ghand0ur");

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
                        txt_birth_date.Text = reader.GetString(reader.GetOrdinal("birth_date"));
                        lbl_age_value.Text = ""+reader.GetInt32(reader.GetOrdinal("age"));
                        txt_years_of_exp.Text = ""+reader.GetInt32(reader.GetOrdinal("years_of_experience"));

                    }
            
                }
                Staff_Member.Visible = false;
                Regular_Employee.Visible = false;
                Manager.Visible = false;
                HR_Employee.Visible = false;
                Job_Seeker.Visible = false;
                switch(Session["userType"]){
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
                Response.Redirect("Login.aspx",true);
            }
        }

        protected void changePass(object sender, EventArgs e)
        {
            Response.Redirect("changePassword.aspx",true);
        }
        protected void updateInfo(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"Server=localhost;Database=master;User Id=sa;Password=Ghand0ur");

            SqlCommand cmd = new SqlCommand("Edit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@oldusername", Session["Username"].ToString()));
            cmd.Parameters.Add(new SqlParameter("@newusername", txt_username.Text));
            cmd.Parameters.Add(new SqlParameter("@personal_email", txt_personal_email.Text));
            cmd.Parameters.Add(new SqlParameter("@birth_date", Convert.ToDateTime(txt_birth_date.Text)));
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
            if(output.Value.ToString().Equals("1")){
                Response.Write("Information Updated");
                Session["Username"] = txt_username.Text;
            }else{
                Response.Write("New username is already taken");
            }
        }
    }
}
