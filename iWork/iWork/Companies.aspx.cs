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

    public partial class Companies : System.Web.UI.Page
    {
        public static string companyName;
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("View_Company_Department", conn);
            SqlCommand viewPhoneNumbers = new SqlCommand("View_Company_Department_Phone", conn);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@company", companyName));
            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.SingleRow);
            while (rdr.Read())
            {
                string companyEmail = rdr.GetString(rdr.GetOrdinal("email"));
                string companyName= rdr.GetString(rdr.GetOrdinal("name"));
                string companyAddress= rdr.GetString(rdr.GetOrdinal("address"));
                string companyDomian = rdr.GetString(rdr.GetOrdinal("domain"));
                string companyType= rdr.GetString(rdr.GetOrdinal("type"));
                string companyVision = rdr.GetString(rdr.GetOrdinal("vision"));
                string companySpecialization= rdr.GetString(rdr.GetOrdinal("specialization"));

                Label lbl_CompanyName = new Label();
                lbl_CompanyName.Text ="Name: "+ companyName +" , Email: "+companyEmail+ "  , speciliazes in: "+companySpecialization +" , Address: " +companyAddress+ " , Domain: "+companyDomian +" , Type: "+companyType+" , Vision: "+companyVision;

                Label lbl_space = new Label();
                lbl_space.Text =  "  <br /> <br />";
                form1.Controls.Add(lbl_CompanyName);
                form1.Controls.Add(lbl_space);
            }
            conn.Close();


            conn.Open();

             rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (rdr.Read())
            {
                int code = rdr.GetInt32(rdr.GetOrdinal("code")) ;
                string depName= rdr.GetString(9);
                Label lbl_CompanyName = new Label();
                Button viewDepartemnt = new Button();
                viewDepartemnt.ID = code+"";
                viewDepartemnt.Text = "View Department";

                viewDepartemnt.Click += new EventHandler(openAnotherPage);
                lbl_CompanyName.Text ="  <br /> <br />"+"Department Name: "+ depName +" , Code: "+code+ "  <br /> <br />";
                form1.Controls.Add(lbl_CompanyName);
                form1.Controls.Add(viewDepartemnt);

            }
            conn.Open();
            viewPhoneNumbers.CommandType = CommandType.StoredProcedure;
            viewPhoneNumbers.Parameters.Add(new SqlParameter("@company", companyName));
            conn.Open();
            SqlDataReader rdr2 = viewPhoneNumbers.ExecuteReader(CommandBehavior.CloseConnection);
            Label phoneNumbersTitle = new Label();
            phoneNumbersTitle.Text = "Phone Numbers";
            form1.Controls.Add(phoneNumbersTitle);
            while(rdr2.Read()){
                Label phoneNumber = new Label();
                phoneNumber.Text=   "  <br /> <br />" + rdr2.GetString(rdr.GetOrdinal("phone"))+"  <br /> <br />" ;
                form1.Controls.Add(phoneNumber);
            }
            conn.Close();



            //this is how you retrive data from session variable.
            //string userId = Session["Username"].ToString();
            //Response.Write("Logged-in User: " + userId + "  <br /> <br />");
        }
        protected void openAnotherPage(object sender, EventArgs e){
            Departments.companyName = companyName;
            Departments.DepCode = int.Parse( ((Button)sender).ID);
            Response.Redirect("Departments.aspx", true);

        }

    }
}
