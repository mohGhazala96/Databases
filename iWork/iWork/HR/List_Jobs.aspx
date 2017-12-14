<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="List_Jobs.aspx.cs" Inherits="iWork.HR.List_Jobs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="error" Text="You are not logged in or you are not an HR employee" runat="server"></asp:Label>

        <asp:Panel ID="data" runat="server">
            <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false">    
             <Columns>    
                 <asp:BoundField DataField="title" HeaderText="Title" />
                 <asp:BoundField DataField="short_description" HeaderText="Short Description" />
                 <asp:BoundField DataField="detailed_description" HeaderText="Detailed Description" />
                 <asp:BoundField DataField="min_experience" HeaderText="Minimum Experience" />
                 <asp:BoundField DataField="salary" HeaderText="Salary" />
                 <asp:BoundField DataField="deadline" HeaderText="Deadline" />
                 <asp:BoundField DataField="no_of_vacancies" HeaderText="No. of Vacancies" />
                 <asp:BoundField DataField="working_hours" HeaderText="Working Hours" />
                 <asp:HyperLinkField DataNavigateUrlFields="title" DataNavigateUrlFormatString="/HR/Edit_Job.aspx?title={0}" Text="View/Edit Job" />
             </Columns>    
            </asp:GridView>
        </asp:Panel>
    </form>
</body>
</html>
