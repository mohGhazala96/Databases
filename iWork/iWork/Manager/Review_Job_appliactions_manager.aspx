<%@ Page Language="C#" Inherits="iWork.Review_Job_appliactions_manager" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>Review_Job_appliactions_manager</title>
</head>
<body>
                <% if(Session["Username"] != null){ 
Response.WriteFile("../Pages/menu.inc");
} else if(Session["Username"] == null){
Response.WriteFile("../Pages/unsigned-menu.inc");
}
%>
	<form id="Review_Job_appliactions_manager_form" runat="server">
	</form>
         <!--#include file="../Pages/footer.inc"-->   

</body>
</html>
