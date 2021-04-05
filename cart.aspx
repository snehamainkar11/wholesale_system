<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeFile="cart.aspx.cs" Inherits="wholesale.cart" %>
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
                        <a class="list-group-item list-group-item-action dropright-toggle active" href="cart.aspx">
                            Orders
                        </a>
                        <a class="list-group-item list-group-item-action dropright-toggle" href="WishList.aspx">
                            Wishlist
                        </a>
                        <a class="list-group-item list-group-item-action dropright-toggle" href="profile.aspx">
                            Personal Info
                        </a>
                    </div>
                </nav>
            </div>
            <div class="col-12 col-md-9 col-lg-8 offset-lg-1">
                   <asp:Repeater Id="rptr" runat="server" >
                                        <ItemTemplate>
                <div class="card card-lg mb-5 border">
                    <div class="card-body pb-0">
                        <!-- Info -->
                        <div class="card card-sm">
                            <div class="card-body bg-light">
                                <div class="row">
                                    <div class="col-6 col-lg-3">
                                        <!-- Heading -->
                                        <h6 class="heading-xxxs text-muted">Order No:</h6>
                                        <!-- Text -->
                                        <p class="mb-lg-0 font-size-sm font-weight-bold">
                                                <%# Eval ("Id") %> 
                                        </p>
                                    </div>
                                    <div class="col-6 col-lg-3">
                                        <!-- Heading -->
                                        <h6 class="heading-xxxs text-muted">Shipped date:</h6>
                                        <!-- Text -->
                                        <p class="mb-lg-0 font-size-sm font-weight-bold">
                                            <time datetime="2019-10-01">
                                                <%# Eval ("odate", "{0:dd/MM/yyyy}") %>
                                            </time>
                                        </p>
                                    </div>
                                    <div class="col-6 col-lg-3">
                                        <!-- Heading -->
                                        <h6 class="heading-xxxs text-muted"> Shipment Status:</h6>
                                        <!-- Text -->
                                        <p class="mb-0 font-size-sm font-weight-bold">
                                             <%# Eval ("shipstatus") %> 
                                        </p>
                                    </div>
                                    <div class="col-6 col-lg-3">
                                        <!-- Heading -->
                                        <h6 class="heading-xxxs text-muted">Order Amount:</h6>
                                        <!-- Text -->
                                        <p class="mb-0 font-size-sm font-weight-bold">
                                            <%# Eval ("grandtotal") %> Rs

                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="row align-items-center">
                             
                            <div class="col-12 col-lg-6">
                                <div class="form-row">
                                    <div class="col-6">
                                        <!-- Button -->
                                        <asp:HyperLink class="btn btn-sm btn-block btn-outline-dark" Text=" Order Details" runat="server" NavigateUrl='<%# "~/accountorder.aspx?Id=" + Eval("Id") %>'>
                                           
                                        </asp:HyperLink>
                                    </div>
                                  
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </ItemTemplate></asp:Repeater>
               
            </div>
        </div>
    </div>
</section>

    </asp:Content>