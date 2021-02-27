<%@ Page Language="C#" AutoEventWireup="true"MasterPageFile="~/Site.Master" CodeFile="accountorder.aspx.cs" Inherits="wholesale.accountorder" %>


<asp:Content ID="conten1" ContentPlaceHolderID="Maincontent" runat="server">  

    
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
                        <a class="list-group-item list-group-item-action dropright-toggle active" href="AccountOrders.html">
                            Orders
                        </a>
                        <a class="list-group-item list-group-item-action dropright-toggle" href="WishList.html">
                            Wishlist
                        </a>
                        <a class="list-group-item list-group-item-action dropright-toggle" href="PersonalInfo.html">
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
                                                01 Oct, 2019
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
                                            $259.00
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <!-- Heading -->
                        <h6 class="mb-7">Order Items (3)</h6>
                        <!-- Divider -->
                        <hr class="my-5">
                        <!-- List group -->
                        <ul class="list-group list-group-lg list-group-flush-y list-group-flush-x">
                            <li class="list-group-item">
                                <div class="row align-items-center">
                                    <div class="col-4 col-md-3 col-xl-2">
                                        <!-- Image -->
                                        <a href="../Product.html"><img src="../assets/img/products/product-6.jpg" alt="..." class="img-fluid"></a>
                                    </div>
                                    <div class="col">
                                        <!-- Title -->
                                        <p class="mb-4 font-size-sm font-weight-bold">
                                            <a class="text-body" href="../Product.html">Cotton floral print Dress x 1</a> <br>
                                            <span class="text-muted">$40.00</span>
                                        </p>
                                        <!-- Text -->
                                        <div class="font-size-sm text-muted">
                                            Size: M <br>
                                            Color: Red
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <div class="row align-items-center">
                                    <div class="col-4 col-md-3 col-xl-2">
                                        <!-- Image -->
                                        <a href="../Product.html"><img src="../assets/img/products/product-10.jpg" alt="..." class="img-fluid"></a>
                                    </div>
                                    <div class="col">
                                        <!-- Title -->
                                        <p class="mb-4 font-size-sm font-weight-bold">
                                            <a class="text-body" href="../Product.html">Suede cross body Bag x 1</a> <br>
                                            <span class="text-muted">$49.00</span>
                                        </p>
                                        <!-- Text -->
                                        <div class="font-size-sm text-muted">
                                            Color: Brown
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <div class="row align-items-center">
                                    <div class="col-4 col-md-3 col-xl-2">
                                        <!-- Image -->
                                        <a href="../Product.html"><img src="../assets/img/products/product-48.jpg" alt="..." class="img-fluid"></a>
                                    </div>
                                    <div class="col">
                                        <!-- Title -->
                                        <p class="mb-4 font-size-sm font-weight-bold">
                                            <a class="text-body" href="../Product.html">Sweatshirt with Pocket</a> <br>
                                            <span class="text-muted">$39.00</span>
                                        </p>
                                        <!-- Text -->
                                        <div class="font-size-sm text-muted">
                                            Size: L <br>
                                            Color: Pink
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- Total -->
                <div class="card card-lg mb-5 border">
                    <div class="card-body">
                        <!-- Heading -->
                        <h6 class="mb-7">Order Total</h6>
                        <!-- List group -->
                        <ul class="list-group list-group-sm list-group-flush-y list-group-flush-x">
                            <li class="list-group-item d-flex">
                                <span>Subtotal</span>
                                <span class="ml-auto">$128.00</span>
                            </li>
                            <li class="list-group-item d-flex">
                                <span>Tax</span>
                                <span class="ml-auto">$0.00</span>
                            </li>
                            <li class="list-group-item d-flex">
                                <span>Shipping</span>
                                <span class="ml-auto">$8.00</span>
                            </li>
                            <li class="list-group-item d-flex font-size-lg font-weight-bold">
                                <span>Total</span>
                                <span class="ml-auto">$136.00</span>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- Details -->
                <div class="card card-lg border">
                    <div class="card-body">
                        <!-- Heading -->
                        <h6 class="mb-7">Billing & Shipping Details</h6>
                        <!-- Content -->
                        <div class="row">
                            <div class="col-12 col-md-4">
                                <!-- Heading -->
                                <p class="mb-4 font-weight-bold">
                                    Billing Address:
                                </p>
                                <p class="mb-7 mb-md-0 text-gray-500">
                                    Daniel Robinson, <br>
                                    3997 Raccoon Run, <br>
                                    Kingston, 45644, <br>
                                    United States, <br>
                                    6146389574
                                </p>
                            </div>
                            <div class="col-12 col-md-4">
                                <!-- Heading -->
                                <p class="mb-4 font-weight-bold">
                                    Shipping Address:
                                </p>
                                <p class="mb-7 mb-md-0 text-gray-500">
                                    Daniel Robinson, <br>
                                    3997 Raccoon Run, <br>
                                    Kingston, 45644, <br>
                                    United States, <br>
                                    6146389574
                                </p>
                            </div>
                            <div class="col-12 col-md-4">
                                <!-- Heading -->
                                <p class="mb-4 font-weight-bold">
                                    Shipping Method:
                                </p>
                                <p class="mb-7 text-gray-500">
                                    Standart Shipping <br>
                                    (5 - 7 days)
                                </p>
                                <!-- Heading -->
                                <p class="mb-4 font-weight-bold">
                                    Payment Method:
                                </p>
                                <p class="mb-0 text-gray-500">
                                    Debit Mastercard
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

    </asp:Content>