<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="AirlineReservation.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 511px;
        }
    </style>
</head>
<body>
    <h1>HOME PAGE</h1>
    <form id="form1" runat="server">
        <div>
            Available airlines:<br />
            <asp:GridView ID="GridViewAirlines0" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Seats" HeaderText="Seats" SortExpression="Seats" />
                    <asp:BoundField DataField="AvailableSeats" HeaderText="AvailableSeats" SortExpression="AvailableSeats" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:BoundField DataField="Source" HeaderText="Source" SortExpression="Source" />
                    <asp:BoundField DataField="STime" HeaderText="STime" SortExpression="STime" />
                    <asp:BoundField DataField="Destination" HeaderText="Destination" SortExpression="Destination" />
                    <asp:BoundField DataField="DTime" HeaderText="DTime" SortExpression="DTime" />
                </Columns>
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Airline]"></asp:SqlDataSource>
            <br />
            <asp:Panel ID="PanelForm" runat="server">
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style2">Name:</td>
                        <td>
                            <asp:TextBox ID="tbName" runat="server"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ControlToValidate="tbName" ErrorMessage="Name is required!!" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Age:</td>
                        <td>
                            <asp:TextBox ID="tbAge" runat="server" TextMode="Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorAge" runat="server" ControlToValidate="tbAge" ErrorMessage="Age is required!!" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidatorAge" runat="server" ControlToValidate="tbAge" ErrorMessage="Person should be at least 5years old" ForeColor="Red" MaximumValue="90" MinimumValue="5" Type="Integer"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Gender:</td>
                        <td>
                            <asp:DropDownList ID="DropDownListGender" runat="server">
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                                <asp:ListItem>Others</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorGender" runat="server" ControlToValidate="DropDownListGender" ErrorMessage="Select one of the value from dropdown" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">FlightId:</td>
                        <td>
                            <asp:DropDownList ID="ddlFlightId" runat="server" DataSourceID="SqlDataSource1" DataTextField="Id" DataValueField="Id">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorFlight" runat="server" ControlToValidate="ddlFlightId" ErrorMessage="Select one of the value from dropdown" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Button ID="btnSubmit1" runat="server" Text="Book Ticket" OnClick="btnSubmit_Click"  />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </asp:Panel>
            <br />
                            <asp:Label ID="LabelError" runat="server"></asp:Label>
            <br />
            <asp:Panel ID="PanelButton" runat="server">
                <asp:Button ID="BookTicket" runat="server" OnClick="BookTicket_Click" Text="Book Ticket" />
            </asp:Panel>
            <br />
            <asp:HyperLink ID="hlViewMyTickets" runat="server" ForeColor="Blue" NavigateUrl="~/ViewUserTickets.aspx">View My Tickets</asp:HyperLink>
            <br />
            <br />
            <asp:Button ID="btnLogout" runat="server" OnClick="btnLogout_Click" Text="Logout" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
