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

    public partial class ViewReuqests_Manager : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
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
                while (rdr.Read())
                {
                    String hrEmployeeName = "";
                    String managerName = "";
                    if (    rdr.IsDBNull( rdr.GetOrdinal("hr_employee")))
                        hrEmployeeName = "not assingned yet";
                    else
                        hrEmployeeName = rdr.GetString(rdr.GetOrdinal("hr_employee"));
                    
                    if (rdr.IsDBNull(rdr.GetOrdinal("manager")))
                        managerName = "not assingned yet";
                    else
                        managerName = rdr.GetString(rdr.GetOrdinal("manager"));
                    

                    Label LeaveRequests = new Label();
                    LeaveRequests.Text = "Date: "+rdr.GetDateTime(rdr.GetOrdinal("start_date")).ToString("G") 
                        + " Applicant: "+ rdr.GetString(rdr.GetOrdinal("applicant"))
                        + " Request Date: "+ rdr.GetDateTime(rdr.GetOrdinal("request_date")).ToString("G")+
                        " Total Days: "+  rdr.GetInt32(rdr.GetOrdinal("total_days"))+
                        " HR Employee: "+hrEmployeeName+
                        " HR Response: "+ rdr.GetString(rdr.GetOrdinal("hr_response"))+
                        " Manager: " + managerName +
                        " Manager Response : " + rdr.GetString(rdr.GetOrdinal("manager_response")) +
                        " Manager Reason: " + rdr.GetString(rdr.GetOrdinal("manager_reason")) +
                        " Type: " + rdr.GetString(rdr.GetOrdinal("type")) +
                        "<br />" +
                         "<br />";
                
                    ViewReuqests_Manager_Form.Controls.Add(LeaveRequests);
                

                }


                if (rdr.NextResult())
                {
                    while (rdr.Read())
                    {
                        // reason null
                        // end datef
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
                        " Total Days: " + rdr.GetInt32(rdr.GetOrdinal("total_days")) +
                        " HR Employee: " + hrEmployeeName +
                        " HR Response: " + rdr.GetString(rdr.GetOrdinal("hr_response")) +
                        " Manager: " + managerName +
                        " Manager Response : " + rdr.GetString(rdr.GetOrdinal("manager_response")) +
                        " Manager Reason: " + rdr.GetString(rdr.GetOrdinal("manager_reason")) +
                            " Destination: " + rdr.GetString(rdr.GetOrdinal("destination")) 
                            +" Purpose: " + rdr.GetString(rdr.GetOrdinal("purpose")) +
                            "<br />"+
                         "<br />";
                
                        ViewReuqests_Manager_Form.Controls.Add(BusinessRequests);
                    }
                }
            }
            else
            {
                Response.Redirect("Login.aspx", true);
            }
        }
    }
}
