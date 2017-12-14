<%@ Page Language="C#" Inherits="iWork.Manager.DefineTask_comments" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>DefineTask_comments</title>
</head>
<body>
                <% if(Session["Username"] != null){ 
Response.WriteFile("../Pages/menu.inc");
} else if(Session["Username"] == null){
Response.WriteFile("../Pages/unsigned-menu.inc");
}
%>
	<form id="form1" runat="server">
                     <asp:Label id="ErrorMessage" Text="" runat="server"></asp:Label><br/> 

        <asp:Label id="commentTitle" Text="Comment Title" runat="server"></asp:Label><br/> 
        <asp:TextBox id="commentTitle_in" runat="server" CssClass="form-control"></asp:TextBox><br/> 
        <asp:Button id="AddMore" runat="server" Text="Add another Comment" OnClick="addComment" CssClass="btn btn-default"></asp:Button>
        <asp:Button id="Finish" runat="server" Text="Finish" OnClick="finish" CssClass="btn btn-default"></asp:Button>


	</form>
         <!--#include file="../Pages/footer.inc"-->   

</body>
</html>
