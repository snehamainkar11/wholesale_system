<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false"  CodeFile="Shoppingcart.aspx.cs" Inherits="wholesale.Shoppingcart" %>


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
            <div class="col-12">
                <!-- Heading -->
                <h3 class="mb-10 text-center">Shopping Cart</h3>
            </div>
        </div>
       
  
          <h5 class="proNameViewCart" runat="server" id="h4Noitems"></h5>
       
                     <div class="row">
            <div class="col-12 col-md-7">
                <asp:Repeater ID="rptrCartProducts" runat="server">
  
              <ItemTemplate>
                <ul class="list-group list-group-lg list-group-flush-x mb-6">
                    <li class="list-group-item">

                        <div class="row align-items-center">
                            <div class="col-3">
                                
                            <a href="ProductView.aspx?PID=<%#Eval("PID") %>" target="_blank">
                                <img width="110px" class="media-object" src="/Products/<%# Eval("ProID") %>/<%# Eval("Name") %><%# Eval("Extension") %>"alt="<%#Eval("Name") %>" onerror="this.src='images/noimage.jpg'">
                            </a>
                      
                            </div>
                            <div class="col">
                                <!-- Title -->
                                <div class="d-flex mb-2 font-weight-bold">
                        
                            <a class="text-body"><%#Eval("pname") %></a><span class="ml-auto"> <%# Convert.ToInt32(Eval("sellingprice"))* Convert.ToDouble(Eval("qty")) %> Rs</span>
                                </div>
                                  <p class="mb-7 font-size-sm text-muted">
                                    Size:  <%#Eval("size") %> <br>
                                    Color: <%#Eval("color") %>
                                </p>
                                  <div class="d-flex align-items-center">
                                    Quantity:  <%#Eval("qty") %> <br>
                                      </div>
                           
                                <asp:Button CommandArgument='<%#Eval("Id")%>' ID="btnRemoveItem" OnClick="btnRemoveItem_Click"  runat="server" Text="REMOVE" />
                            </p>
                        </div>
                            
                    </div>
                        </li></ul>
               </ItemTemplate>
            </asp:Repeater>
                </div>
                           <div class="col-12 col-md-5 col-lg-4 offset-lg-1"  runat="server" id="divpricedetails">
                <div class="card mb-7 bg-light">
                    <div class="card-body">
                        <ul class="list-group list-group-sm list-group-flush-y list-group-flush-x">
                            <li class="list-group-item d-flex">
                                <span>Subtotal</span> <span class="ml-auto font-size-sm"  runat="server" id="spanCartTotal" >0</span>
                            </li>
                            <li class="list-group-item d-flex">
                                <span>Tax</span> <span class="ml-auto font-size-sm" runat="server" id="dis">5%</span>
                            </li>
                            <li class="list-group-item d-flex font-size-lg font-weight-bold">
                                <span>Total</span> <span class="ml-auto font-size-sm" runat="server" id="spanTotal">0</span>
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
     
  </form>      </body></html>