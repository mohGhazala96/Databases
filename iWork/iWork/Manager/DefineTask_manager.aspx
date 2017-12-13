<%@ Page Language="C#" Inherits="iWork.Manager.DefineTask_manager" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>DefineTask_manager</title>
</head>
<body>

	<form id="form1" runat="server">
        <asp:Label id="project_name" Text="Project Name" runat="server"></asp:Label><br/> 
        <asp:TextBox id="project_name_in" runat="server"></asp:TextBox><br/> 

        <asp:Label id="task" runat="server" Text="Tsk Name"></asp:Label><br />
        <asp:TextBox id="task_in" runat="server" ></asp:TextBox><br />
            
        <asp:Label id="deadline" runat="server" Text=" Start date"></asp:Label><br />
        <asp:TextBox id="deadline_in" runat="server"></asp:TextBox><br />

        <asp:Label id="description" runat="server" Text="Description"></asp:Label><br/> 
        <asp:TextBox id="description_in" runat="server"></asp:TextBox><br/>
            
        <asp:Label id="regularEmployee" runat="server" Text="Regular Employee"></asp:Label><br/> 
        <asp:TextBox id="regularEmployee_in" runat="server"></asp:TextBox><br/> 
            
        <asp:Button id="DefineTask" runat="server" Text="Define Task" OnClick="DefineTask_btn"></asp:Button>

     
	</form>
   
        
</body>
</html>
