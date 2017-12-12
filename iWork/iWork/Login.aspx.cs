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

    public partial class Login : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        protected void Page_Load(object sender, EventArgs e){

        }

        protected void login(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("login", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            string username = txt_username.Text;
            string password = txt_password.Text;
            cmd.Parameters.Add(new SqlParameter("@username", username));
            cmd.Parameters.Add(new SqlParameter("@password", password));

            // output parm
            SqlParameter output = cmd.Parameters.Add(new SqlParameter("@out", SqlDbType.VarChar));
            output.Direction = ParameterDirection.Output;
            output.Size = 100;
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            if(!output.Value.ToString()[0].Equals('I')){
                Session["Username"] = username;
                switch(output.Value.ToString()[0]){
                    case 'M':
                        Session["userType"] = "Manager";
                        break;
                    case 'J':
                        Session["userType"] = "Job Seeker";
                        break;
                    case 'H':
                        Session["userType"] = "HR Employee";
                        break;
                    case 'R':
                        Session["userType"] = "Regular Employee";
                        break;
                }
                Response.Redirect("Profile.aspx",true);
            }else{
            }
        }
    }
}
