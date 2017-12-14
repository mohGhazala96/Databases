<%@ Page Language="C#" Inherits="iWork.Manager.ChangeRegularOnTask_Redirected" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>ChangeRegularOnTask_Redirected</title>
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

        <asp:Label id="RegularEmployee" Text="Enter Regular Employee" runat="server"></asp:Label><br/> 
        <asp:TextBox id="RegularEmployee_in" runat="server" CssClass="form-control"></asp:TextBox><br/> 
        <asp:Button id="changeRegularEmployee" runat="server" Text="Change Regular Empoyee" OnClick="DefineTask_btn" CssClass="btn btn-default"></asp:Button>

	</form>
         <!--#include file="../Pages/footer.inc"-->   

</body>
</html>
