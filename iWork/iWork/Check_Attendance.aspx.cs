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

    public partial class Check_Attendance : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                Response.Redirect("Default.aspx",true);
            }
        }
        protected void viewAttendance(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand cmd = new SqlCommand("Review_Attendance", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@username", Session["Username"].ToString()));
                string from_date = txt_from_date.Text;
                if (from_date == "") from_date = null;
                string to_date = txt_to_date.Text;
                if (to_date == "") to_date = null;
                cmd.Parameters.Add(new SqlParameter("@from_date", from_date));
                cmd.Parameters.Add(new SqlParameter("@to_date", to_date));

                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                Table attendance_table = new Table();
                attendance_table.CssClass = "table table-striped";
                TableRow headerRow = new TableRow();
                TableCell header_attendance_date = new TableCell();
                header_attendance_date.Text = "Attendance Date";
                TableCell header_start_time = new TableCell();
                header_start_time.Text = "Start Time";
                TableCell header_end_time = new TableCell();
                header_end_time.Text = "End Time";
                TableCell header_duration = new TableCell();
                header_duration.Text = "Duration";
                TableCell header_missing_hours = new TableCell();
                header_missing_hours.Text = "Missing Hours";
                headerRow.Cells.Add(header_attendance_date);
                headerRow.Cells.Add(header_start_time);
                headerRow.Cells.Add(header_end_time);
                headerRow.Cells.Add(header_duration);
                headerRow.Cells.Add(header_missing_hours);
                attendance_table.Rows.Add(headerRow);
                while (rdr.Read())
                {
                    TableRow trow = new TableRow();
                    TableCell attDate = new TableCell();
                    attDate.Text = rdr.GetString(rdr.GetOrdinal("attendance_date"));
                    trow.Cells.Add(attDate);
                    TableCell starttime = new TableCell();
                    starttime.Text = DateTime.Parse(rdr.GetString(rdr.GetOrdinal("start_time"))).ToShortTimeString();
                    trow.Cells.Add(starttime);
                    TableCell endtime = new TableCell();
                    endtime.Text = DateTime.Parse(rdr.GetString(rdr.GetOrdinal("end_time"))).ToShortTimeString();
                    trow.Cells.Add(endtime);
                    TableCell duration = new TableCell();
                    duration.Text = "" + Decimal.ToInt32(rdr.GetDecimal(rdr.GetOrdinal("duration")));
                    trow.Cells.Add(duration);
                    TableCell missedhours = new TableCell();
                    missedhours.Text = "" + Decimal.ToInt32(Decimal.Ceiling(rdr.GetDecimal(rdr.GetOrdinal("missed_hours"))));
                    trow.Cells.Add(missedhours);
                    attendance_table.Rows.Add(trow);
                }
                check_attendance.Controls.Add(attendance_table);
            }catch{
                lbl_shoutbox.Text = "Invalid input. Please try again";
            }
        }
    }
}
