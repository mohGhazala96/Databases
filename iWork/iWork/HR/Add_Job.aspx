<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_Job.aspx.cs" Inherits="iWork.HR.Add_Job" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="/Content/jquery-3.2.1.min.js"></script>
    <title>HR Employee | Add Job</title>

    <script>
        $(function() {
          $("#more_questions").click(function(e) {
            e.preventDefault();
            $("#questions").append("<br />");
            $("#questions").append("<input name='questions[]' type='text' placeholder='Question' />");
            $("#questions").append("<input name='answers[]' type='text' placeholder='Answer' />");
          });
        });
    </script>
</head>
<body>
    <% if(Session["Username"] != null){ 
    Response.WriteFile("/Pages/menu.inc");
    } else if(Session["Username"] == null){
    Response.WriteFile("/Pages/unsigned-menu.inc");
    }
    %>
    <form id="form1" runat="server">
        <asp:Label ID="error" Text="You are not logged in or you are not an HR employee" runat="server"></asp:Label>

        <asp:Panel ID="data" runat="server" CssClass="panel panel-default">
            <form method="post">
                <input name="title" type="text" id="title" placeholder="Title" class="input-sm"/><br />
                <input name="role" type="text" id="role" placeholder="Role" class="input-sm"/><br />
                <input name="short_description" type="text" id="short_description" placeholder="Short description" class="input-sm"/><br />
                <input name="detailed_description" type="text" id="detailed_description" placeholder="Detailed description" class="input-sm"/><br />
                <input name="min_experience" type="text" id="min_experience" placeholder="Minimum experience" class="input-sm"/><br />
                <input name="salary" type="text" id="salary" placeholder="Salary" class="input-sm"/><br />
                <input name="deadline" type="text" id="deadline" placeholder="Deadline" class="input-sm"/><br />
                <input name="no_of_vacancies" type="text" id="no_of_vacancies" placeholder="Number of vacancies" class="input-sm"/><br />
                <input name="working_hours" type="text" id="working_hours" placeholder="Working hours" class="input-sm"/>
                <br /><br />
                <div id="questions">
                    <input name='questions[]' type='text' placeholder='Question' />
                    <input name='answers[]' type='text' placeholder='Answer' />
                </div>
                <br /><br />
                <input type ="submit" name="submit" value="Add More Questions" id="more_questions" />
                <br /><br />
                <input type="submit" name="submit" value="Submit" id="submit" />
            </form>
            <br /><br />
            <asp:GridView ID="companies" runat="server" AutoGenerateColumns="false">    
                <Columns>
                    <asp:BoundField DataField="name" HeaderText="Company Name" ItemStyle-Width="150" />
                </Columns>    
            </asp:GridView>
        </asp:Panel>
    </form>
    <!--#include file="/Pages/footer.inc"-->
</body>
</html>
