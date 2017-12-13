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
            <asp:Button id="btn_leave_request" runat="server" Text="Apply For a Leave Request" OnClick="leaveRequest"></asp:Button><br />
            <asp:Button id="btn_business_request" runat="server" Text="Apply For a Business Request" OnClick="businessRequest"></asp:Button><br />
            <asp:Button id="btn_view_requests" runat="server" Text="View Your Requests" OnClick="viewRequests"></asp:Button><br />
            <asp:Button id="btn_send_email" runat="server" Text="Send an Email" OnClick="sendEmail"></asp:Button><br />
            <asp:Button id="btn_view_emails" runat="server" Text="View Emails" OnClick="viewEmails"></asp:Button><br />
            <asp:Button id="btn_view_announcements" runat="server" Text="View Announcements" OnClick="viewAnnouncements"></asp:Button><br />
	</form>
    <form id="Job_Seeker" runat="server">
            <h1>Job Seeker stuff here</h1>
    </form>
    <form id="Manager" runat="server">
             <h1>Manager Member stuff here</h1><br />
<!--            <asp:Button id="btn_manager_view_requests" runat="server" Text="View Requests" OnClick="viewRequests_manager"></asp:Button><br />
-->            <asp:Button id="btn_manager_approve_reject_requests" runat="server" Text="View or Review Requests" OnClick="ReviewRequests_manager"></asp:Button><br />
<!--            <asp:Button id="btn_manager_view_applications" runat="server" Text="View Applications" OnClick="checkAttendance"></asp:Button><br />
-->           
            <asp:Button id="btn_manager_Review_appliactions" runat="server" Text="Review Applications" OnClick="ReviewJobs_manager"></asp:Button><br />
            <asp:Button id="btn_manager_create_project" runat="server" Text="Create Project" OnClick="Create_Projects_manager"></asp:Button><br />
            <asp:Button id="btn_manager_assign_to_project" runat="server" Text="Assign to Projects" OnClick="assignRegularOnProject_manager"></asp:Button><br />
            <asp:Button id="btn_manager_remove_from_project" runat="server" Text="Remove from Projects" OnClick="removeRegularOnProject_manager"></asp:Button><br />
            <asp:Button id="btn_manager_define_task" runat="server" Text="Define Tasks" OnClick="defineTask_manager"></asp:Button><br />
            <asp:Button id="btn_manager_change_regularEmployee_task" runat="server" Text="Change Employee on Task" OnClick="viewAnnouncements"></asp:Button><br />
            <asp:Button id="btn_manager_view_tasks" runat="server" Text="View Tasks" OnClick="viewAnnouncements"></asp:Button><br />

    </form>
    <form id="HR_Employee" runat="server">
            <h1>HR Employee stuff here</h1>
    </form>
    <form id="Regular_Employee" runat="server">
            <h1>Regular Employee stuff here</h1>
    </form>
</body>
</html>
