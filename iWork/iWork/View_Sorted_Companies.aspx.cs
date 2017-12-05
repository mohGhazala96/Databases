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
            while (rdr.Read())
            {
                string companyEmail = rdr.GetString(rdr.GetOrdinal("email"));
                string companySalary = ""+rdr.GetInt32(rdr.GetOrdinal("salary"));

                Label lbl_CompanyEmail = new Label();
                lbl_CompanyEmail.Text = companyEmail + " \t \t ";
                companies.Controls.Add(lbl_CompanyEmail);

                Label lbl_CompanySalary = new Label();
                lbl_CompanySalary.Text = companySalary + " <br/> ";
                companies.Controls.Add(lbl_CompanySalary);
            }
        }
    }
}
