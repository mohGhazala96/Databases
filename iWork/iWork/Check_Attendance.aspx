<%@ Page Language="C#" Inherits="iWork.Check_Attendance" EnableEventValidation="false"%>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>Check_Attendance</title>
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
	<form id="check_attendance" runat="server">
    <div class="form-group">
    <asp:Label id="lbl_from_date" runat="server" Text="From Date (Leave empty if you want from the beginning):"></asp:Label><br />
    <asp:TextBox id="txt_from_date" runat="server" CssClass="form-control"></asp:TextBox><br/>
    <asp:Label id="lbl_to_date" runat="server" Text="To Date (Leave empty if you want till the end):"></asp:Label><br />
    <asp:TextBox id="txt_to_date" runat="server" CssClass="form-control"></asp:TextBox><br/>  
    <asp:Button id="btn_view_attendance" runat="server" Text="Show Attendance" OnClick="viewAttendance" CssClass="btn btn-default"></asp:Button><br />
    </div>
    <asp:Label id="lbl_shoutbox" runat="server"></asp:Label>
	</form>
    </div>
    </div>
</body>
</html>
