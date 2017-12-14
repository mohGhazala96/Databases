<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="iWork.Companies.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>List</title>
</head>
<body>
    <% if(Session["Username"] != null){ 
    Response.WriteFile("../Pages/menu.inc");
    } else if(Session["Username"] == null){
    Response.WriteFile("../Pages/unsigned-menu.inc");
    }
    %>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false">    
             <Columns>    
                 <asp:BoundField DataField="name" HeaderText="Company Name" ItemStyle-Width="150" />
                 <asp:BoundField DataField="type" HeaderText="Company Type" ItemStyle-Width="150" />
                 <asp:HyperLinkField DataNavigateUrlFields="email" DataNavigateUrlFormatString="/Companies.aspx?email={0}" Text="View Company" />
             </Columns>    
            </asp:GridView>
                

        </div>
        <asp:Button id="btn_sort_companies" OnClick="Sort_Companies" Text="Sort Companies by Average Salary"></asp:Button>
        <asp:Button id="btn_search_companies" OnClick="Search_Companies" Text="Search Companies"></asp:Button>

    </form>
        <!--#include file="../Pages/footer.inc"-->
</body>
</html>
