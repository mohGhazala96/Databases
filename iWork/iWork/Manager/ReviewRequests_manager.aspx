<%@ Page Language="C#" Inherits="iWork.ReviewRequests_manager" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>ReviewRequests_manager</title>
</head>
<body>
                <% if(Session["Username"] != null){ 
Response.WriteFile("../Pages/menu.inc");
} else if(Session["Username"] == null){
Response.WriteFile("../Pages/unsigned-menu.inc");
}
%>
	<form id="ReviewRequests_manager_form" runat="server">
	</form>
         <!--#include file="../Pages/footer.inc"-->   

</body>
</html>
