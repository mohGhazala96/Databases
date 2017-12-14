<%@ Page Language="C#" Inherits="iWork.Business_Request" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>Business_Request</title>
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
	<form id="Business_Requests" runat="server">
        <div class="form-group">
        <asp:Label id="lbl_replacement" runat="server" Text="Replacement:"></asp:Label><br />
        <asp:TextBox id="txt_replacement" runat="server"></asp:TextBox><br/> 
        <asp:Label id="lbl_from_date" runat="server" Text="From: (YYYY-MM-DD)"></asp:Label><br />
        <asp:TextBox id="txt_from_date" runat="server"></asp:TextBox><br/>
        <asp:Label id="lbl_to_date" runat="server" Text="To: (YYYY-MM-DD)"></asp:Label><br />
        <asp:TextBox id="txt_to_date" runat="server"></asp:TextBox><br/>
        <asp:Label id="lbl_destination" runat="server" Text="Destination:"></asp:Label><br />
        <asp:TextBox id="txt_destination" runat="server"></asp:TextBox><br/>
        <asp:Label id="lbl_purpose" runat="server" Text="Purpose:"></asp:Label><br />
        <asp:TextBox id="txt_purpose" runat="server"></asp:TextBox><br/>
        </div>
        <asp:Button id="btn_apply_for_leave" runat="server" Text="Apply For Request" OnClick="applyForBusinessRequest" CssClass="btn btn-default"></asp:Button>
        <asp:Label id="lbl_shoutbox" runat="server"></asp:Label>
	</form>
    </div>
    </div>
        <!--#include file="Pages/footer.inc"-->
</body>
</html>
