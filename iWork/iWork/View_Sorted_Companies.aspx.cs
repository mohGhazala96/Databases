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

    public partial class View_Sorted_Companies : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("Jobs_Sorted", conn);
            cmd.CommandType = CommandType.StoredProcedure;


            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            Table companiesTable = new Table();
            companiesTable.CssClass = "table table-striped";
            TableRow headerRow = new TableRow();
            TableCell emailHeader = new TableCell();
            emailHeader.Text = "Company Email";
            TableCell companySalaryHeader = new TableCell();
            companySalaryHeader.Text = "Average Salary";
            headerRow.Cells.Add(emailHeader);
            headerRow.Cells.Add(companySalaryHeader);
            companiesTable.Rows.Add(headerRow);
            while (rdr.Read())
            {
                TableRow trow = new TableRow();
                TableCell cEmail = new TableCell();
                TableCell cSalary = new TableCell();
                string companyEmail = rdr.GetString(rdr.GetOrdinal("email"));
                string companySalary = ""+rdr.GetInt32(rdr.GetOrdinal("salary"));

                cEmail.Text = companyEmail;
                cSalary.Text = companySalary;
                trow.Cells.Add(cEmail);
                trow.Cells.Add(cSalary);

                companiesTable.Rows.Add(trow);
            }
            companies.Controls.Add(companiesTable);
        }
    }
}
