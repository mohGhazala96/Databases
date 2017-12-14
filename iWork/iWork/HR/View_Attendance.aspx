<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View_Attendance.aspx.cs" Inherits="iWork.HR.View_Attendance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <asp:Label ID="error" Text="You are not logged in or you are not an HR employee" runat="server"></asp:Label>

    <form runat="server">
        <asp:Panel ID="data" runat="server">
            <asp:Panel ID="form1" runat="server">
                <asp:TextBox id="start_date" runat="server" placeholder="Start Date"></asp:TextBox>
                <asp:TextBox id="end_date" runat="server" placeholder="End Date"></asp:TextBox>
                <input type="submit" name="submit" value="Submit" id="submit" />
            </asp:Panel>

            <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false" >    
                <Columns>
                    <asp:BoundField DataField="username" HeaderText="Staff Member" />
                    <asp:BoundField DataField="attendance_date" HeaderText="Attendance Date" />
                    <asp:BoundField DataField="start_time" HeaderText="Start Time" />
                    <asp:BoundField DataField="end_time" HeaderText="End Time" />
                    <asp:BoundField DataField="duration" HeaderText="Duration" />
                    <asp:BoundField DataField="missed_hours" HeaderText="Missing Hours" />
                </Columns>
            </asp:GridView>
        </asp:Panel>
    </form>
</body>
</html>