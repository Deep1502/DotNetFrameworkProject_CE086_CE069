<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewCustomers.aspx.cs" Inherits="AirlineReservation.viewCustomers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Customers</title>
</head>
<body>
    <h1>VIEW CUSTOMERS</h1>
    <form id="form1" runat="server">
        <div>
            Customers:<br />
            <asp:GridView ID="GridViewCustomers" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <br />
            <asp:HyperLink ID="hlhome" runat="server" ForeColor="Blue" NavigateUrl="~/adminhome.aspx">Back to home page</asp:HyperLink>
        </div>
    </form>
</body>
</html>
