<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminhome.aspx.cs" Inherits="AirlineReservation.adminhome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Home</title>
</head>
<body>
    <h1>ADMIN HOME PAGE</h1>
    <form id="form1" runat="server">
        <div>
            Services:<br />
            <asp:HyperLink ID="hlViewCust" runat="server" ForeColor="Blue" NavigateUrl="~/viewCustomers.aspx">View Customers</asp:HyperLink>
            <br />
            <br />
            <asp:HyperLink ID="hlAirline" runat="server" NavigateUrl="~/airlines.aspx">Manage Airlines</asp:HyperLink>
            <br />
            <br />
            <asp:HyperLink ID="hlViewTicket" runat="server" ForeColor="Blue" NavigateUrl="~/ViewTicketBookings.aspx">View Ticket Bookings</asp:HyperLink>
            <br />
            <br />
            <br />
            <asp:Button ID="btnLogout" runat="server" OnClick="btnLogout_Click" Text="Logout" />
        </div>
    </form>
</body>
