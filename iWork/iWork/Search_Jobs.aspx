<%@ Page Language="C#" Inherits="iWork.Search_Jobs" EnableEventValidation="false"%>
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
    <div class="panel panel-default"> 
    <div class="panel-body">
	<form id="Search_Jobs_Form" runat="server">

    <div class="form-group">
       <asp:Label id="lbl_search" runat="server" Text="Enter Keywords"></asp:Label><br />
       <asp:TextBox id="txt_search" runat="server" CssClass="form-control"></asp:TextBox><br />
       <asp:Button id="btn_search" runat="server" Text="Search" OnClick="searchJobs" CssClass="btn btn-default"></asp:Button><br />
     </div>
            
	</form>
        </div>
        </div>
        <!--#include file="Pages/footer.inc"-->
</body>
</html>
