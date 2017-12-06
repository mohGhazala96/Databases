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

    public partial class View_Requests : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        ArrayList buttonsList = new ArrayList();
        ArrayList startDateList = new ArrayList();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand cmd = new SqlCommand("View_Requests", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@username", Session["Username"].ToString()));
                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                Table requests_table = new Table();
                TableRow headerRow = new TableRow();
                TableCell header_start_date = new TableCell();
                header_start_date.Text = "Start Date";
                TableCell header_end_date = new TableCell();
                header_end_date.Text = "End Date";
                TableCell header_request_date = new TableCell();
                header_request_date.Text = "Request Date";
                TableCell header_total_days = new TableCell();
                header_total_days.Text = "Total Days";
                TableCell header_response = new TableCell();
                header_response.Text = "Response";
                TableCell header_manager = new TableCell();
                header_manager.Text = "Manager";
                TableCell header_reason = new TableCell();
                header_reason.Text = "Manager Reason";
                TableCell header_delete = new TableCell();
                header_delete.Text = "Delete";
                headerRow.Cells.Add(header_start_date);
                headerRow.Cells.Add(header_end_date);
                headerRow.Cells.Add(header_request_date);
                headerRow.Cells.Add(header_total_days);
                headerRow.Cells.Add(header_response);
                headerRow.Cells.Add(header_manager);
                headerRow.Cells.Add(header_reason);
                headerRow.Cells.Add(header_delete);
                requests_table.Rows.Add(headerRow);
                int i = 0;
                while (rdr.Read())
                {
                    TableRow trow = new TableRow();
                    TableCell startDateCell = new TableCell();
                    string startDateString = rdr.GetDateTime(rdr.GetOrdinal("start_date")).ToString("d");
                    startDateCell.Text = startDateString;
                    startDateList.Add(startDateString);
                    trow.Cells.Add(startDateCell);
                    TableCell endDateCell = new TableCell();
                    endDateCell.Text = rdr.GetDateTime(rdr.GetOrdinal("end_date")).ToString("d");
                    trow.Cells.Add(endDateCell);
                    TableCell requestDateCell = new TableCell();
                    requestDateCell.Text = rdr.GetDateTime(rdr.GetOrdinal("request_date")).ToString("d");
                    trow.Cells.Add(requestDateCell);
                    TableCell totalDaysCell = new TableCell();
                    totalDaysCell.Text = ""+rdr.GetInt32(rdr.GetOrdinal("total_days"));
                    trow.Cells.Add(totalDaysCell);
                    TableCell responseCell = new TableCell();
                    responseCell.Text = rdr.GetString(rdr.GetOrdinal("response"));
                    trow.Cells.Add(responseCell);
                    TableCell managerCell = new TableCell();
                    managerCell.Text = rdr.GetString(rdr.GetOrdinal("manager"));
                    trow.Cells.Add(managerCell);
                    TableCell reasonCell = new TableCell();
                    if (!rdr.IsDBNull(rdr.GetOrdinal("manager_reason")))
                        reasonCell.Text = rdr.GetString(rdr.GetOrdinal("manager_reason"));
                    else reasonCell.Text = "No Reason given";
                    trow.Cells.Add(reasonCell);
                    TableCell deleteCell = new TableCell();
                    Button deleteButton = new Button();
                    deleteButton.Text = "Delete";
                    deleteButton.ID = "" + i;
                    deleteButton.Click += new EventHandler(deleteRequest);
                    deleteCell.Controls.Add(deleteButton);
                    trow.Cells.Add(deleteCell);
                    requests_table.Rows.Add(trow);
                    i += 1;
                }
                View_Requests_Form.Controls.Add(requests_table);
            }else{
                Response.Redirect("Default.aspx", true);
            }
        }

        protected void deleteRequest(object sender, EventArgs e)
        {
            Button deleteButton = (Button)sender;
            int rowNumber = Int32.Parse(deleteButton.ID);

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("Delete_Request", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@start_date", ""+startDateList[rowNumber]));
            cmd.Parameters.Add(new SqlParameter("@username", Session["Username"].ToString()));

            SqlParameter output = cmd.Parameters.Add(new SqlParameter("@result", SqlDbType.Int));
            output.Direction = ParameterDirection.Output;
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            if(output.Value.ToString()=="1"){
                Response.Write("Delete Successful");
                Response.Redirect("View_Requests.aspx");
            }else if(output.Value.ToString()=="0"){
                Response.Write("Sorry, Request already processed");
            }else{
                Response.Write("Sorry, an Error Occured");
            }
        }
    }
}
