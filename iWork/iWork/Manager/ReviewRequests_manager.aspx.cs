using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


namespace iWork
{

    public partial class ReviewRequests_manager : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        int buttonIndex = 0;
        ArrayList requestsInfo = new ArrayList();
        ArrayList textBoxes = new ArrayList();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {

                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand cmd = new SqlCommand("View_New_Requests", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@manager_name", Session["Username"].ToString()));

                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                Label leaveRequestsTitle = new Label();
                leaveRequestsTitle.Text = "Leave Requests"+ "<br />"+ "<br />";
                ReviewRequests_manager_form.Controls.Add(leaveRequestsTitle);
                if (!rdr.HasRows)
                {
                    Label errorName = new Label();
                    errorName.Text = "No Requests are available"+ "<br />" + "<br />";

                    ReviewRequests_manager_form.Controls.Add(errorName);
                }
                while (rdr.Read())
                {
                    String hrEmployeeName = "";
                    String managerName = "";
                    if (rdr.IsDBNull(rdr.GetOrdinal("hr_employee")))
                        hrEmployeeName = "not assingned yet";
                    else
                        hrEmployeeName = rdr.GetString(rdr.GetOrdinal("hr_employee"));

                    if (rdr.IsDBNull(rdr.GetOrdinal("manager")))
                        managerName = "not assingned yet";
                    else
                        managerName = rdr.GetString(rdr.GetOrdinal("manager"));


                    Label LeaveRequests = new Label();
                    LeaveRequests.Text = "Date: " + rdr.GetDateTime(rdr.GetOrdinal("start_date")).ToString("G")
                        + " Applicant: " + rdr.GetString(rdr.GetOrdinal("applicant"))
                        + " Request Date: " + rdr.GetDateTime(rdr.GetOrdinal("request_date")).ToString("G") +
                        "End Date" + rdr.GetDateTime(rdr.GetOrdinal("end_date")).ToString("G") +

                        " Total Days: " + rdr.GetInt32(rdr.GetOrdinal("total_days")) +
                        " HR Employee: " + hrEmployeeName +
                        " HR Response: " + rdr.GetString(rdr.GetOrdinal("hr_response")) +
                        " Manager: " + managerName +
                        " Manager Response : " + rdr.GetString(rdr.GetOrdinal("manager_response")) +
                        " Type: " + rdr.GetString(rdr.GetOrdinal("type")) +
                        "<br />" + " Manager Reason: "  +

                         "<br />";
                    ReviewRequests_manager_form.Controls.Add(LeaveRequests);

                    addDetailsToRequestInput(rdr);
                }

                if (rdr.NextResult())
                {
                    Label businessRequests = new Label();
                    businessRequests.Text = "Business Requests" + "<br />";
                    ReviewRequests_manager_form.Controls.Add(businessRequests);
                    while (rdr.Read())
                    {
                        String hrEmployeeName = "";
                        String managerName = "";
                        if (rdr.IsDBNull(rdr.GetOrdinal("hr_employee")))
                            hrEmployeeName = "not assingned yet";
                        else
                            hrEmployeeName = rdr.GetString(rdr.GetOrdinal("hr_employee"));

                        if (rdr.IsDBNull(rdr.GetOrdinal("manager")))
                            managerName = "not assingned yet";
                        else
                            managerName = rdr.GetString(rdr.GetOrdinal("manager"));

                        Label BusinessRequests = new Label();
                        BusinessRequests.Text = "Date: " + rdr.GetDateTime(rdr.GetOrdinal("start_date")).ToString("G")
                        + " Applicant: " + rdr.GetString(rdr.GetOrdinal("applicant"))
                        + " Request Date: " + rdr.GetDateTime(rdr.GetOrdinal("request_date")).ToString("G") +
                            "End Date"+rdr.GetDateTime(rdr.GetOrdinal("end_date")).ToString("G")+
                        " Total Days: " + rdr.GetInt32(rdr.GetOrdinal("total_days")) +
                        " HR Employee: " + hrEmployeeName +
                        " HR Response: " + rdr.GetString(rdr.GetOrdinal("hr_response")) +
                        " Manager: " + managerName +
                        " Manager Response : " + rdr.GetString(rdr.GetOrdinal("manager_response")) +
                        " Manager Reason: " + rdr.GetString(rdr.GetOrdinal("manager_reason")) +
                            " Destination: " + rdr.GetString(rdr.GetOrdinal("destination"))
                            + " Purpose: " + rdr.GetString(rdr.GetOrdinal("purpose")) +
                            "<br />" +
                         "<br />";

                        ReviewRequests_manager_form.Controls.Add(BusinessRequests);
                        addDetailsToRequestInput(rdr);
                    }
                }
            }
            else
            {
                Response.Redirect("Login.aspx", true);
            }


        }
        protected void acceptRequest(object sender, EventArgs e)
        {
            int requestIndex = int.Parse(((Button)sender).ID)-1;
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("Change_Request_state", conn);
            string[] inputs = new string[2];
            inputs= (string[])requestsInfo[requestIndex];
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@manager_name", Session["Username"].ToString()));
            cmd.Parameters.Add(new SqlParameter("@start_date_in", inputs[0]));
            cmd.Parameters.Add(new SqlParameter("@applicant_in", inputs[1]));
            cmd.Parameters.Add(new SqlParameter("@status_in", "Approved"));
            if ( textBoxes[requestIndex] != null)
                cmd.Parameters.Add(new SqlParameter("@reason", ((TextBox)textBoxes[requestIndex]).Text  ));


            conn.Open();
            cmd.ExecuteNonQuery();
            Response.Write(inputs[0]);
            Response.Write(inputs[1]);

            conn.Close();
            Response.Redirect("ReviewRequests_manager.aspx", true);


        }
        protected void rejectRequest(object sender, EventArgs e)
        {
            int requestIndex = int.Parse(((Button)sender).ID)-2;
            string[] inputs = new string[2];

            SqlConnection conn = new SqlConnection(connStr);
            if ( ((TextBox) textBoxes[requestIndex]).Text.Equals("") ||textBoxes[requestIndex]==null){
                Response.Write("You should provide a reason");

            }

            else
            {
                SqlCommand cmd = new SqlCommand("Change_Request_state", conn);
                inputs = (string[])requestsInfo[requestIndex];
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@manager_name", Session["Username"].ToString()));
                cmd.Parameters.Add(new SqlParameter("@start_date_in", inputs[0]));
                cmd.Parameters.Add(new SqlParameter("@applicant_in", inputs[1]));
                cmd.Parameters.Add(new SqlParameter("@status_in", "Rejected"));
                cmd.Parameters.Add(new SqlParameter("@reason", ((TextBox)textBoxes[requestIndex]).Text  ));
                conn.Open();
                cmd.ExecuteNonQuery();
                Response.Write(inputs[0]);
                Response.Write(inputs[1]);

                conn.Close();
                Response.Redirect("ReviewRequests_manager.aspx", true);


            }

        }
        private void addDetailsToRequestInput(SqlDataReader rdr){
            TextBox Reason = new TextBox();
            Reason.Columns = 100;
            Reason.Enabled = true;
            Reason.Rows = 5;
            Reason.CssClass = "form-control";
            Reason.TextMode = TextBoxMode.MultiLine;
            Reason.ID = buttonIndex + "";
            textBoxes.Add(Reason);
            buttonIndex++;
            Label space = new Label();
            space.Text = "  " + "<br />" + "  " + "<br />";

            ReviewRequests_manager_form.Controls.Add(space);
            ReviewRequests_manager_form.Controls.Add(Reason);
            ReviewRequests_manager_form.Controls.Add(space);

            Button buttonAccept = new Button();
            buttonAccept.ID = buttonIndex + "";
            buttonAccept.Text = "Accept Request";
            buttonAccept.CssClass = "btn btn-default";
            buttonAccept.Click += new EventHandler(acceptRequest);
            buttonIndex++;

            Button buttonReject = new Button();
            buttonReject.ID = buttonIndex + "";
            buttonReject.Text = "Reject Request";
            buttonIndex++;
            buttonReject.CssClass = "btn btn-default";
            buttonReject.Click += new EventHandler(rejectRequest);
            ReviewRequests_manager_form.Controls.Add(buttonAccept);
            ReviewRequests_manager_form.Controls.Add(buttonReject);
            ReviewRequests_manager_form.Controls.Add(space);


            string[] info = new string[2];
            info[0] = rdr.GetDateTime(rdr.GetOrdinal("start_date")).ToString("G");
            info[1] = rdr.GetString(rdr.GetOrdinal("applicant"));
            requestsInfo.Add(info);
        }
    }
}
