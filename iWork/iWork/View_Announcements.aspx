<%@ Page Language="C#" Inherits="iWork.View_Announcements" EnableEventValidation="false"%>
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
    <div class="panel panel-default"> 
    <div class="panel-body"> 
	<form id="View_Announcements_Form" runat="server">
      

	</form>
    </div>
    </div>
        <!--#include file="Pages/footer.inc"-->
</body>
</html>
