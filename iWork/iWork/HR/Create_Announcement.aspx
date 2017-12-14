<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Create_Announcement.aspx.cs" Inherits="iWork.HR.Create_Announcement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="error" Text="You are not logged in or you are not an HR employee" runat="server"></asp:Label>

        <asp:Panel ID="data" runat="server">
            <form method="post">
                <!-- Check how to do placeholders. Check if we need the name to be adjusted, too. -->
                <asp:TextBox id="title" runat="server" placeholder="Title"></asp:TextBox>
                <asp:TextBox id="type" runat="server" placeholder="Type"></asp:TextBox>
                <asp:TextBox id="description" runat="server" TextMode="multiline" Columns="50" Rows="5" placeholder="Description"></asp:TextBox>

                <input type="submit" name="submit" value="Update" id="submit" />
            </form>
        </asp:Panel>
    </form>
</body>
</html>
