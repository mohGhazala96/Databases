<%@ Page Language="C#" Inherits="iWork.Default" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>Default</title>
</head>
<body>
    <% if(Session["Username"] != null){ 
        Response.WriteFile("Pages/menu.inc");
    } else if(Session["Username"] == null){
        Response.WriteFile("Pages/unsigned-menu.inc");
    }
    %>
	<form id="loginForm" runat="server">
        <asp:Label id="lbl_username" runat="server" Text="Username:"></asp:Label>
        <asp:TextBox id="txt_username" runat="server"></asp:TextBox><br/>
        <asp:Label id="lbl_password" runat="server" Text="Password:"></asp:Label>
        <asp:TextBox id="txt_password" runat="server" TextMode="Password"></asp:TextBox><br/>
        <asp:Button id="btn_login" runat="server" Text="Login" OnClick="login"></asp:Button>
    </form>
    <form id="logged_inForm" runat="server">
        <asp:Label id="lbl_loggedin_username" runat="server" Text="Username:"></asp:Label>
        <asp:Button id="btn_logout" runat="server" Text="Logout" OnClick="logout"></asp:Button>
    </form>
    <!--#include file="Pages/footer.inc"-->
</body>
</html>
