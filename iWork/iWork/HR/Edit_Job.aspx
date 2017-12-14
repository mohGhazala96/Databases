<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit_Job.aspx.cs" Inherits="iWork.HR.Edit_Job" %>

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
        <asp:Label ID="error" Text="" runat="server"></asp:Label>

        <asp:Panel ID="data" runat="server">
            <form id="form" method="post">
                <!-- Check how to do placeholders. Check if we need the name to be adjusted, too. -->
                <asp:TextBox id="title" runat="server" placeholder="Title"></asp:TextBox>
                <asp:TextBox id="short_description" runat="server" placeholder="Short description"></asp:TextBox>
                <asp:TextBox id="detailed_description" runat="server" placeholder="Detailed description"></asp:TextBox>
                <asp:TextBox id="min_experience" runat="server" placeholder="Minimum experience"></asp:TextBox>
                <asp:TextBox id="salary" runat="server" placeholder="Salary"></asp:TextBox>
                <asp:TextBox id="deadline" runat="server" placeholder="Deadline"></asp:TextBox>
                <asp:TextBox id="no_of_vacancies" runat="server" placeholder="Number of vacancies"></asp:TextBox>
                <asp:TextBox id="working_hours" runat="server" placeholder="Working hours"></asp:TextBox>

                <input type="submit" name="submit" value="Update" id="submit" />
            </form>

            <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false">    
             <Columns>
                 <asp:TemplateField HeaderText="Question">
                      <ItemTemplate>
                        <asp:TextBox id="question_text" runat="server"
                            Text='<%# Bind("question") %>'></asp:TextBox>
                      </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Answer">
                      <ItemTemplate>
                        <asp:TextBox id="answer_text" runat="server"
                            Text='<%# Bind("answer") %>'></asp:TextBox>
                      </ItemTemplate>
                 </asp:TemplateField>
             </Columns>
            </asp:GridView>
        </asp:Panel>
    </form>
</body>
</html>