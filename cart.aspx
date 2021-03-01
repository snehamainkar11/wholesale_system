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
                <!-- Order -->
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
                                            673290789
                                        </p>
                                    </div>
                                    <div class="col-6 col-lg-3">
                                        <!-- Heading -->
                                        <h6 class="heading-xxxs text-muted">Shipped date:</h6>
                                        <!-- Text -->
                                        <p class="mb-lg-0 font-size-sm font-weight-bold">
                                            <time datetime="2019-10-01">
                                                21 Feb, 2021
                                            </time>
                                        </p>
                                    </div>
                                    <div class="col-6 col-lg-3">
                                        <!-- Heading -->
                                        <h6 class="heading-xxxs text-muted">Status:</h6>
                                        <!-- Text -->
                                        <p class="mb-0 font-size-sm font-weight-bold">
                                            Awating Delivery
                                        </p>
                                    </div>
                                    <div class="col-6 col-lg-3">
                                        <!-- Heading -->
                                        <h6 class="heading-xxxs text-muted">Order Amount:</h6>
                                        <!-- Text -->
                                        <p class="mb-0 font-size-sm font-weight-bold">
                                            Rs.7049
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="row align-items-center">
                            <div class="col-12 col-lg-6">
                                <div class="form-row mb-4 mb-lg-0">
                                    <div class="col-3">
                                        <!-- Image -->
                                        <div class="embed-responsive embed-responsive-1by1 bg-cover" style="background-image: url(../assets/img/products/product-5.jpg);"></div>
                                    </div>
                                    <div class="col-3">
                                        <!-- Image -->
                                        <div class="embed-responsive embed-responsive-1by1 bg-cover" style="background-image: url(../assets/img/products/product-112.jpg);"></div>
                                    </div>
                                    <div class="col-3">
                                        <!-- Image -->
                                        <div class="embed-responsive embed-responsive-1by1 bg-cover" style="background-image: url(../assets/img/products/product-7.jpg);"></div>
                                    </div>
                                    <div class="col-3">
                                        <!-- Image -->
                                        <div class="embed-responsive embed-responsive-1by1 bg-light">
                                            <a class="embed-responsive-item embed-responsive-item-text text-reset" href="#!">
                                                <div class="font-size-xxs font-weight-bold">
                                                    +2 <br> more
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-lg-6">
                                <div class="form-row">
                                    <div class="col-6">
                                        <!-- Button -->
                                        <a class="btn btn-sm btn-block btn-outline-dark" href="accountorder.aspx">
                                            Order Details
                                        </a>
                                    </div>
                                    <div class="col-6">
                                        <!-- Button -->
                                        <a class="btn btn-sm btn-block btn-outline-dark" href="#!">
                                            Track order
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Order -->
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
                                            871090437
                                        </p>
                                    </div>
                                    <div class="col-6 col-lg-3">
                                        <!-- Heading -->
                                        <h6 class="heading-xxxs text-muted">Shipped date:</h6>
                                        <!-- Text -->
                                        <p class="mb-lg-0 font-size-sm font-weight-bold">
                                            <time datetime="2019-09-25">
                                                25 Feb, 2021
                                            </time>
                                        </p>
                                    </div>
                                    <div class="col-6 col-lg-3">
                                        <!-- Heading -->
                                        <h6 class="heading-xxxs text-muted">Status:</h6>
                                        <!-- Text -->
                                        <p class="mb-0 font-size-sm font-weight-bold">
                                            In Processing
                                        </p>
                                    </div>
                                    <div class="col-6 col-lg-3">
                                        <!-- Heading -->
                                        <h6 class="heading-xxxs text-muted">Order Amount:</h6>
                                        <!-- Text -->
                                        <p class="mb-0 font-size-sm font-weight-bold">
                                            Rs.1,019
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="row align-items-center">
                            <div class="col-12 col-lg-6">
                                <div class="form-row mb-4 mb-lg-0">
                                    <div class="col-3">
                                        <!-- Image -->
                                        <div class="embed-responsive embed-responsive-1by1 bg-cover" style="background-image: url(../assets/img/products/product-11.jpg);"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-lg-6">
                                <div class="form-row">
                                    <div class="col-6">
                                        <!-- Button -->
                                        <a class="btn btn-sm btn-block btn-outline-dark" href="accountorder.aspx">
                                            Order Details
                                        </a>
                                    </div>
                                    <div class="col-6">
                                        <!-- Button -->
                                        <a class="btn btn-sm btn-block btn-outline-dark" href="#!">
                                            Track order
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Order -->
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
                                            891230563
                                        </p>
                                    </div>
                                    <div class="col-6 col-lg-3">
                                        <!-- Heading -->
                                        <h6 class="heading-xxxs text-muted">Shipped date:</h6>
                                        <!-- Text -->
                                        <p class="mb-lg-0 font-size-sm font-weight-bold">
                                            <time datetime="2019-09-07">
                                                14 Feb, 2021
                                            </time>
                                        </p>
                                    </div>
                                    <div class="col-6 col-lg-3">
                                        <!-- Heading -->
                                        <h6 class="heading-xxxs text-muted">Status:</h6>
                                        <!-- Text -->
                                        <p class="mb-0 font-size-sm font-weight-bold">
                                            Delivered
                                        </p>
                                    </div>
                                    <div class="col-6 col-lg-3">
                                        <!-- Heading -->
                                        <h6 class="heading-xxxs text-muted">Order Amount:</h6>
                                        <!-- Text -->
                                        <p class="mb-0 font-size-sm font-weight-bold">
                                            Rs.2089
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="row align-items-center">
                            <div class="col-12 col-lg-6">
                                <div class="form-row mb-4 mb-lg-0">
                                    <div class="col-3">
                                        <!-- Image -->
                                        <div class="embed-responsive embed-responsive-1by1 bg-cover" style="background-image: url(../assets/img/products/product-14.jpg);"></div>
                                    </div>
                                    <div class="col-3">
                                        <!-- Image -->
                                        <div class="embed-responsive embed-responsive-1by1 bg-cover" style="background-image: url(../assets/img/products/product-15.jpg);"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-lg-6">
                                <div class="form-row">
                                    <div class="col-6">
                                        <!-- Button -->
                                        <a class="btn btn-sm btn-block btn-outline-dark" href="accountorder.aspx">
                                            Order Details
                                        </a>
                                    </div>
                                    <div class="col-6">
                                        <!-- Button -->
                                        <a class="btn btn-sm btn-block btn-outline-dark" href="#!">
                                            Track order
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Pagination -->
                <nav class="d-flex justify-content-center justify-content-md-end mt-10">
                    <ul class="pagination pagination-sm text-gray-400">
                        <li class="page-item">
                            <a class="page-link page-link-arrow" href="#">
                                <i class="fa fa-caret-left"></i>
                            </a>
                        </li>
                        <li class="page-item active">
                            <a class="page-link" href="#">1</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">2</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">3</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">4</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">5</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">6</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link page-link-arrow" href="#">
                                <i class="fa fa-caret-right"></i>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</section>

    </asp:Content>