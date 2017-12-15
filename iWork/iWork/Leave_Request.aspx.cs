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

    public partial class Leave_Request : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }
        protected void applyForLeaveRequest(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand cmd = new SqlCommand("Apply_For_Leave_Request", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@username", Session["Username"].ToString()));
                cmd.Parameters.Add(new SqlParameter("@replacement", txt_replacement.Text));
                cmd.Parameters.Add(new SqlParameter("@from_date", txt_from_date.Text));
                cmd.Parameters.Add(new SqlParameter("@to_date", txt_to_date.Text));
                cmd.Parameters.Add(new SqlParameter("@type", txt_type.Text));
                SqlParameter output = cmd.Parameters.Add(new SqlParameter("@result", SqlDbType.Int));
                output.Direction = ParameterDirection.Output;
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                switch (output.Value.ToString())
                {
                    case "0":
                        lbl_shoutbox.Text="Sorry, you have exceeded your annual leaves";
                        break;
                    case "1":
                        lbl_shoutbox.Text = "Submitted Successfully";
                        break;
                    case "2":
                        lbl_shoutbox.Text = "Sorry, Replacement type does not match to yours";
                        break;
                    case "3":
                        lbl_shoutbox.Text = "Sorry, replacement is not in the same company as you";
                        break;
                    case "4":
                        lbl_shoutbox.Text = "Sorry, request overlapping with another request";
                        break;
                    default:
                        lbl_shoutbox.Text = "Sorry, an error occured";
                        break;
                }
            }catch{
                lbl_shoutbox.Text = "Sorry an error occured";
            }


        }
    }
}
