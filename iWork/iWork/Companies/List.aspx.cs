using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Companies_List : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("List_Of_Companies", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        nationalGrid.DataSource = dt;
        nationalGrid.DataBind();
        //SqlParameter pass = cmd.Parameters.Add("@password", SqlDbType.VarChar, 50);
        //pass.Value = password;
    }
}