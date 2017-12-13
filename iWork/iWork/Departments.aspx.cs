using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace SampleWebsite
{


    public partial class Departments : System.Web.UI.Page
    {
        public static string companyName;
        public static int DepCode;
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"Server=localhost;Database=websiteDataBase;User Id=sa;Password=Password123");

            SqlCommand cmd = new SqlCommand("Department_Jobs", conn);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter( "@company",companyName));
            cmd.Parameters.Add(new SqlParameter( "@department", DepCode));


            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                string title = rdr.GetString(rdr.GetOrdinal("title"));
                string shortDesc = rdr.GetString(rdr.GetOrdinal("short_description"));
                string detailedDesc = rdr.GetString(rdr.GetOrdinal("detailed_description"));
                int minExp = rdr.GetInt32(rdr.GetOrdinal("min_experience"));
                int salary = rdr.GetInt32(rdr.GetOrdinal("salary"));
                string deadline = rdr.GetString(rdr.GetOrdinal("deadline"));
                int noVacancies = rdr.GetInt32(rdr.GetOrdinal("no_of_vacancies"));
                int workingHours = rdr.GetInt32(rdr.GetOrdinal("working_hours"));


                Label lbl_CompanyName = new Label();
                lbl_CompanyName.Text = "Title: " + title + " , short_description: " + shortDesc +" , detailed description: "+detailedDesc +" , minmum experience: "+minExp+" , salary: "+salary+" ,deadline: "+deadline+" , number of vacancies: "+noVacancies+" , working hours: "+workingHours;

                Label lbl_space = new Label();
                lbl_space.Text = "  <br /> <br />";
                form1.Controls.Add(lbl_CompanyName);
                form1.Controls.Add(lbl_space);
            }
  



            //this is how you retrive data from session variable.
            //string userId = Session["Username"].ToString();
            //Response.Write("Logged-in User: " + userId + "  <br /> <br />");
        }
    }
}
