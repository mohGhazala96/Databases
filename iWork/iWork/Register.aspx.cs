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

    public partial class Register : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                Response.Write("You are already logged in");
                Register_Form.Visible = false;
            }
        }

        protected void registerUser(object sender, EventArgs e)
        {
            if (txt_password.Text.Equals(txt_password2.Text))
            {
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand cmd = new SqlCommand("Register", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@username", txt_username.Text));
                cmd.Parameters.Add(new SqlParameter("@password", txt_password.Text));
                cmd.Parameters.Add(new SqlParameter("@birthdate", Convert.ToDateTime(txt_birthdate.Text)));
                cmd.Parameters.Add(new SqlParameter("@years_of_experience", Int32.Parse(txt_experience.Text)));
                cmd.Parameters.Add(new SqlParameter("@first_name", txt_first_name.Text));
                cmd.Parameters.Add(new SqlParameter("@middle_name", txt_middle_name.Text));
                cmd.Parameters.Add(new SqlParameter("@last_name", txt_last_name.Text));
                cmd.Parameters.Add(new SqlParameter("@email", txt_email.Text));
                // output parm
                SqlParameter output = cmd.Parameters.Add(new SqlParameter("@result", SqlDbType.Int));
                output.Direction = ParameterDirection.Output;
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                if(output.Value.ToString().Equals("1")){
                    Session["Username"] = txt_username.Text;
                    Session["userType"] = "Job Seeker";
                    Response.Redirect("Profile.aspx",true);
                }else if(output.Value.ToString().Equals("0")){
                    Response.Write("Sorry, username taken");
                }else{
                    Response.Write("Sorry an error occured");
                }
            }
            else
            {
                Response.Write("Passwords do not match");
            }
        }

    }
}
