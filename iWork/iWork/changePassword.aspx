<%@ Page Language="C#" Inherits="iWork.changePassword" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>changePassword</title>
</head>
<body>
    <% if(Session["Username"] != null){ 
    Response.WriteFile("Pages/menu.inc");
    } else if(Session["Username"] == null){
    Response.WriteFile("Pages/unsigned-menu.inc");
    }
    %>
	<form id="changePassForm" runat="server">
        <div class="form-group">
        <asp:Label id="lbl_username" runat="server" Text="Username:"></asp:Label><br />
        <asp:Label id="lbl_oldpassword" runat="server" Text="Old Password:"></asp:Label><br />
        <asp:TextBox id="txt_oldpassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox><br/>
		<asp:Label id="lbl_newpassword" runat="server" Text="New Password:"></asp:Label><br />
        <asp:TextBox id="txt_newpassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox><br/>
	    <asp:Label id="lbl_repeatpassword" runat="server" Text="Repeat Password:"></asp:Label><br />
        <asp:TextBox id="txt_repeatpassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox><br/>
        <asp:Button id="btn_changePass" runat="server" Text="Change Password" OnClick="changePass" CssClass="btn btn-default"></asp:Button><br />
        <asp:Label id="lbl_shoutout" runat="server"></asp:Label>
        </div>
	</form>
        <!--#include file="Pages/footer.inc"-->
</body>
</html>
