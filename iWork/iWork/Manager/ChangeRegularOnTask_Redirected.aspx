<%@ Page Language="C#" Inherits="iWork.Manager.ChangeRegularOnTask_Redirected" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>ChangeRegularOnTask_Redirected</title>
</head>
<body>
	<form id="form1" runat="server">
        <asp:Label id="RegularEmployee" Text="Enter Regular Employee" runat="server"></asp:Label><br/> 
        <asp:TextBox id="RegularEmployee_in" runat="server"></asp:TextBox><br/> 
        <asp:Button id="changeRegularEmployee" runat="server" Text="Change Regular Empoyee" OnClick="DefineTask_btn"></asp:Button>

	</form>
</body>
</html>
