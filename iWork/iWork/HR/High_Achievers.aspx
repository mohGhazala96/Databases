<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="High_Achievers.aspx.cs" Inherits="iWork.HR.High_Achievers" %>

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
    <form id="form1" runat="server">
        <asp:Label ID="error" Text="You are not logged in or you are not an HR employee" runat="server"></asp:Label>

        <asp:Panel ID="data" runat="server">
            <asp:Panel ID="form" runat="server">
                <asp:TextBox id="year" runat="server" placeholder="Year"></asp:TextBox>
                <asp:TextBox id="month" runat="server" placeholder="Month"></asp:TextBox>
                <input type="submit" name="submit" value="Submit" id="submit" />
            </asp:Panel>

            <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false">    
             <Columns>
                 <asp:BoundField DataField="username" HeaderText="Username" />
                 <asp:BoundField DataField="first_name" HeaderText="First Name" />
                 <asp:BoundField DataField="middle_name" HeaderText="Middle Name" />
                 <asp:BoundField DataField="last_name" HeaderText="Last Name" />
                 <asp:BoundField DataField="hours_spent" HeaderText="Hours Spent" />
             </Columns>
            </asp:GridView>

            <asp:Button id="congratulate_button" runat="server" Text="Congratulate High Achievers" OnClick="congratulate"></asp:Button>
        </asp:Panel>
    </form>
    <!--#include file="/Pages/footer.inc"-->
</body>
</html>