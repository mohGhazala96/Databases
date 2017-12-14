<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View_Applications.aspx.cs" Inherits="iWork.HR.View_Applications" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <asp:Label ID="error" Text="You are not logged in or you are not an HR employee" runat="server"></asp:Label>

    <form runat="server">
        <asp:Panel ID="data" runat="server">
            <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false" OnRowCommand="applicationAction" >    
                <Columns>
                    <asp:BoundField DataField="job" HeaderText="Job Title" />
                    <asp:BoundField DataField="score" HeaderText="Score" />
                    <asp:BoundField DataField="personal_email" HeaderText="Personal Email" />
                    <asp:BoundField DataField="birth_date" HeaderText="Birth Date" />
                    <asp:BoundField DataField="years_of_experience" HeaderText="Years of Experience" />
                    <asp:BoundField DataField="username" HeaderText="Username" />
                    <asp:BoundField DataField="first_name" HeaderText="First Name" />
                    <asp:BoundField DataField="middle_name" HeaderText="Middle Name" />
                    <asp:BoundField DataField="last_name" HeaderText="Last Name" />
                    <asp:BoundField DataField="age" HeaderText="Age" />
                    <asp:ButtonField ButtonType="Button" CommandName="acceptApplication" Text="Accept" />
                    <asp:ButtonField ButtonType="Button" CommandName="rejectApplication" Text="Reject" />
                </Columns>
            </asp:GridView>
        </asp:Panel>

        <asp:Panel ID="form1" runat="server">
            <asp:TextBox id="job_title" runat="server" placeholder="Job Title"></asp:TextBox>
            <input type="submit" name="submit" value="Update" id="submit" />
        </asp:Panel>
    </form>
</body>
</html>