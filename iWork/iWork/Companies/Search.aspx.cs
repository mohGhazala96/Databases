using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace iWork.Companies
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            NameValueCollection nvc = Request.Form;
            string name, address, type;

            name = null;
            address = null;
            type = null;

            if (!string.IsNullOrEmpty(nvc["textField"]))
            {
                if (search_type.SelectedValue.ToString() == "name")
                    name = nvc["textField"];
                else if (search_type.SelectedValue.ToString() == "address")
                    address = nvc["textField"];
                else if (search_type.SelectedValue.ToString() == "type")
                    type = nvc["textField"];
            }

            if (!(address == null && name == null && type == null))
            {
                string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand cmd = new SqlCommand("Company_Search", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@name", (Object)name ?? DBNull.Value));
                cmd.Parameters.Add(new SqlParameter("@adderss", (Object)address ?? DBNull.Value));
                cmd.Parameters.Add(new SqlParameter("@type", (Object)type ?? DBNull.Value));

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                companies.DataSource = dt;
                companies.DataBind();
            }
        }
    }
}