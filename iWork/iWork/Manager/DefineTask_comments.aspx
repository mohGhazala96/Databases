<%@ Page Language="C#" Inherits="iWork.Manager.DefineTask_comments" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>DefineTask_comments</title>
</head>
<body>
	<form id="form1" runat="server">
        <asp:Label id="commentTitle" Text="Comment Title" runat="server"></asp:Label><br/> 
        <asp:TextBox id="commentTitle_in" runat="server"></asp:TextBox><br/> 
        <asp:Button id="AddMore" runat="server" Text="Add another Comment" OnClick="addComment"></asp:Button>
        <asp:Button id="Finish" runat="server" Text="Finish" OnClick="finish"></asp:Button>


	</form>
</body>
</html>
