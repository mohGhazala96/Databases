<%@ Page Language="C#" Inherits="iWork.AssignEmployeesOnProject_Redicted" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>AssignEmployeesOnProject_Redicted</title>
</head>
<body>
        <% if(Session["Username"] != null){ 
Response.WriteFile("../Pages/menu.inc");
} else if(Session["Username"] == null){
Response.WriteFile("../Pages/unsigned-menu.inc");
}
%>
    <form id="form1" runat="server">
    </form>
 <!--#include file="../Pages/footer.inc"-->   
</body>
</html>
