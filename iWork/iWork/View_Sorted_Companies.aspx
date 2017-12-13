<%@ Page Language="C#" Inherits="iWork.View_Sorted_Companies" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>View_Sorted_Companies</title>
</head>
<body>
    <% if(Session["Username"] != null){ 
    Response.WriteFile("Pages/menu.inc");
    } else if(Session["Username"] == null){
    Response.WriteFile("Pages/unsigned-menu.inc");
    }
    %>
	<form id="companies" runat="server">
	</form>
</body>
</html>
