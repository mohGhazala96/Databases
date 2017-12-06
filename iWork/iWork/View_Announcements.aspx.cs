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

    public partial class View_Announcements : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand cmd = new SqlCommand("View_Announcements", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@username", Session["Username"].ToString()));

                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                while (rdr.Read())
                {
                    Label titleLabel = new Label();
                    titleLabel.Text = "<h2>" + rdr.GetString(rdr.GetOrdinal("title")) + "</h2>";
                    Label dateLabel = new Label();
                    dateLabel.Text = "" + rdr.GetDateTime(rdr.GetOrdinal("date")).ToString("G") + "<br />";
                    Label typeLabel = new Label();
                    typeLabel.Text = rdr.GetString(rdr.GetOrdinal("type"))+"<br />";
                    Label writerLabel = new Label();
                    writerLabel.Text = "By: " + rdr.GetString(rdr.GetOrdinal("hr_employee"))+"<br />";
                    Label descriptionLabel = new Label();
                    descriptionLabel.Text =  rdr.GetString(rdr.GetOrdinal("description")) + "<br />";
                    View_Announcements_Form.Controls.Add(titleLabel);
                    View_Announcements_Form.Controls.Add(dateLabel);
                    View_Announcements_Form.Controls.Add(typeLabel);
                    View_Announcements_Form.Controls.Add(writerLabel);
                    View_Announcements_Form.Controls.Add(descriptionLabel);

                }
            }else{
                Response.Redirect("Login.aspx",true);
            }
        }
    }
}
