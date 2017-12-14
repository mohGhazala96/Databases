<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Total_Hours.aspx.cs" Inherits="iWork.HR.Total_Hours" %>

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
                <input type="submit" name="submit" value="Submit" id="submit" />
            </asp:Panel>

            <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false">    
             <Columns>    
                 <asp:BoundField DataField="username" HeaderText="Username" />
                 <asp:BoundField DataField="January" HeaderText="January" />
                 <asp:BoundField DataField="February" HeaderText="February" />
                 <asp:BoundField DataField="March" HeaderText="March" />
                 <asp:BoundField DataField="April" HeaderText="April" />
                 <asp:BoundField DataField="May" HeaderText="May" />
                 <asp:BoundField DataField="June" HeaderText="June" />
                 <asp:BoundField DataField="July" HeaderText="July" />
                 <asp:BoundField DataField="August" HeaderText="August" />
                 <asp:BoundField DataField="September" HeaderText="September" />
                 <asp:BoundField DataField="October" HeaderText="October" />
                 <asp:BoundField DataField="November" HeaderText="November" />
                 <asp:BoundField DataField="December" HeaderText="December" />
             </Columns>
            </asp:GridView>
        </asp:Panel>
    </form>
    <!--#include file="/Pages/footer.inc"-->
</body>
</html>
