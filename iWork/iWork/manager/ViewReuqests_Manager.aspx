<%@ Page Language="C#" Inherits="iWork.ViewReuqests_Manager" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>ViewReuqests_Manager</title>
</head>
<body>
                <% if(Session["Username"] != null){ 
Response.WriteFile("../Pages/menu.inc");
} else if(Session["Username"] == null){
Response.WriteFile("../Pages/unsigned-menu.inc");
}
%>
	<form id="ViewReuqests_Manager_Form" runat="server">
	</form>
         <!--#include file="../Pages/footer.inc"-->   

</body>
</html>
