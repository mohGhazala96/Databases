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
    
    public partial class Search_Jobs : System.Web.UI.Page
    {   
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        protected void searchJobs(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("Search_Job", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@key", txt_search.Text));
            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            Table jobs_table = new Table();
            jobs_table.CssClass = "table table-striped";
            TableRow headerRow = new TableRow();
            TableCell header_title = new TableCell();
            header_title.Text = "Title";
            TableCell header_department_name = new TableCell();
            header_department_name.Text = "Department";
            TableCell header_number_of_vacancies = new TableCell();
            header_number_of_vacancies.Text = "Number Of Vacancies";
            TableCell header_salary = new TableCell();
            header_salary.Text = "Salary";
            TableCell header_short_description = new TableCell();
            header_short_description.Text = "Short Description";
            TableCell header_detailed_description = new TableCell();
            header_detailed_description.Text = "Detailed Description";
            TableCell header_min_experience = new TableCell();
            header_min_experience.Text = "Min Experience";
            TableCell header_working_hours = new TableCell();
            header_working_hours.Text = "Working Hours";
            TableCell header_company_name = new TableCell();
            header_company_name.Text = "Company name";
            TableCell header_company_email = new TableCell();
            header_company_email.Text = "Email";

            headerRow.Cells.Add(header_title);
            headerRow.Cells.Add(header_department_name);
            headerRow.Cells.Add(header_number_of_vacancies);
            headerRow.Cells.Add(header_salary);
            headerRow.Cells.Add(header_short_description);
            headerRow.Cells.Add(header_detailed_description);
            headerRow.Cells.Add(header_min_experience);
            headerRow.Cells.Add(header_company_name);
            headerRow.Cells.Add(header_company_email);
            jobs_table.Rows.Add(headerRow);
            while (rdr.Read())
            {
                TableRow trow = new TableRow();
                TableCell titleCell = new TableCell();
                titleCell.Text = rdr.GetString(rdr.GetOrdinal("title"));
                TableCell departmentCell = new TableCell();
                departmentCell.Text = rdr.GetString(rdr.GetOrdinal("department_name"));
                TableCell vacanciesCell = new TableCell();
                vacanciesCell.Text = rdr.GetInt32(rdr.GetOrdinal("no_of_vacancies")).ToString();
                TableCell salaryCell = new TableCell();
                salaryCell.Text = rdr.GetInt32(rdr.GetOrdinal("salary")).ToString();
                TableCell shortDescCell = new TableCell();
                shortDescCell.Text = rdr.GetString(rdr.GetOrdinal("short_description"));
                TableCell detailedDescCell = new TableCell();
                detailedDescCell.Text = rdr.GetString(rdr.GetOrdinal("detailed_description"));
                TableCell minExpCell = new TableCell();
                minExpCell.Text = rdr.GetInt32(rdr.GetOrdinal("min_experience")).ToString();
                TableCell companyNameCell = new TableCell();
                companyNameCell.Text = rdr.GetString(rdr.GetOrdinal("company_name"));
                TableCell companyEmailCell = new TableCell();
                companyEmailCell.Text = rdr.GetString(rdr.GetOrdinal("company_email"));
                trow.Cells.Add(titleCell);
                trow.Cells.Add(departmentCell);
                trow.Cells.Add(vacanciesCell);
                trow.Cells.Add(salaryCell);
                trow.Cells.Add(shortDescCell);
                trow.Cells.Add(detailedDescCell);
                trow.Cells.Add(minExpCell);
                trow.Cells.Add(companyNameCell);
                trow.Cells.Add(companyEmailCell);
                jobs_table.Rows.Add(trow);
            }
            Search_Jobs_Form.Controls.Add(jobs_table);
        }
    }
}
