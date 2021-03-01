<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeFile="Checkout.aspx.cs" Inherits="wholesale.Checkout" %>
<asp:Content ID="conten1" ContentPlaceHolderID="Maincontent" runat="server">  

    
<section class="pt-7 pb-12">
    <div class="container">
        <div class="row">
            <div class="col-12 text-center">
                <!-- Heading -->
                <h3 class="mb-4">Checkout</h3>
                <!-- Subheading -->
               
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-md-7">
                <!-- Form -->
                <form>
                    <!-- Heading -->
                    <h6 class="mb-7">Billing Details</h6>
                    <!-- Billing details -->
                    <div class="row mb-9">
                        <div class="col-12 col-md-6">
                            <!-- First Name -->
                            <div class="form-group">
                                <label for="checkoutBillingFirstName">First Name *</label>
                                <input class="form-control form-control-sm" id="checkoutBillingFirstName" type="text" placeholder="First Name" required>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <!-- Last Name -->
                            <div class="form-group">
                                <label for="checkoutBillingLastName">Last Name *</label>
                                <input class="form-control form-control-sm" id="checkoutBillingLastName" type="text" placeholder="Last Name" required>
                            </div>
                        </div>
                        <div class="col-12">
                            <!-- Email -->
                            <div class="form-group">
                                <label for="checkoutBillingEmail">Email *</label>
                                <input class="form-control form-control-sm" id="checkoutBillingEmail" type="email" placeholder="Email" required>
                            </div>
                        </div>
                        <div class="col-12">
                            <!-- Company Name -->
                            <div class="form-group">
                                <label for="checkoutBillingCompany">Company name *</label>
                                <input class="form-control form-control-sm" id="checkoutBillingCompany" type="text" placeholder="Company name (optional)">
                            </div>
                        </div>
                        <div class="col-12">
                            <!-- Country -->
                            <div class="form-group">
                                <label for="checkoutBillingCountry">Country *</label>
                                <input class="form-control form-control-sm" id="checkoutBillingCountry" type="text" placeholder="Country" required>
                            </div>
                        </div>
                        <div class="col-12">
                            <!-- Address Line 1 -->
                            <div class="form-group">
                                <label for="checkoutBillingAddress">Address Line 1 *</label>
                                <input class="form-control form-control-sm" id="checkoutBillingAddress" type="text" placeholder="Address Line 1" required>
                            </div>
                        </div>
                        <div class="col-12">
                            <!-- Address Line 2 -->
                            <div class="form-group">
                                <label for="checkoutBillingAddressTwo">Address Line 2</label>
                                <input class="form-control form-control-sm" id="checkoutBillingAddressTwo" type="text" placeholder="Address Line 2 (optional)">
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <!-- Town / City -->
                            <div class="form-group">
                                <label for="checkoutBillingTown">Town / City *</label>
                                <input class="form-control form-control-sm" id="checkoutBillingTown" type="text" placeholder="Town / City" required>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <!-- ZIP / Postcode -->
                            <div class="form-group">
                                <label for="checkoutBillingZIP">ZIP / Postcode *</label>
                                <input class="form-control form-control-sm" id="checkoutBillingZIP" type="text" placeholder="ZIP / Postcode" required>
                            </div>
                        </div>
                        <div class="col-12">
                            <!-- Mobile Phone -->
                            <div class="form-group mb-0">
                                <label for="checkoutBillingPhone">Mobile Phone *</label>
                                <input class="form-control form-control-sm" id="checkoutBillingPhone" type="tel" placeholder="Mobile Phone" required>
                            </div>
                        </div>
                    </div>
                    <!-- Heading -->
                    <h6 class="mb-7">Shipping Details</h6>
                    <!-- Shipping details -->
                    <div class="table-responsive mb-6">
                        <table class="table table-bordered table-sm table-hover mb-0">
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="custom-control custom-radio">
                                            <input class="custom-control-input" id="checkoutShippingStandard" name="shipping" type="radio">
                                            <label class="custom-control-label text-body text-nowrap" for="checkoutShippingStandard">
                                                Standard Shipping
                                            </label>
                                        </div>
                                    </td>
                                    <td>Delivery in 5 - 7 working days</td>
                                    <td>Rs.100</td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="custom-control custom-radio">
                                            <input class="custom-control-input" id="checkoutShippingExpress" name="shipping" type="radio">
                                            <label class="custom-control-label text-body text-nowrap" for="checkoutShippingExpress">
                                                Express Shipping
                                            </label>
                                        </div>
                                    </td>
                                    <td>Delivery in 3 - 5 working days</td>
                                    <td>Rs.150</td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="custom-control custom-radio">
                                            <input class="custom-control-input" id="checkoutShippingShort" name="shipping" type="radio">
                                            <label class="custom-control-label text-body text-nowrap" for="checkoutShippingShort">
                                                1 - 2 Shipping
                                            </label>
                                        </div>
                                    </td>
                                    <td>Delivery in 1 - 2 working days</td>
                                    <td>Rs.250</td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="custom-control custom-radio">
                                            <input class="custom-control-input" id="checkoutShippingFree" name="shipping" type="radio">
                                            <label class="custom-control-label text-body text-nowrap" for="checkoutShippingFree">
                                                Free Shipping
                                            </label>
                                        </div>
                                    </td>
                                    <td>
                                        Living won't the He one every subdue
                                        meat replenish face was you morning
                                        firmament darkness.
                                    </td>
                                    <td>Rs.0</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- Address -->
                    <div class="mb-9">
                        <!-- Checkbox -->
                        <!--<div class="custom-control custom-checkbox">
                            <input class="custom-control-input" id="checkoutShippingAddress" type="checkbox">
                            <label class="custom-control-label font-size-sm" data-toggle="collapse" data-target="#checkoutShippingAddressCollapse" for="checkoutShippingAddress">
                                Ship to a different address?
                            </label>
                        </div>-->>
                        <!-- Collapse -->
                        <div class="collapse" id="checkoutShippingAddressCollapse">
                            <div class="row mt-6">
                                <div class="col-12">
                                    <!-- Country -->
                                    <div class="form-group">
                                        <label for="checkoutShippingAddressCountry">Country *</label>
                                        <input class="form-control form-control-sm" id="checkoutShippingAddressCountry" type="text" placeholder="Country">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <!-- Address Line 1 -->
                                    <div class="form-group">
                                        <label for="checkoutShippingAddressLineOne">Address Line 1 *</label>
                                        <input class="form-control form-control-sm" id="checkoutShippingAddressLineOne" type="text" placeholder="Address Line 1">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <!-- Address Line 2 -->
                                    <div class="form-group">
                                        <label for="checkoutShippingAddressLineTwo">Address Line 2</label>
                                        <input class="form-control form-control-sm" id="checkoutShippingAddressLineTwo" type="text" placeholder="Address Line 2 (optional)">
                                    </div>
                                </div>
                                <div class="col-6">
                                    <!-- Town / City -->
                                    <div class="form-group">
                                        <label for="checkoutShippingAddressTown">Town / City *</label>
                                        <input class="form-control form-control-sm" id="checkoutShippingAddressTown" type="text" placeholder="Town / City">
                                    </div>
                                </div>
                                <div class="col-6">
                                    <!-- Town / City -->
                                    <div class="form-group">
                                        <label for="checkoutShippingAddressZIP">ZIP / Postcode *</label>
                                        <input class="form-control form-control-sm" id="checkoutShippingAddressZIP" type="text" placeholder="ZIP / Postcode">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <!-- Button -->
                                    <button class="btn btn-sm btn-outline-dark" type="submit">
                                        Save Address
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Heading -->
                    <h6 class="mb-7">Payment</h6>
                    <!-- List group -->
                    <div class="list-group list-group-sm mb-7">
                        <div class="list-group-item">
                            <!-- Radio -->
                            <div class="custom-control custom-radio">
                                <!-- Input -->
                                <input class="custom-control-input" id="checkoutPaymentCard" name="payment" type="radio" data-toggle="collapse" data-action="show" data-target="#checkoutPaymentCardCollapse">
                                <!-- Label -->
                                <label class="custom-control-label font-size-sm text-body text-nowrap" for="checkoutPaymentCard">
                                    Credit Card <img class="ml-2" src="../assets/img/brands/color/cards.svg" alt="...">
                                </label>
                            </div>
                        </div>
                        <div class="list-group-item collapse py-0" id="checkoutPaymentCardCollapse">
                            <!-- Form -->
                            <div class="form-row py-5">
                                <div class="col-12">
                                    <div class="form-group mb-4">
                                        <label class="sr-only" for="checkoutPaymentCardNumber">Card Number</label>
                                        <input class="form-control form-control-sm" id="checkoutPaymentCardNumber" type="text" placeholder="Card Number *" required>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group mb-4">
                                        <label class="sr-only" for="checkoutPaymentCardName">Name on Card</label>
                                        <input class="form-control form-control-sm" id="checkoutPaymentCardName" type="text" placeholder="Name on Card *" required>
                                    </div>
                                </div>
                                <div class="col-12 col-md-4">
                                    <div class="form-group mb-md-0">
                                        <label class="sr-only" for="checkoutPaymentMonth">Month</label>
                                        <select class="custom-select custom-select-sm" id="checkoutPaymentMonth">
                                            <option>January</option>
                                            <option>February</option>
                                            <option>March</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12 col-md-4">
                                    <div class="form-group mb-md-0">
                                        <label class="sr-only" for="checkoutPaymentCardYear">Year</label>
                                        <select class="custom-select custom-select-sm" id="checkoutPaymentCardYear">
                                            <option>2019</option>
                                            <option>2020</option>
                                            <option>2021</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12 col-md-4">
                                    <div class="input-group input-group-merge">
                                        <input class="form-control form-control-sm" id="checkoutPaymentCardCVV" type="text" placeholder="CVV *" required>
                                        <div class="input-group-append">
                                            <span class="input-group-text" data-toggle="popover" data-placement="top" data-trigger="hover" data-content="The CVV Number on your credit card or debit card is a 3 digit number on VISA, MasterCard and Discover branded credit and debit cards.">
                                                <i class="fe fe-help-circle"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item">
                            <!-- Radio -->
                            <div class="custom-control custom-radio">
                                <!-- Input -->
                                <input class="custom-control-input" id="checkoutPaymentPaypal" name="payment" type="radio" data-toggle="collapse" data-action="hide" data-target="#checkoutPaymentCardCollapse">
                                <!-- Label -->
                                <label class="custom-control-label font-size-sm text-body text-nowrap" for="checkoutPaymentPaypal">
                                    <img src="../assets/img/brands/color/paypal.svg" alt="...">
                                </label>
                            </div>
                        </div>
                    </div>
                    <!-- Notes -->
                    <textarea class="form-control form-control-sm mb-9 mb-md-0 font-size-xs" rows="5" placeholder="Order Notes (optional)"></textarea>
                </form>
            </div>
            <div class="col-12 col-md-5 col-lg-4 offset-lg-1">
                <!-- Heading -->
                <h6 class="mb-7">Order Items (3)</h6>
                <!-- Divider -->
                <hr class="my-7">
                <!-- List group -->
                <ul class="list-group list-group-lg list-group-flush-y list-group-flush-x mb-7">
                    <li class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-4">
                                <!-- Image -->
                                <a href="viewproduct.aspx">
                                    <img src="../assets/img/products/product-6.jpg" alt="..." class="img-fluid">
                                </a>
                            </div>
                            <div class="col">
                                <!-- Title -->
                                <p class="mb-4 font-size-sm font-weight-bold">
                                    <a class="text-body" href="viewproduct.aspx">Joggers</a> <br>
                                    <span class="text-muted">Rs.799</span>
                                </p>
                                <!-- Text -->
                                <div class="font-size-sm text-muted">
                                    Size: M <br>
                                    Color: White
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-4">
                                <!-- Image -->
                                <a href="viewproduct.aspx">
                                    <img src="../assets/img/products/product-10.jpg" alt="..." class="img-fluid">
                                </a>
                            </div>
                            <div class="col">
                                <!-- Title -->
                                <p class="mb-4 font-size-sm font-weight-bold">
                                    <a class="text-body" href="viewproduct.aspx">Patches Funky</a> <br>
                                    <span class="text-muted">Rs.1,599</span>
                                </p>
                                <!-- Text -->
                                <div class="font-size-sm text-muted">
                                    Color: Blue
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
                <!-- Card -->
                <div class="card mb-9 bg-light">
                    <div class="card-body">
                        <ul class="list-group list-group-sm list-group-flush-y list-group-flush-x">
                            <li class="list-group-item d-flex">
                                <span>Subtotal</span> <span class="ml-auto font-size-sm">Rs.2,398</span>
                            </li>
                            <li class="list-group-item d-flex">
                                <span>Tax</span> <span class="ml-auto font-size-sm">Rs.0</span>
                            </li>
                            <li class="list-group-item d-flex">
                                <span>Shipping</span> <span class="ml-auto font-size-sm">Free</span>
                            </li>
                            <li class="list-group-item d-flex font-size-lg font-weight-bold">
                                <span>Total</span> <span class="ml-auto">Rs.2,398</span>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- Disclaimer -->
                <p class="mb-7 font-size-xs text-gray-500">
                   support your experience throughout this website.
                </p>
                <!-- Button -->
                <a class="btn btn-block btn-dark" href="ordercomplete.aspx">
                    Place Order
                </a>
            </div>
        </div>
    </div>
</section>


    </asp:Content>
 