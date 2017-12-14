<%@ Page Language="C#" Inherits="iWork.ChangeRegularOnTask" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>ChangeRegularOnTask</title>
</head>
<body>
                <% if(Session["Username"] != null){ 
Response.WriteFile("../Pages/menu.inc");
} else if(Session["Username"] == null){
Response.WriteFile("../Pages/unsigned-menu.inc");
}
%>

	<form id="form1" runat="server">
                          <asp:Label id="ErrorMessage" Text="" runat="server"></asp:Label><br/> 

	</form>
         <!--#include file="../Pages/footer.inc"-->   

</body>
</html>
