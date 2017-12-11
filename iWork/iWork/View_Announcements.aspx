<%@ Page Language="C#" Inherits="iWork.View_Announcements" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>View_Announcements</title>
</head>
<body>
    <% if(Session["Username"] != null){ 
    Response.WriteFile("Pages/menu.inc");
    } else if(Session["Username"] == null){
    Response.WriteFile("Pages/unsigned-menu.inc");
    }
    %>
	<form id="View_Announcements_Form" runat="server">
            
	</form>
</body>
</html>
