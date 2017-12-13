<%@ Page Language="C#" Inherits="iWork.Send_Email" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>Send_Email</title>
</head>
<body>
    <% if(Session["Username"] != null){ 
    Response.WriteFile("Pages/menu.inc");
    } else if(Session["Username"] == null){
    Response.WriteFile("Pages/unsigned-menu.inc");
    }
    %>
	<form id="Send_Email_Form" runat="server">
        <asp:Label id="lbl_recipient" runat="server" Text="To:"></asp:Label><br />
        <asp:TextBox id="txt_recipient" runat="server"></asp:TextBox><br/> 
        <asp:Label id="lbl_subject" runat="server" Text="Subject:"></asp:Label><br />
        <asp:TextBox id="txt_subject" runat="server"></asp:TextBox><br/>
        <asp:Label id="lbl_body" runat="server" Text="Body:"></asp:Label><br />
        <asp:TextBox id="txt_body" runat="server" TextMode="MultiLine" MaxLength="3000" Columns="60" Rows="15"></asp:TextBox><br/>
        <asp:Button id="btn_send_email" runat="server" Text="Send Email" OnClick="sendEmail"></asp:Button>
	</form>
</body>
</html>
