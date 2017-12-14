using System;
using System.Collections;
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

    public partial class View_Emails : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        ArrayList emailNum = new ArrayList();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                Read_Email_Form.Visible = false;
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand cmd = new SqlCommand("View_Emails", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@recipient", Session["Username"].ToString()));
                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                Table emails_table = new Table();
                emails_table.CssClass="table table-striped";
                TableRow headerRow = new TableRow();
                TableCell header_sender = new TableCell();
                header_sender.Text = "Sender";
                TableCell header_email_subject = new TableCell();
                header_email_subject.Text = "Subject";
                TableCell header_email_date = new TableCell();
                header_email_date.Text = "Date";
                TableCell header_reply = new TableCell();
                header_reply.Text = "Reply";
                headerRow.Cells.Add(header_sender);
                headerRow.Cells.Add(header_email_subject);
                headerRow.Cells.Add(header_email_date);
                headerRow.Cells.Add(header_reply);
                emails_table.Rows.Add(headerRow);
                int i = 0;
                while (rdr.Read())
                {
                    TableRow trow = new TableRow();
                    TableCell senderCell = new TableCell();
                    emailNum.Add(rdr.GetInt32(rdr.GetOrdinal("email_number")));
                    String senderName = rdr.GetString(rdr.GetOrdinal("sender"));
                    LinkButton senderLink = new LinkButton();
                    senderLink.Text = senderName;
                    senderLink.ID = "sender" + i;
                    senderLink.Click +=  new EventHandler(readEmail);
                    senderCell.Controls.Add(senderLink);
                    trow.Cells.Add(senderCell); 
                    TableCell subjectCell = new TableCell();
                    String subjectText = rdr.GetString(rdr.GetOrdinal("email_subject"));
                    LinkButton subjectLink = new LinkButton();
                    subjectLink.Text = subjectText;
                    subjectLink.ID = "subject" + i;
                    subjectLink.Click += new EventHandler(readEmail);
                    subjectCell.Controls.Add(subjectLink);
                    trow.Cells.Add(subjectCell);
                    TableCell dateCell = new TableCell();
                    String dateText = rdr.GetDateTime(rdr.GetOrdinal("email_date")).ToString("G");
                    LinkButton dateLink = new LinkButton();
                    dateLink.Text = dateText;
                    dateLink.ID = "date" + i;
                    dateLink.Click += new EventHandler(readEmail);
                    dateCell.Controls.Add(dateLink);
                    trow.Cells.Add(dateCell);
                    TableCell replyCell = new TableCell();
                    Button replyButton = new Button();
                    replyButton.Text = "Reply";
                    replyButton.ID = "" + i;
                    replyButton.Click += new EventHandler(replyEmail);
                    replyCell.Controls.Add(replyButton);
                    trow.Cells.Add(replyCell);
                    emails_table.Rows.Add(trow);
                    i += 1;
                }
                View_Emails_Form.Controls.Add(emails_table);
            }else{
                Response.Redirect("Login.aspx",true);
            }
        }
        protected void readEmail(object sender, EventArgs e)
        {
            LinkButton pressed = (LinkButton)sender;
            int emailnumIndex = 0;
            if(pressed.ID.Contains("sender")){
                emailnumIndex = Int32.Parse(pressed.ID.Substring(6));
            }else if(pressed.ID.Contains("subject")){
                emailnumIndex = Int32.Parse(pressed.ID.Substring(7));
            }else if(pressed.ID.Contains("date")){
                emailnumIndex = Int32.Parse(pressed.ID.Substring(4));
            }

            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("Read_Email", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@email_num", emailNum[emailnumIndex]));
            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                lbl_sender_name.Text = rdr.GetString(rdr.GetOrdinal("sender"));
                lbl_subject_text.Text = rdr.GetString(rdr.GetOrdinal("email_subject"));
                lbl_body_text.Text = rdr.GetString(rdr.GetOrdinal("body"));
                Button replyButton = new Button();
                replyButton.Text = "Reply";
                replyButton.ID = "" + emailnumIndex;
                Read_Email_Form.Controls.Add(replyButton);
            }
            View_Emails_Form.Visible = false;
            Read_Email_Form.Visible = true;
        }
        protected void replyEmail(object sender, EventArgs e)
        {
            Session["EmailNumber"] = emailNum[Int32.Parse(((Button)sender).ID)];
            Response.Redirect("Send_Email.aspx",true);

        }
        protected void backToEmails(object sender, EventArgs e)
        {
            Response.Redirect("View_Emails.aspx",true);
        }
    }
}
