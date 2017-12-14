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
    <div class="panel panel-default"> 
    <div class="panel-body"> 
	<form id="Send_Email_Form" runat="server">
        <div class="form-group">
        <asp:Label id="lbl_recipient" runat="server" Text="To:"></asp:Label><br />
        <asp:TextBox id="txt_recipient" runat="server" CssClass="form-control"></asp:TextBox><br/> 
        <asp:Label id="lbl_subject" runat="server" Text="Subject:"></asp:Label><br />
        <asp:TextBox id="txt_subject" runat="server" CssClass="form-control"></asp:TextBox><br/>
        <asp:Label id="lbl_body" runat="server" Text="Body:"></asp:Label><br />
        <asp:TextBox id="txt_body" runat="server" TextMode="MultiLine" MaxLength="3000" Columns="60" Rows="15" CssClass="form-control"></asp:TextBox><br/>
        </div>
        <asp:Button id="btn_send_email" runat="server" Text="Send Email" OnClick="sendEmail" CssClass="btn btn-default"></asp:Button>
        <asp:Label id="lbl_shoutbox" runat="server"></asp:Label>
	</form>
    </div>
    </div>
</body>
</html>
