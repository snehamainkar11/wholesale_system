<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeFile="Shoppingcart.aspx.cs" Inherits="wholesale.Shoppingcart" %>


<asp:Content ID="conten1" ContentPlaceHolderID="Maincontent" runat="server">  

<section class="pt-7 pb-12">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <!-- Heading -->
                <h3 class="mb-10 text-center">Shopping Cart</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-md-7">
                <!-- List group -->
                <ul class="list-group list-group-lg list-group-flush-x mb-6">
                    <li class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-3">
                                <!-- Image -->
                                <a href="viewproduct.aspx">
                                    <img src="../assets/img/products/product-6.jpg" alt="..." class="img-fluid">
                                </a>
                            </div>
                            <div class="col">
                                <!-- Title -->
                                <div class="d-flex mb-2 font-weight-bold">
                                    <a class="text-body" href="viewproduct.aspx">Joggers</a> <span class="ml-auto">Rs.799</span>
                                </div>
                                <!-- Text -->
                                <p class="mb-7 font-size-sm text-muted">
                                    Size: M <br>
                                    Color: White
                                </p>
                                <!--Footer -->
                                <div class="d-flex align-items-center">
                                    <!-- Select -->
                                    <select class="custom-select custom-select-xxs w-auto">
                                        <option value="1">1</option>
                                        <option value="1">2</option>
                                        <option value="1">3</option>
                                    </select>
                                    <!-- Remove -->
                                    <a class="font-size-xs text-gray-400 ml-auto" href="#!">
                                        <i class="fe fe-x"></i> Remove
                                    </a>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-3">
                                <!-- Image -->
                                <a href="viewproduct.aspx">
                                    <img src="../assets/img/products/product-10.jpg" alt="..." class="img-fluid">
                                </a>
                            </div>
                            <div class="col">
                                <!-- Title -->
                                <div class="d-flex mb-2 font-weight-bold">
                                    <a class="text-body" href="viewproduct.aspx">Patches Funky</a> <span class="ml-auto">Rs.1,599</span>
                                </div>
                                <!-- Text -->
                                <p class="mb-7 font-size-sm text-muted">
                                    Color: Blue
                                </p>
                                <!--Footer -->
                                <div class="d-flex align-items-center">
                                    <!-- Select -->
                                    <select class="custom-select custom-select-xxs w-auto">
                                        <option value="1">1</option>
                                        <option value="1">2</option>
                                        <option value="1">3</option>
                                    </select>
                                    <!-- Remove -->
                                    <a class="font-size-xs text-gray-400 ml-auto" href="#!">
                                        <i class="fe fe-x"></i> Remove
                                    </a>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
                <!-- Footer -->
                <div class="row align-items-end justify-content-between mb-10 mb-md-0">
                    <div class="col-12 col-md-7">
                        <!-- Coupon -->
                        <form class="mb-7 mb-md-0">
                            <label class="font-size-sm font-weight-bold" for="cartCouponCode">
                                Coupon code:
                            </label>
                            <div class="row form-row">
                                <div class="col">
                                    <!-- Input -->
                                    <input class="form-control form-control-sm" id="cartCouponCode" type="text" placeholder="Enter coupon code*">
                                </div>
                                <div class="col-auto">
                                    <!-- Button -->
                                    <button class="btn btn-sm btn-dark" type="submit">
                                        Apply
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-12 col-md-auto">
                        <!-- Button -->
                        <button class="btn btn-sm btn-outline-dark">Update Cart</button>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-5 col-lg-4 offset-lg-1">
                <!-- Total -->
                <div class="card mb-7 bg-light">
                    <div class="card-body">
                        <ul class="list-group list-group-sm list-group-flush-y list-group-flush-x">
                            <li class="list-group-item d-flex">
                                <span>Subtotal</span> <span class="ml-auto font-size-sm">Rs.2,398</span>
                            </li>
                            <li class="list-group-item d-flex">
                                <span>Tax</span> <span class="ml-auto font-size-sm">Rs.0</span>
                            </li>
                            <li class="list-group-item d-flex font-size-lg font-weight-bold">
                                <span>Total</span> <span class="ml-auto font-size-sm">Rs.2,398</span>
                            </li>
                            <li class="list-group-item font-size-sm text-center text-gray-500">
                                Shipping cost calculated at Checkout *
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- Button -->
                <a class="btn btn-block btn-dark mb-2" href="Checkout.aspx">Proceed to Checkout</a>
                <!-- Link -->
                <a class="btn btn-link btn-sm px-0 text-body" href="shop.aspx">
                    <i class="fe fe-arrow-left mr-2"></i> Continue Shopping
                </a>
            </div>
        </div>
    </div>
</section>

    </asp:Content>