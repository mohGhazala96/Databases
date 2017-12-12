using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace iWork.HR
{
    public partial class Add_Job : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                NameValueCollection nvc = Request.Form;

                String title = nvc["title"];
                String role = nvc["role"];
                String short_description = nvc["short_description"];
                String detailed_description = nvc["detailed_description"];
                int min_experience = int.Parse(nvc["min_experience"]);
                int salary = int.Parse(nvc["salary"]);
                DateTime deadline = DateTime.Parse(nvc["deadline"]);
                int no_of_vacancies = int.Parse(nvc["no_of_vacancies"]);
                int working_hours = int.Parse(nvc["working_hours"]);

                String[] questions = nvc["questions[]"].Split(',');
                String[] answers = nvc["answers[]"].Split(',');

                String comString = "declare @q_list q_list; INSERT INTO @q_list VALUES";

                for(int i = 0; i < questions.Length; i++)
                {
                    comString += $"('{questions[i]}', '{answers[i]}'),";
                }

                comString = comString.Substring(0, comString.Length - 1);
                comString += ";";

                comString += $"EXEC HR_Employees_add_job '{Session["Username"]}','{title}', " +
                    $"'{@short_description}', '{@detailed_description}', {@min_experience}, " +
                    $"{@salary}, '{@deadline}', {@no_of_vacancies}, {@working_hours}, @q_list;";

                SqlCommand com = new SqlCommand(comString, conn);
                conn.Open();
                //com.ExecuteNonQuery();
                Response.Write(com.ExecuteScalar());
                conn.Close();
            }
        }
    }
}