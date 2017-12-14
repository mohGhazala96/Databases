<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWork.Companies.WebForm2" EnableEventValidation="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Search</title>
</head>
<body>
    <% if(Session["Username"] != null){ 
    Response.WriteFile("../Pages/menu.inc");
    } else if(Session["Username"] == null){
    Response.WriteFile("../Pages/unsigned-menu.inc");
    }
    %>
    <form id="form1" runat="server">
        <form method="post">
                <div class="form-group">
            <input name="textField" type="textField" id="textField" placeholder="Search Text" class="form-control"/>
            <br /><br />
            <asp:RadioButtonList ID="search_type" runat="server">
                <asp:ListItem Text=" Name" Value="name" Selected="True" />
                <asp:ListItem Text=" Address" Value="address" />
                <asp:ListItem Text=" Type" Value="type" />
            </asp:RadioButtonList>
            <br /><br />
                    </div>
            <input type="submit" name="submit" value="Submit" id="submit" class="btn btn-default"/>
                    
        </form>
        <br /><br />
        <asp:GridView ID="companies" runat="server" AutoGenerateColumns="false" CssClass="table table-striped">    
            <Columns>
                <asp:BoundField DataField="name" HeaderText="Company Name" ItemStyle-Width="150" />
                <asp:HyperLinkField DataNavigateUrlFields="email" DataNavigateUrlFormatString="/Companies.aspx?email={0}" Text="View Company" />
            </Columns>    
        </asp:GridView>

        <asp:Button id="btn_sort_companies" OnClick="Sort_Companies" Text="Sort Companies by Average Salary"></asp:Button>
        <asp:Button id="btn_list_companies" OnClick="List_Companies" Text="List Companies"></asp:Button>
    </form>

        <!--#include file="../Pages/footer.inc"-->
</body>
</html>
