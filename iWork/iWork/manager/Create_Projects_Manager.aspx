﻿<%@ Page Language="C#" Inherits="iWork.Create_Projects_Manager" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>Create_Projects_Manager</title>
</head>
<body>
	<form id="form1" runat="server">
        <asp:Label id="project_name" runat="server" Text="Project Name"></asp:Label><br />
        <asp:TextBox id="project_name_input" runat="server"></asp:TextBox><br/> 
          <asp:Label id="startDate" runat="server" Text=" Start date"></asp:Label><br />
        <asp:TextBox id="startDate_input" runat="server"></asp:TextBox><br/> 
         <asp:Label id="endDate" runat="server" Text="End date"></asp:Label><br />
        <asp:TextBox id="endDate_input" runat="server"></asp:TextBox><br/> 
        <asp:Button id="Btn_CreateProject" runat="server" Text="Create Project" OnClick="createProject"></asp:Button>

        </form>
</body>
</html>
