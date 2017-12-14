<%@ Page Language="C#" Inherits="iWork.Manager.RemoveRegularEmployeeProject_manager_Redirected" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>RemoveRegularEmployeeProject_manager_Redirected</title>
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
