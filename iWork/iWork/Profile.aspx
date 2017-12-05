<%@ Page Language="C#" Inherits="iWork.Profile" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>Profile</title>
</head>
<body>
	<form id="info" runat="server">
		<asp:Label id="lbl_username" runat="server" Text="Username:"></asp:Label><br />
        <asp:TextBox id="txt_username" runat="server"></asp:TextBox><br/>
        <asp:Label id="lbl_password" runat="server" Text="Password:"></asp:Label><br />
        <asp:Button id="btn_changePass" runat="server" Text="Change Password" OnClick="changePass"></asp:Button><br />
        <asp:Label id="lbl_personal_email" runat="server" Text="Personal Email:"></asp:Label><br />
        <asp:TextBox id="txt_personal_email" runat="server"></asp:TextBox><br/>
        <asp:Label id="lbl_first_name" runat="server" Text="First Name:"></asp:Label><br />
        <asp:TextBox id="txt_first_name" runat="server"></asp:TextBox><br/>
        <asp:Label id="lbl_middle_name" runat="server" Text="Middle Name:"></asp:Label><br />
        <asp:TextBox id="txt_middle_name" runat="server"></asp:TextBox><br/>
        <asp:Label id="lbl_last_name" runat="server" Text="Last Name:"></asp:Label><br />
        <asp:TextBox id="txt_last_name" runat="server"></asp:TextBox><br/>
        <asp:Label id="lbl_birth_date" runat="server" Text="Birth Date:"></asp:Label><br />
        <asp:TextBox id="txt_birth_date" runat="server"></asp:TextBox><br/>
        <asp:Label id="lbl_age" runat="server" Text="Age:"></asp:Label><br />
        <asp:Label id="lbl_age_value" runat="server" Text=""></asp:Label><br />
        <asp:Label id="lbl_years_of_exp" runat="server" Text="Years Of Experience:"></asp:Label><br />
        <asp:TextBox id="txt_years_of_exp" runat="server"></asp:TextBox><br/>
        <asp:Button id="btn_update" runat="server" Text="Update Info" OnClick="updateInfo"></asp:Button>
	</form>
    <form id="Staff_Member" runat="server">
			<h1>Staff Member stuff here</h1><br />
            <asp:Button id="btn_check_in" runat="server" Text="Check In" OnClick="checkIn"></asp:Button><br />
            <asp:Button id="btn_check_out" runat="server" Text="Check Out" OnClick="checkOut"></asp:Button><br />
            <asp:Button id="btn_check_attendance" runat="server" Text="Check Attendance" OnClick="checkAttendance"></asp:Button><br />

	</form>
    <form id="Job_Seeker" runat="server">
            <h1>Job Seeker stuff here</h1>
    </form>
    <form id="Manager" runat="server">
            <h1>Manager stuff here</h1>
    </form>
    <form id="HR_Employee" runat="server">
            <h1>HR Employee stuff here</h1>
    </form>
    <form id="Regular_Employee" runat="server">
            <h1>Regular Employee stuff here</h1>
    </form>
</body>
</html>
