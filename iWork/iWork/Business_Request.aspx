<%@ Page Language="C#" Inherits="iWork.Business_Request" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>Business_Request</title>
</head>
<body>
	<form id="Business_Requests" runat="server">
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
        <asp:Button id="btn_apply_for_leave" runat="server" Text="Apply For Request" OnClick="applyForBusinessRequest"></asp:Button>
	</form>
</body>
</html>
