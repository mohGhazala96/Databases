<%@ Page Language="C#" Inherits="iWork.Search_Jobs" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>Search_Jobs</title>
</head>
<body>
    <% if(Session["Username"] != null){ 
    Response.WriteFile("Pages/menu.inc");
    } else if(Session["Username"] == null){
    Response.WriteFile("Pages/unsigned-menu.inc");
    }
    %>

	<form id="Search_Jobs_Form" runat="server">
       <asp:Label id="lbl_search" runat="server" Text="Enter Keywords"></asp:Label><br />
       <asp:TextBox id="txt_search" runat="server"></asp:TextBox><br />
       <asp:Button id="btn_search" runat="server" Text="Search" OnClick="searchJobs"></asp:Button><br />    
            
	</form>
</body>
</html>
