<%@ Page Language="C#"  Inherits="iWork.Login"%>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>Default</title>
</head>
<body>
        <!--#include file="Pages/unsigned-menu.inc"-->
        <form id="loginForm" runat="server">
            <div class="form-group">
        <asp:Label id="lbl_username" runat="server" Text="Username:"></asp:Label>
        <asp:TextBox id="txt_username" runat="server" CssClass="form-control"></asp:TextBox><br/>
        <asp:Label id="lbl_password" runat="server" Text="Password:"></asp:Label>
        <asp:TextBox id="txt_password" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox><br/>
                </div>
        <asp:Button id="btn_login" runat="server" Text="Login" OnClick="login" CssClass="btn btn-default"></asp:Button>
    </form>
</body>
</html>
