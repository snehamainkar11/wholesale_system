<%@ Page Language="C#" AutoEventWireup="true"    MasterPageFile="~/Site.Master" CodeFile="profile.aspx.cs" Inherits="wholesale.profile" %>
	
<asp:Content ID="conten1" ContentPlaceHolderID="Maincontent" runat="server">  



<!-- BREADCRUMB -->
<nav class="py-5">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <!-- Breadcrumb -->
                <ol class="breadcrumb mb-0 font-size-xs text-gray-400">
                    <li class="breadcrumb-item">
                        <a class="text-gray-400" href="index.aspx">Home</a>
                    </li>
                    <li class="breadcrumb-item active">
                        My Account
                    </li>
                </ol>
            </div>
        </div>
        <a href="profile.aspx"></a>
    </div>
</nav>
<!-- CONTENT -->
<section class="pt-7 pb-12">
    <div class="container">
        <div class="row">
            <div class="col-12 text-center">
                <!-- Heading -->
                <h3 class="mb-10">My Account</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-md-3">
                <!-- Nav -->
                <nav class="mb-10 mb-md-0">
                    <div class="list-group list-group-sm list-group-strong list-group-flush-x">
                        <a class="list-group-item list-group-item-action dropright-toggle" href="cart.aspx">
                            Orders
                        </a>
                        <a class="list-group-item list-group-item-action dropright-toggle" href="WishList.aspx">
                            Wishlist
                        </a>
                        <a class="list-group-item list-group-item-action dropright-toggle active" href="profile.aspx">
                            Personal Info
                        </a>
                    </div>
                </nav>
            </div>
            <div class="col-12 col-md-9 col-lg-8 offset-lg-1">
                <!-- Form -->
                <form>
                    <div class="row">
                        <div class="col-12 col-md-6">
                            <!-- Email -->
                            <div class="form-group">
                                <label for="accountFirstName">
                                    First Name *
                                </label>
                                <input class="form-control form-control-sm" id="accountFirstName" type="text" placeholder="First Name *" value="Daniel" required>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <!-- Email -->
                            <div class="form-group">
                                <label for="accountLastName">
                                    Last Name *
                                </label>
                                <input class="form-control form-control-sm" id="accountLastName" type="text" placeholder="Last Name *" value="Robinson" required>
                            </div>
                        </div>
                        <div class="col-12">
                            <!-- Email -->
                            <div class="form-group">
                                <label for="accountEmail">
                                    Email Address *
                                </label>
                                <input class="form-control form-control-sm" id="accountEmail" type="email" placeholder="Email Address *" value="user@email.com" required>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <!-- Password -->
                            <div class="form-group">
                                <label for="accountPassword">
                                    Current Password *
                                </label>
                                <input class="form-control form-control-sm" id="accountPassword" type="password" placeholder="Current Password *" required>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <!-- Password -->
                            <div class="form-group">
                                <label for="AccountNewPassword">
                                    New Password *
                                </label>
                                <input class="form-control form-control-sm" id="AccountNewPassword" type="password" placeholder="New Password *" required>
                            </div>
                        </div>
                        <div class="col-12 col-lg-6">
                            <!-- Birthday -->
                            <div class="form-group">
                                <!-- Label -->
                                <label>Date of Birth</label>
                                <!-- Inputs -->
                                <div class="form-row">
                                    <div class="col-auto">
                                        <!-- Date -->
                                        <label class="sr-only" for="accountDate">
                                            Date
                                        </label>
                                        <select class="custom-select custom-select-sm" id="accountDate">
                                            <option>10</option>
                                            <option>11</option>
                                            <option selected>12</option>
                                        </select>
                                    </div>
                                    <div class="col">
                                        <!-- Date -->
                                        <label class="sr-only" for="accountMonth">
                                            Month
                                        </label>
                                        <select class="custom-select custom-select-sm" id="accountMonth">
                                            <option>January</option>
                                            <option selected>February</option>
                                            <option>March</option>
                                        </select>
                                    </div>
                                    <div class="col-auto">
                                        <!-- Date -->
                                        <label class="sr-only" for="accountYear">
                                            Year
                                        </label>
                                        <select class="custom-select custom-select-sm" id="accountYear">
                                            <option>1990</option>
                                            <option selected>1991</option>
                                            <option>1992</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-6">
                            <!-- Gender -->
                            <div class="form-group mb-8">
                                <label>Gender</label>
                                <div class="btn-group-toggle" data-toggle="buttons">
                                    <label class="btn btn-sm btn-outline-border active">
                                        <input type="radio" name="gender" checked> Male
                                    </label>
                                    <label class="btn btn-sm btn-outline-border">
                                        <input type="radio" name="gender"> Female
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <!-- Button -->
                            <button class="btn btn-dark" type="submit">Save Changes</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>


</asp:Content>
