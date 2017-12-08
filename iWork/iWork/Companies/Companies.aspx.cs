using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Companies : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("getallCompanies", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        //conn.Open();

        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        grid1.DataSource = dt;
        grid1.DataBind();

        SqlCommand cmd2 = new SqlCommand("StringTest", conn);
        cmd2.CommandType = CommandType.StoredProcedure;
        cmd2.Parameters.Add(new SqlParameter("@test", "Amjad"));
        //SqlParameter pass = cmd.Parameters.Add("@password", SqlDbType.VarChar, 50);
        //pass.Value = password;

        // output parm
        //cmd2.Parameters.Add(new SqlParameter("@test", "Amjad")).;
        //SqlParameter test_db_bla = cmd2.Parameters.Add("@output", SqlDbType.VarChar, 50);
        //test_db_bla.Direction = ParameterDirection.Output;

        cmd2.Parameters.Add(new SqlParameter("@output", SqlDbType.VarChar, 100)).Direction = ParameterDirection.Output;

        conn.Open();
        cmd2.ExecuteNonQuery();
        conn.Close();

        Response.Write(cmd2.Parameters["@output"].Value);
        //Response.Write(test_db_bla.Value);
            
 
        //SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        //while (rdr.Read())
        //{
        //    string companyName = rdr.GetString(rdr.GetOrdinal("name"));
        //    string companyField = rdr.GetString(rdr.GetOrdinal("field"));

        //    Label lbl_CompanyName = new Label();
        //    lbl_CompanyName.Text = companyName + "  speciliazes in ";
        //    form1.Controls.Add(lbl_CompanyName);


        //    Label lbl_CompanyField = new Label();
        //    lbl_CompanyField.Text = companyField + "  <br /> <br />";
        //    form1.Controls.Add(lbl_CompanyField);
        //}
        //this is how you retrive data from session variable.
        //string userId = Session["Username"].ToString();
        //Response.Write("Logged-in User: " + userId);
    }
}