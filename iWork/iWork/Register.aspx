<%@ Page Language="C#" Inherits="iWork.Register" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>Register</title>
</head>
<body>
	<form id="Register_Form" runat="server">
        <asp:Label id="lbl_username" runat="server" Text="Username:"></asp:Label><br />
        <asp:TextBox id="txt_username" runat="server"></asp:TextBox><br/>
        <asp:Label id="lbl_password" runat="server" Text="Password:"></asp:Label><br />
        <asp:TextBox id="txt_password" runat="server" TextMode="Password"></asp:TextBox><br/>
        <asp:Label id="lbl_password2" runat="server" Text="Repeat Password:"></asp:Label><br />
        <asp:TextBox id="txt_password2" runat="server" TextMode="Password"></asp:TextBox><br/>
        <asp:Label id="lbl_email" runat="server" Text="Email:"></asp:Label><br />
        <asp:TextBox id="txt_email" runat="server" TextMode="Email"></asp:TextBox><br/>
        <asp:Label id="lbl_first_name" runat="server" Text="First Name:"></asp:Label><br />
        <asp:TextBox id="txt_first_name" runat="server" ></asp:TextBox><br/>
        <asp:Label id="lbl_middle_name" runat="server" Text="Middle Name:"></asp:Label><br />
        <asp:TextBox id="txt_middle_name" runat="server" ></asp:TextBox><br/>
        <asp:Label id="lbl_last_name" runat="server" Text="Last Name:"></asp:Label><br />
        <asp:TextBox id="txt_last_name" runat="server" ></asp:TextBox><br/>
        <asp:Label id="lbl_birthdate" runat="server" Text="Birth Date: (YYYY-MM-DD)"></asp:Label><br />
        <asp:TextBox id="txt_birthdate" runat="server" TextMode="Date"></asp:TextBox><br/>
        <asp:Label id="lbl_experience" runat="server" Text="Years Of Experience:"></asp:Label><br />
        <asp:TextBox id="txt_experience" runat="server" TextMode="Number"></asp:TextBox><br/>
        <asp:Button id="btn_register" runat="server" Text="Register" OnClick="registerUser"></asp:Button>
	</form>
</body>
</html>
