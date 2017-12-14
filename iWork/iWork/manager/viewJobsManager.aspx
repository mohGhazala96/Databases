<%@ Page Language="C#" Inherits="iWork.viewJobsManager" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>viewJobsManager</title>
</head>
<body>
                <% if(Session["Username"] != null){ 
Response.WriteFile("../Pages/menu.inc");
} else if(Session["Username"] == null){
Response.WriteFile("../Pages/unsigned-menu.inc");
}
%>
	<form id="viewJobsManager_from" runat="server">
	</form>
         <!--#include file="../Pages/footer.inc"-->   

</body>
</html>
