<%@ Page Language="C#" Inherits="iWork.View_Requests" EnableEventValidation="false"%>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>View_Requests</title>
</head>
<body>
    <% if(Session["Username"] != null){ 
    Response.WriteFile("Pages/menu.inc");
    } else if(Session["Username"] == null){
    Response.WriteFile("Pages/unsigned-menu.inc");
    }
    %>
	<form id="View_Requests_Form" runat="server">
            <asp:Label id="lbl_shoutbox" runat="server"></asp:Label>
	</form>
        <!--#include file="Pages/footer.inc"-->
</body>
</html>
