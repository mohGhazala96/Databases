<%@ Page Language="C#" Inherits="iWork.Manager.ReviewTaskInProject_Main" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>ReviewTaskInProject_Main</title>
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
