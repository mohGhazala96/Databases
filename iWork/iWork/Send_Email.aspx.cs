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

    public partial class Send_Email : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                if(Session["EmailNumber"]!=null){
                    if (!IsPostBack)
                    {
                        int emailNumber = Int32.Parse(Session["EmailNumber"].ToString());
                        SqlConnection conn = new SqlConnection(connStr);

                        SqlCommand cmd = new SqlCommand("Read_Email", conn);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add(new SqlParameter("@email_num", emailNumber));
                        conn.Open();
                        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                        while (rdr.Read())
                        {
                            txt_recipient.Text = rdr.GetString(rdr.GetOrdinal("sender"));
                            txt_subject.Text = "RE: " + rdr.GetString(rdr.GetOrdinal("email_subject"));
                        }
                        Session["EmailNumber"] = null;
                    }
                }
            }else{
                Response.Redirect("Login.aspx",true);
            }
        }

        protected void sendEmail(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("Send_email", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@sender", Session["Username"].ToString()));
            cmd.Parameters.Add(new SqlParameter("@recipient", txt_recipient.Text));
            cmd.Parameters.Add(new SqlParameter("@subject", txt_subject.Text));
            cmd.Parameters.Add(new SqlParameter("@body", txt_body.Text));


            SqlParameter output = cmd.Parameters.Add(new SqlParameter("@result", SqlDbType.Int));
            output.Direction = ParameterDirection.Output;
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            if(output.Value.ToString()=="1"){
                lbl_shoutbox.Text = "Email Sent Successfully";
            }else if(output.Value.ToString()=="0"){
                lbl_shoutbox.Text = "Sorry, You are trying to send an email to someone not in your company";
            }else{
                lbl_shoutbox.Text = "Sorry an error occured";
            }
        }
    }
}
