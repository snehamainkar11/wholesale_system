<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="Checkout.aspx.cs" Inherits="wholesale.Checkout" %>

    
<!Doctype html>
<html lang="en">

<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicons -->
    <link rel="icon" href="assets/img/favicons/favicon.ico">
    <!-- Libs CSS -->
    <link rel="stylesheet" href="assets/libs/flickity/dist/flickity.min.css">
    <link rel="stylesheet" href="assets/libs/%40fancyapps/fancybox/dist/jquery.fancybox.min.css">
    <link rel="stylesheet" href="assets/libs/%40fortawesome/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="assets/libs/simplebar/dist/simplebar.min.css">
    <link rel="stylesheet" href="assets/libs/highlightjs/styles/vs2015.css">
    <link rel="stylesheet" href="assets/libs/flickity-fade/flickity-fade.css">
    <link rel="stylesheet" href="assets/fonts/feather/feather.css">
  
    <link rel="stylesheet" href="assets/css/theme.min.css">
    <title>Waheguru Creation</title>
</head>
<body>
    <!-- MODALS -->
    <!-- Newsletter: Horizontal -->
    <form runat="server">
        
    <!-- Search -->
    <div class="modal fixed-right fade" id="modalSearch" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-vertical" role="document">
        <div class="modal-content">
            <!-- Close -->
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <i class="fe fe-x" aria-hidden="true"></i>
            </button>
            <!-- Header-->
            <div class="modal-header line-height-fixed font-size-lg">
                <strong class="mx-auto">Search Products</strong>
            </div>
            <!-- Body: Form -->
            <div class="modal-body">
               
                   
                    <div class="input-group input-group-merge">
                        <input class="form-control" type="search" placeholder="Search">
                        <div class="input-group-append">
                            <button class="btn btn-outline-border" type="submit">
                                <i class="fe fe-search"></i>
                            </button>
                        </div>
                    </div>
           
            </div>
            <!-- Body: Results (add `.d-none` to disable it) -->
            <div class="modal-body border-top font-size-sm">
                <!-- Heading -->
                <p>Search Results:</p>
                <!-- Items -->
                <div class="row align-items-center position-relative mb-5">
                    <div class="col-4 col-md-3">
                        <!-- Image -->
                        <img class="img-fluid" src="assets/img/products/product-5.jpg" alt="...">
                    </div>
                    <div class="col position-static">
                        <!-- Text -->
                        <p class="mb-0 font-weight-bold">
                            <a class="stretched-link text-body" href="Product.aspx">Leather mid-heel Sandals</a> <br>
                            <span class="text-muted">$129.00</span>
                        </p>
                    </div>
                </div>
                <div class="row align-items-center position-relative mb-5">
                    <div class="col-4 col-md-3">
                        <!-- Image -->
                        <img class="img-fluid" src="assets/img/products/product-6.jpg" alt="...">
                    </div>
                    <div class="col position-static">
                        <!-- Text -->
                        <p class="mb-0 font-weight-bold">
                            <a class="stretched-link text-body" href="Product.aspx">Cotton floral print Dress</a> <br>
                            <span class="text-muted">$40.00</span>
                        </p>
                    </div>
                </div>
                <div class="row align-items-center position-relative mb-5">
                    <div class="col-4 col-md-3">
                        <!-- Image -->
                        <img class="img-fluid" src="assets/img/products/product-7.jpg" alt="...">
                    </div>
                    <div class="col position-static">
                        <!-- Text -->
                        <p class="mb-0 font-weight-bold">
                            <a class="stretched-link text-body" href="Product.aspx">Leather Sneakers</a> <br>
                            <span class="text-primary">$85.00</span>
                        </p>
                    </div>
                </div>
                <div class="row align-items-center position-relative mb-5">
                    <div class="col-4 col-md-3">
                        <!-- Image -->
                        <img class="img-fluid" src="assets/img/products/product-8.jpg" alt="...">
                    </div>
                    <div class="col position-static">
                        <!-- Text -->
                        <p class="mb-0 font-weight-bold">
                            <a class="stretched-link text-body" href="Product.aspx">Cropped cotton Top</a> <br>
                            <span class="text-muted">$29.00</span>
                        </p>
                    </div>
                </div>
                <div class="row align-items-center position-relative mb-5">
                    <div class="col-4 col-md-3">
                        <!-- Image -->
                        <img class="img-fluid" src="assets/img/products/product-9.jpg" alt="...">
                    </div>
                    <div class="col position-static">
                        <!-- Text -->
                        <p class="mb-0 font-weight-bold">
                            <a class="stretched-link text-body" href="Product.aspx">Floral print midi Dress</a> <br>
                            <span class="text-muted">$50.00</span>
                        </p>
                    </div>
                </div>
                <!-- Button -->
                <a class="btn btn-link px-0 text-reset" href="Shop.aspx">
                    View All <i class="fe fe-arrow-right ml-2"></i>
                </a>
            </div>
            <!-- Body: Empty (remove `.d-none` to disable it) -->
            <div class="d-none modal-body">
                <!-- Text -->
                <p class="mb-3 font-size-sm text-center">
                    Nothing matches your search
                </p>
                <p class="mb-0 font-size-sm text-center">
                    😞
                </p>
            </div>
        </div>
    </div>
</div>
  <div class="navbar navbar-topbar navbar-expand-xl navbar-light bg-light">
    <div class="container">
        <!-- Promo -->
        <div class="mr-xl-8">
            <i class="fe fe-truck mr-2"></i> <span class="heading-xxxs">Free shipping </span>
        </div>
        <!-- Toggler -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#topbarCollapse" aria-controls="topbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <!-- Collapse -->
             <ul class="navbar-nav flex-row">
                  <li class="nav-item" >
                       <span class="nav-link"  >
                 <asp:Label ID="Label2" runat="server" style="color:midnightblue"></asp:Label>
                           </span>
                  </li>
                <li class="nav-item">
                    <a class="nav-link" href="login.aspx"  >
            <asp:LinkButton ID="link_loginout" runat="server" class="dropdown-item notify-item" OnClick=" link_loginout_Click"><span>Log Out</span></asp:LinkButton>
</a>
                </li>
            
           </ul>
    </div>
</div>


    <!-- NAVBAR2 -->
    <nav class="navbar navbar-expand-lg navbar-light bg-white">
    <div class="container">
        <!-- Brand -->
        <a class="navbar-brand" href="overview.aspx">
            Waheguru Creations
        </a>
        <!-- Toggler -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <!-- Collapse -->
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <!-- Nav -->
            <ul class="navbar-nav mx-auto">
                <li class="nav-item dropdown">
                    <!-- Toggle -->
                    <a class="nav-link" data-toggle="dropdown" href="index.aspx">Home</a>
                    

                </li>
                <li class="nav-item dropdown position-static">
                    <!-- Toggle -->
                    <a class="nav-link" data-toggle="dropdown" href="#">Catalog</a>
                    

                </li>
              
                

                
                <li class="nav-item">
                    <a class="nav-link" href="contact.aspx">Contact Us</a>
                </li>

               
            </ul>
            <!-- Nav -->
            <ul class="navbar-nav flex-row">
                <li class="nav-item">
                    <a class="nav-link" data-toggle="modal" href="#modalSearch">
                        <i class="fe fe-search"></i>
                    </a>
                </li>
                <li class="nav-item ml-lg-n4">
                    <a class="nav-link" href="cart.aspx">
                        <i class="fe fe-user"></i>
                    </a>
                </li>
                <li class="nav-item ml-lg-n4">
                    <a class="nav-link" href="wishlist.aspx">
                        <i class="fe fe-heart"></i>
                    </a>
                </li>
                <li class="nav-item ml-lg-n4">
                    <asp:HyperLink class="nav-link" id="btnCart" runat="server"  NavigateUrl="~/Shoppingcart.aspx">
                      <span class="fe fe-shopping-cart" id="pCount" runat="server"><i class="fe fe-shopping-cart"></i></span>

                            
                     
                    </asp:HyperLink>
                </li>
            </ul>
        </div>
    </div>
</nav>
         
    <!-- PROMO -->

    <div class="py-3 bg-dark bg-pattern mb-4">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <!-- Text -->
                <div class="text-center text-white">
                    <span class="heading-xxs letter-spacing-xl">
                        ⚡️ Happy Holiday Deals on Everything ⚡️
                    </span>
                </div>
            </div>
        </div>
    </div>
</div>


       


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
              
                    <!-- Heading -->
                    <h6 class="mb-7">Billing Details</h6>
                    <!-- Billing details -->
                    <div class="row mb-9">
                        <div class="col-12 col-md-6">
                            <!-- First Name -->
                            <div class="form-group">
                                <label for="checkoutBillingFirstName">First Name *</label>
                                <asp:TextBox runat="server" class="form-control form-control-sm" id="checkoutBillingFirstName" type="text" placeholder="First Name" required=""/>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <!-- Last Name -->
                            <div class="form-group">
                                <label for="checkoutBillingLastName">Last Name *</label>
                                <asp:TextBox runat="server" class="form-control form-control-sm" id="checkoutBillingLastName" type="text" placeholder="Last Name" required=""/>
                            </div>
                        </div>
                        <div class="col-12">
                            <!-- Email -->
                            <div class="form-group">
                                <label for="checkoutBillingEmail">Email *</label>
                                <asp:TextBox runat="server" class="form-control form-control-sm" id="checkoutBillingEmail" type="email" placeholder="Email" required=""/>
                            </div>
                        </div>
                       
                       
                        <div class="col-12">
                            <!-- Address Line 1 -->
                            <div class="form-group">
                                <label for="checkoutBillingAddress">Address Line 1 *</label>
                                <asp:TextBox runat="server" class="form-control form-control-sm" id="checkoutBillingAddress" type="text" placeholder="Address Line 1" required=""/>
                            </div>
                        </div>
                        <div class="col-12">
                            <!-- Address Line 2 -->
                            <div class="form-group">
                                <label for="checkoutBillingAddressTwo">Address Line 2</label>
                                <asp:TextBox runat="server" class="form-control form-control-sm" id="checkoutBillingAddressTwo" type="text" placeholder="Address Line 2 (optional)"/>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <!-- Town / City -->
                            <div class="form-group">
                                <label for="checkoutBillingTown">Town / City *</label>
                                <asp:TextBox runat="server" class="form-control form-control-sm" id="checkoutBillingTown" type="text" placeholder="Town / City" required=""/>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <!-- ZIP / Postcode -->
                            <div class="form-group">
                                <label for="checkoutBillingZIP">ZIP / Postcode *</label>
                                <asp:TextBox runat="server" class="form-control form-control-sm" id="checkoutBillingZIP" type="text" placeholder="ZIP / Postcode" required=""/>
                            </div>
                        </div>
                        <div class="col-12">
                            <!-- Mobile Phone -->
                            <div class="form-group mb-0">
                                <label for="checkoutBillingPhone">Mobile Phone *</label>
                                <asp:TextBox runat="server" class="form-control form-control-sm" id="checkoutBillingPhone" type="tel" placeholder="Mobile Phone" required=""/>
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
                                            <input class="custom-control-input" id="checkoutShippingStandard" name="shipping" type="radio"  value="100">
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
                                            <input class="custom-control-input" id="checkoutShippingExpress" name="shipping" type="radio" value="150">
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
                                            <input class="custom-control-input" id="checkoutShippingShort" name="shipping" type="radio"  value="250">
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
                                            <input class="custom-control-input" id="checkoutShippingFree" name="shipping" type="radio"  value="0">
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
                     
                        <div class="custom-control custom-checkbox">
                   <!--         <input runat="server" class="custom-control-input" id="checkoutShippingAddress" type="checkbox">
                            <label class="custom-control-label font-size-sm" data-toggle="collapse" data-target="#checkoutShippingAddressCollapse" for="checkoutShippingAddress">
                                Ship to a different address?
                            </label>-->
                        </div>
                        <!-- Collapse -->
                        <div class="collapse" id="checkoutShippingAddressCollapse">
                            <div class="row mt-6">
                                <div class="col-12">
                                    <!-- Country -->
                                    <div class="form-group">
                                        <label for="checkoutShippingAddressCountry">Country *</label>
                                        <asp:TextBox runat="server" class="form-control form-control-sm" id="checkoutShippingAddressCountry" type="text" placeholder="Country"/>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <!-- Address Line 1 -->
                                    <div class="form-group">
                                        <label for="checkoutShippingAddressLineOne">Address Line 1 *</label>
                                        <asp:TextBox runat="server" class="form-control form-control-sm" id="checkoutShippingAddressLineOne" type="text" placeholder="Address Line 1"/>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <!-- Address Line 2 -->
                                    <div class="form-group">
                                        <label for="checkoutShippingAddressLineTwo">Address Line 2</label>
                                        <asp:TextBox runat="server" class="form-control form-control-sm" id="checkoutShippingAddressLineTwo" type="text" placeholder="Address Line 2 (optional)"/>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <!-- Town / City -->
                                    <div class="form-group">
                                        <label for="checkoutShippingAddressTown">Town / City *</label>
                                        <asp:TextBox runat="server" class="form-control form-control-sm" id="checkoutShippingAddressTown" type="text" placeholder="Town / City"/>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <!-- Town / City -->
                                    <div class="form-group">
                                        <label for="checkoutShippingAddressZIP">ZIP / Postcode *</label>
                                        <asp:TextBox runat="server" class="form-control form-control-sm" id="checkoutShippingAddressZIP" type="text" placeholder="ZIP / Postcode"/>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <!-- Button -->
                                    <asp:Button runat="server" class="btn btn-sm btn-outline-dark" Text="Save Address"/>
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
                              <h2> Only Cash on Delivery</h2>
                               
                            </div>
                        </div>
                       
                    </div>
                    <!-- Notes -->
                    <asp:TextBox TextMode="MultiLine" runat="server" ID="note"  class="form-control form-control-sm mb-9 mb-md-0 font-size-xs" rows="5" placeholder="Order Notes (optional)"/>
            </div>
            <div class="col-12 col-md-5 col-lg-4 offset-lg-1">
                <!-- Heading -->
                <h6 class="mb-7" runat="server" id="h4Noitems"></h6>
                <!-- Divider -->
                <hr class="my-7">
               <asp:Repeater ID="rptrCartProducts" runat="server">
  
              <ItemTemplate>
                <ul class="list-group list-group-lg list-group-flush-y list-group-flush-x mb-7">
                    <li class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-4">
                                <!-- Image -->
                                <a href="viewproduct.aspx">
                                    <img width="110px" class="media-object" src="/Products/<%# Eval("ProID") %>/<%# Eval("Name") %><%# Eval("Extension") %>"alt="<%#Eval("Name") %>" onerror="this.src='images/noimage.jpg'">
                            </a>
                      
                            </div>
                            <div class="col">
                                <!-- Title -->
                                <p class="mb-4 font-size-sm font-weight-bold">
                                    <a class="text-body" href="viewproduct.aspx"> <asp:Label runat="server" ID="pname" Text='<%#Eval("pname") %>'/></a> <br>
                                    <span class="text-muted"> <%# Convert.ToInt32(Eval("sellingprice"))* Convert.ToDouble(Eval("qty")) %> Rs</span>
                                </p>
                                <asp:HiddenField runat="server" ID="prc" Value='<%#Eval("sellingprice") %>' />
                                <div class="font-size-sm text-muted">
                                    Size:  <%#Eval("size") %> <br>
                                    Color: <%#Eval("color") %>
                                </div>
                                <div class="d-flex align-items-center">
                                    Quantity:  <asp:Label runat="server" ID="qty" Text='<%#Eval("qty") %>'/><br>
                                      </div>
                            </div>
                        </div>
                    </li>
                   
                </ul>
                  </ItemTemplate>
                  </asp:Repeater>
                <!-- Card -->
                <div class="card mb-7 bg-light"  runat="server" id="divpricedetails">
                    <div class="card-body">
                        <ul class="list-group list-group-sm list-group-flush-y list-group-flush-x">
                            <li class="list-group-item d-flex">
                                <span>Subtotal</span> <span class="ml-auto font-size-sm"  runat="server" ><asp:Label ID="spanCartTotal"  runat="server"  /></span>
                            </li>
                            <li class="list-group-item d-flex">
                                <span>Tax</span> <span class="ml-auto font-size-sm" runat="server"><asp:Label  ID="dis" runat="server" /></span>
                            </li>
                              <li class="list-group-item d-flex">
                                <span>Shipping Charge</span> <span class="ml-auto font-size-sm" runat="server"> <asp:Label ID="shipped" runat="server" /></span>
                            </li>
                            <li class="list-group-item d-flex font-size-lg font-weight-bold">
                                <span>Total</span> <span class="ml-auto font-size-sm" runat="server" ><asp:Label  runat="server"  ID="spanTotal" Text=""/></span>
                            </li>
                         
                        </ul>
                    </div>
                </div>
                <p class="mb-7 font-size-xs text-gray-500">
                   support your experience throughout this website.
                </p>
                <!-- Button -->
                <asp:Button  Text="Place Order" runat="server" OnClick="order_Click"  ID="order" BackColor="Black" ForeColor="White">
                   
                </asp:Button>
            </div>
        </div>
    </div>
</section>

  
  </form>      
       <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
    $(function () {

        $("input:radio[name='shipping']").click(function () {

            var radioValue = $("input[name='shipping']:checked").val();
            if (radioValue) {
                $('#<%=shipped.ClientID %>').text(radioValue);

            }

            var total = 0;
            if (isNaN($('#<%=spanTotal.ClientID %>').val()) || $('#<%=spanTotal.ClientID %>').html() == "") {
                total = 0;
            } else {
                total = $('#<%=spanTotal.ClientID %>').html();

            }
            $('#<%=spanTotal.ClientID %>').text(parseFloat(total) + parseFloat( radioValue));

        });
        $("input:radio[id='checkoutShippingFree']").click(function () {

            location.reload();
          });
    });
</script>
</body></html>