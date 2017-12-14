<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View_Requests.aspx.cs" Inherits="iWork.HR.View_Requests" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <% if(Session["Username"] != null){ 
    Response.WriteFile("/Pages/menu.inc");
    } else if(Session["Username"] == null){
    Response.WriteFile("/Pages/unsigned-menu.inc");
    }
    %>
    <asp:Label ID="error" Text="You are not logged in or you are not an HR employee" runat="server"></asp:Label>

    <form runat="server">
        <asp:Panel ID="data" runat="server">
            <h3>Business Requests</h3>
            <asp:GridView ID="business" runat="server" AutoGenerateColumns="false" OnRowCommand="requestAction" >
                <Columns>
                    <asp:BoundField DataField="start_date" HeaderText="Start Date" />
                    <asp:BoundField DataField="end_date" HeaderText="End Date" />
                    <asp:BoundField DataField="applicant" HeaderText="Applicant" />
                    <asp:BoundField DataField="request_date" HeaderText="Request Date" />
                    <asp:BoundField DataField="total_days" HeaderText="Total Days" />
                    <asp:BoundField DataField="destination" HeaderText="Destination" />
                    <asp:BoundField DataField="purpose" HeaderText="Purpose" />
                    <asp:ButtonField ButtonType="Button" CommandName="acceptBusiness" Text="Accept" />
                    <asp:ButtonField ButtonType="Button" CommandName="rejectBusiness" Text="Reject" />
                </Columns>
            </asp:GridView>

            <h3>Leave Requests</h3>
            <asp:GridView ID="leave" runat="server" AutoGenerateColumns="false" OnRowCommand="requestAction" >
                <Columns>
                    <asp:BoundField DataField="start_date" HeaderText="Start Date" />
                    <asp:BoundField DataField="end_date" HeaderText="End Date" />
                    <asp:BoundField DataField="applicant" HeaderText="Applicant" />
                    <asp:BoundField DataField="request_date" HeaderText="Request Date" />
                    <asp:BoundField DataField="total_days" HeaderText="Total Days" />
                    <asp:BoundField DataField="type" HeaderText="Type" />
                    <asp:ButtonField ButtonType="Button" CommandName="acceptLeave" Text="Accept" />
                    <asp:ButtonField ButtonType="Button" CommandName="rejectLeave" Text="Reject" />
                </Columns>
            </asp:GridView>
        </asp:Panel>
    </form>
    <!--#include file="/Pages/footer.inc"-->
</body>
</html>