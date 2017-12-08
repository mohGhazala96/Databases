<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Companies.aspx.cs" Inherits="Companies" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="grid1" runat="server" AutoGenerateColumns="false">    
             <Columns>    
                 <asp:BoundField DataField="name" HeaderText="Company Name" ItemStyle-Width="150" />
                 <asp:BoundField DataField="field" HeaderText="Company Field" ItemStyle-Width="150" />
             </Columns>    
            </asp:GridView>
        </div>
    </form>
</body>
</html>
