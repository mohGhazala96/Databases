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

    public partial class changePassword : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                lbl_username.Text = "Logged in as, " + Session["Username"];
            }
            else{
                Response.Redirect("Login.aspx",true);
            }
        }
        protected void changePass(object sender, EventArgs e)
        {
            if (txt_newpassword.Text.Equals(txt_repeatpassword.Text))
            {
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand cmd = new SqlCommand("ChangePass", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@username", Session["Username"].ToString()));
                cmd.Parameters.Add(new SqlParameter("@oldpassword", txt_oldpassword.Text));
                cmd.Parameters.Add(new SqlParameter("@newpassword", txt_newpassword.Text));

                // output parm
                SqlParameter output = cmd.Parameters.Add(new SqlParameter("@result", SqlDbType.Int));
                output.Direction = ParameterDirection.Output;
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                if (output.Value.ToString().Equals("1"))
                {
                    Response.Write("Password Updated");
                }
                else
                {
                    Response.Write("Old Password is not correct");
                }
            }else{
                Response.Write("Passwords do not match");
            }
        }
        protected void backToProfile(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx",true);
        }
    }
}
