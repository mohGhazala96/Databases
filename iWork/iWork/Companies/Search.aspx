<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWork.Companies.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <form action="http://localhost/MyTestApp/Default.aspx" method="post">
            <input name="textField" type="textField" id="textField" placeholder="Search Text"/>
            <br /><br />
            <asp:RadioButtonList ID="search_type" runat="server">
                <asp:ListItem Text="Name" Value="name" Selected="True" />
                <asp:ListItem Text="Address" Value="address" />
                <asp:ListItem Text="Type" Value="type" />
            </asp:RadioButtonList>
            <br /><br />
            <input type="submit" name="submit" value="Submit" id="submit" />
        </form>
        <br /><br />
        <asp:GridView ID="companies" runat="server" AutoGenerateColumns="false">    
            <Columns>
                <asp:BoundField DataField="name" HeaderText="Company Name" ItemStyle-Width="150" />
            </Columns>    
        </asp:GridView>
    </form>
</body>
</html>
