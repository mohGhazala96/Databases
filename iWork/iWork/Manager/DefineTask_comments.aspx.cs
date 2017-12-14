using System;

using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
namespace iWork.Manager
{

    public partial class DefineTask_comments : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        protected void addComment(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand addCommentCommand = new SqlCommand("addComment", conn);
            addCommentCommand.CommandType = CommandType.StoredProcedure;
            addCommentCommand.Parameters.Add(new SqlParameter("@project_name_in", Session["projectName"].ToString()));
            addCommentCommand.Parameters.Add(new SqlParameter("@task_in", Session["taskName"].ToString()));
            addCommentCommand.Parameters.Add(new SqlParameter("@comment", commentTitle_in.Text ) );
            ErrorMessage.Text = "";

            if(commentTitle_in.Text.Length==0){
                Response.Write("Please write valid Inputs and make sure the input is filled");

            }
            else{
            conn.Open();
            if(addCommentCommand.ExecuteNonQuery()==1){
                Response.Redirect("DefineTask_comments.aspx", true);

            }
            else{
                    ErrorMessage.Text = "<br />" + "Please write valid Inputs and make sure the input is filled" + "<br />";

            }
            conn.Close();
            }
          
        }
        protected void finish(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand addCommentCommand = new SqlCommand("addComment", conn);
            addCommentCommand.CommandType = CommandType.StoredProcedure;
            addCommentCommand.Parameters.Add(new SqlParameter("@project_name_in", Session["projectName"].ToString()));
            addCommentCommand.Parameters.Add(new SqlParameter("@task_in", Session["taskName"].ToString()));
            addCommentCommand.Parameters.Add(new SqlParameter("@comment", commentTitle_in.Text));
            if (commentTitle_in.Text.Length == 0)
            {
                ErrorMessage.Text = "<br />" + "Please write valid Inputs and make sure the input is filled" + "<br />";

            }
            else
            {
                conn.Open();
                if (addCommentCommand.ExecuteNonQuery() == 1)
                {
                    Response.Redirect("DefineTask_manager.aspx", true);

                }
                else
                {
                    ErrorMessage.Text = "<br />" + "Please write valid Inputs and make sure the input is filled" + "<br />";


                }
                conn.Close();
            }

        }

    }
}
