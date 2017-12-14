<%@ Page Language="C#" Inherits="iWork.Leave_Request" EnableEventValidation="false"%>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>Leave_Request</title>
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
	<form id="Leave_Requests" runat="server">
        <div class="form-group">
        <asp:Label id="lbl_replacement" runat="server" Text="Replacement:"></asp:Label><br />
        <asp:TextBox id="txt_replacement" runat="server" CssClass="form-control"></asp:TextBox><br/> 
        <asp:Label id="lbl_from_date" runat="server" Text="From: (YYYY-MM-DD)"></asp:Label><br />
        <asp:TextBox id="txt_from_date" runat="server" CssClass="form-control"></asp:TextBox><br/>
        <asp:Label id="lbl_to_date" runat="server" Text="To: (YYYY-MM-DD)"></asp:Label><br />
        <asp:TextBox id="txt_to_date" runat="server" CssClass="form-control"></asp:TextBox><br/>
        <asp:Label id="lbl_type" runat="server" Text="Type:"></asp:Label><br />
        <asp:TextBox id="txt_type" runat="server" CssClass="form-control"></asp:TextBox><br/>
        </div>
        <asp:Button id="btn_apply_for_leave" runat="server" Text="Apply For Request" OnClick="applyForLeaveRequest" CssClass="btn btn-default"></asp:Button>
        <asp:Label id="lbl_shoutbox" runat="server"></asp:Label>
    </form>
    </div>
    </div>
</body>
</html>
