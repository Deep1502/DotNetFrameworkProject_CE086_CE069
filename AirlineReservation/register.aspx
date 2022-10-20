<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="AirlineReservation.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
</head>


<form id="form1" runat="server">
<section class="h-100 bg-dark">
   
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col">
        <div class="card card-registration my-4">
          <div class="row g-0">
            <div class="col-xl-6 d-none d-xl-block">
              <img src="https://images.unsplash.com/photo-1615317779547-2078d82c549a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80"
                alt="Sample photo" class="img-fluid"
                style="border-top-left-radius: .25rem; border-bottom-left-radius: .25rem;" />
            </div>
            <div class="col-xl-6">
              <div class="card-body p-md-5 text-black">
                <h3 class="mb-5 text-uppercase">Airline Reservation system</h3>
                  <h3 class="mb-5 text-uppercase">Register Yourself here</h3>

                <div class="row">
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <asp:TextBox ID="tbFName" runat="server"></asp:TextBox>
                      <label class="form-label" for="form3Example1m">First name</label>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidatorFName" runat="server" ControlToValidate="tbFName" ErrorMessage="First Name is required!!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                  </div>
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                       <asp:TextBox ID="tbLName" runat="server"></asp:TextBox>
                      <label class="form-label" for="form3Example1n">Last name</label>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidatorLName" runat="server" ControlToValidate="tbLName" ErrorMessage="Last Name is required!!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                  </div>
                </div>

                <div class="row">
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <asp:TextBox ID="tbEmail" runat="server" TextMode="Email"></asp:TextBox>
                      <label class="form-label" for="form3Example1m1">Email ID</label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="tbEmail" ErrorMessage="Email is required!!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                  </div>
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <asp:TextBox ID="tbPassword" runat="server" TextMode="Password"></asp:TextBox>
                      <label class="form-label" for="form3Example1n1">Password</label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ControlToValidate="tbPassword" ErrorMessage="Password is required!!" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidatorPassword" runat="server" ControlToValidate="tbPassword" ErrorMessage="Enter password of length 6 to 12." ForeColor="Red" ValidationExpression="[a-z|A-Z|0-9]{6,12}"></asp:RegularExpressionValidator>
                    </div>
                  </div>
                </div>

                <div class="form-outline mb-4">
                  <asp:TextBox ID="tbCPassword" runat="server" TextMode="Password"></asp:TextBox>
                  <label class="form-label" for="form3Example8">Confirm Password </label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorCPassword" runat="server" ControlToValidate="tbCPassword" ErrorMessage="Confirm Password is required!!" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidatorPassword" runat="server" ControlToCompare="tbPassword" ControlToValidate="tbCPassword" ErrorMessage="Password and confirm password don't match!!" ForeColor="Red"></asp:CompareValidator>
                </div>


              

                <div class="d-flex justify-content-end pt-3">
                  <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" CssClass="btn btn-warning btn-lg ms-2" />
                    
                <!-- <button type="button" >Submit form</button>  -->
                </div>
                  
                     Already registered? 
                    <asp:HyperLink ID="hlLogin" runat="server" ForeColor="Blue" NavigateUrl="~/login.aspx">&nbsp; Login</asp:HyperLink>
&nbsp;here.
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</form>

</html>
