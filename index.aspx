<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="wholesale.index" %>
	<asp:Content ID="conten1" ContentPlaceHolderID="Maincontent" runat="server">  


<!-- CATEGORIES -->
<section>
    <div class="row no-gutters d-block d-lg-flex flickity flickity-lg-none" data-flickity='{"watchCSS": true}'>
        <!-- Item -->
        <div class="col-12 col-md-6 col-lg-4 d-flex flex-column bg-cover" style="background-image: url(assets/img/covers/cover-1.jpg);">
            <div class="card bg-dark-5 bg-hover text-white text-center" style="min-height: 470px;">
                <div class="card-body mt-auto mb-n11 py-8">
                    <!-- Heading -->
                    <h1 class="mb-0 font-weight-bolder">
                        Women
                    </h1>
                </div>
                <div class="card-body mt-auto py-8">
                    <!-- Button -->
                    <a class="btn btn-white stretched-link" href="shop.aspx">
                        Shop Women <i class="fe fe-arrow-right ml-2"></i>
                    </a>
                </div>
            </div>
        </div>
        <!-- Card -->
        <div class="col-12 col-md-6 col-lg-4 d-flex flex-column bg-cover" style="background-image: url(assets/img/covers/cover-2.jpg);">
            <div class="card bg-dark-5 bg-hover text-white text-center" style="min-height: 470px;">
                <div class="card-body mt-auto mb-n11 py-8">
                    <!-- Heading -->
                    <h1 class="mb-0 font-weight-bolder">
                        Men
                    </h1>
                </div>
                <div class="card-body mt-auto py-8">
                    <!-- Button -->
                    <a class="btn btn-white stretched-link" href="shop.aspx">
                        Shop Men <i class="fe fe-arrow-right ml-2"></i>
                    </a>
                </div>
            </div>
        </div>
        <!-- Card -->
        <div class="col-12 col-md-6 col-lg-4 d-flex flex-column bg-cover" style="background-image: url(assets/img/covers/cover-3.jpg);">
            <div class="card bg-dark-5 bg-hover text-white text-center" style="min-height: 470px;">
                <div class="card-body mt-auto mb-n11 py-8">
                    <!-- Heading -->
                    <h1 class="mb-0 font-weight-bolder">
                        Kids
                    </h1>
                </div>
                <div class="card-body mt-auto py-8">
                    <!-- Button -->
                    <a class="btn btn-white stretched-link" href="shop.aspx">
                        Shop Kids <i class="fe fe-arrow-right ml-2"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- FEATURES -->
<section class="pt-7">
    <div class="container">
        <div class="row pb-7 border-bottom">
            <div class="col-12 col-md-6 col-lg-3">
                <!-- Item -->
                <div class="d-flex mb-6 mb-lg-0">
                    <!-- Icon -->
                    <i class="fe fe-truck font-size-lg text-primary"></i>
                    <!-- Body -->
                    <div class="ml-6">
                        <!-- Heading -->
                        <h6 class="heading-xxs mb-1">
                            Free shipping
                        </h6>
                        <!-- Text -->
                        <p class="mb-0 font-size-sm text-muted">
                            From all orders over 1000
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-6 col-lg-3">
                <!-- Item -->
                <div class="d-flex mb-6 mb-lg-0">
                    <!-- Icon -->
                    <i class="fe fe-repeat font-size-lg text-primary"></i>
                    <!-- Body -->
                    <div class="ml-6">
                        <!-- Heading -->
                        <h6 class="mb-1 heading-xxs">
                            Free returns
                        </h6>
                        <!-- Text -->
                        <p class="mb-0 font-size-sm text-muted">
                            Return money within 30 days
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-6 col-lg-3">
                <!-- Item -->
                <div class="d-flex mb-6 mb-md-0">
                    <!-- Icon -->
                    <i class="fe fe-lock font-size-lg text-primary"></i>
                    <!-- Body -->
                    <div class="ml-6">
                        <!-- Heading -->
                        <h6 class="mb-1 heading-xxs">
                            Secure shopping
                        </h6>
                        <!-- Text -->
                        <p class="mb-0 font-size-sm text-muted">
                            You're in safe hands
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-6 col-lg-3">
                <!-- Item -->
                <div class="d-flex">
                    <!-- Icon -->
                    <i class="fe fe-tag font-size-lg text-primary"></i>
                    <!-- Body -->
                    <div class="ml-6">
                        <!-- Heading -->
                        <h6 class="mb-1 heading-xxs">
                            Over 10,000 Styles
                        </h6>
                        <!-- Text -->
                        <p class="mb-0 font-size-sm text-muted">
                            We have everything you need
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- BEST PICKS -->
<section class="pt-12">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-md-10 col-lg-8 col-xl-6 text-center">
                <!-- Preheading -->
                <h6 class="heading-xxs mb-3 text-gray-400">
                    New Collection
                </h6>
                <!-- Heading -->
                <h2 class="mb-4">Best Picks 2021</h2>
                <!-- Subheading -->
                <p class="mb-10 text-gray-500">
                   In the right DENIM, you can Conquer the World
                     <!--Appear, dry there darkness they're seas, dry waters thing fly midst. Beast, above fly brought Very green.-->
                </p>
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-md-5 col-lg-4 d-flex flex-column">
                <!-- Card -->
                <div class="card mb-7 text-white" style="min-height: 400px; background-image: url(assets/img/products/product-1.jpg)">
                    <!-- Background -->
                    <div class="card-bg">
                        <div class="card-bg-img bg-cover" style="background-image: url(assets/img/products/product-1.jpg);"></div>
                    </div>
                    <!-- Body -->
                    <div class="card-body my-auto text-center">
                        <!-- Heading -->
                        <h4 class="mb-0">Ohhh Denim</h4>
                        <!-- Link -->
                        <a class="btn btn-link stretched-link text-reset" href="shop.aspx">
                            Shop Now <i class="fe fe-arrow-right ml-2"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-7 col-lg-8 d-flex flex-column">
                <!-- Card -->
                <div class="card mb-7 text-body" style="min-height: 400px;">
                    <!-- Background -->
                    <div class="card-bg">
                        <div class="card-bg-img bg-cover" style="background-image: url(assets/img/products/product-2.jpg);"></div>
                    </div>
                    <!-- Body -->
                    <div class="card-body my-auto px-md-10 text-center text-md-left">
                        <!-- Circle -->
                        <div class="card-circle card-circle-lg card-circle-right">
                            <strong>save</strong>
                            <span class="font-size-h4 font-weight-bold">30%</span>
                        </div>
                        <!-- Heading -->
                        <h4 class="mb-0">Denim is always a good idea;)</h4>
                        <!-- Link -->
                        <a class="btn btn-link stretched-link px-0 text-reset" href="shop.aspx">
                            Shop Now <i class="fe fe-arrow-right ml-2"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-7 col-lg-8 d-flex flex-column">
                <!-- Card -->
                <div class="card mb-7 mb-md-0 text-body" style="min-height: 400px;">
                    <!-- Background -->
                    <div class="card-bg">
                        <div class="card-bg-img bg-cover" style="background-image: url(assets/img/products/product-3.png);"></div>
                    </div>
                    <!-- Body -->
                    <div class="card-body my-auto px-md-10 text-center text-md-left">
                        <!-- Heading -->
                        <h4 class="mb-0">Plain Basic</h4>
                        <!-- Link -->
                        <a class="btn btn-link stretched-link px-0 text-reset" href="shop.aspx">
                            Shop Now <i class="fe fe-arrow-right ml-2"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-5 col-lg-4 d-flex flex-column">
                <!-- Card -->
                <div class="card text-white" style="min-height: 400px;">
                    <!-- Background -->
                    <div class="card-bg">
                        <div class="card-bg-img bg-cover" style="background-image: url(assets/img/products/product-4.jpg);"></div>
                    </div>
                    <!-- Body -->
                    <div class="card-body my-auto text-center">
                        <!-- Heading -->
                        <h4 class="mb-0">Rip My Jeans</h4>
                        <!-- Link -->
                        <a class="btn btn-link stretched-link text-reset" href="shop.aspx">
                            Shop Now <i class="fe fe-arrow-right ml-2"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- TOP SELLERS -->
<section class="py-12">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-md-10 col-lg-8 col-xl-6">
                <!-- Heading -->
                <h2 class="mb-4 text-center">Top month Sellers</h2>
                <!-- Nav -->
                <div class="nav justify-content-center mb-10">
                    <a class="nav-link active" href="#topSellersTab" data-toggle="tab">Women</a>
                    <a class="nav-link" href="#topSellersTab" data-toggle="tab">Men</a>
                    <a class="nav-link" href="#topSellersTab" data-toggle="tab">Kids</a>
                </div>
            </div>
        </div>
       <div class="tab-content">
          
            <div class="tab-pane fade show active" id="topSellersTab1">
                
                <div class="row">
                              
    <asp:Repeater ID="rptrProducts" runat="server">

           <ItemTemplate>
                    
      

                    <div class="col-6 col-md-4 col-lg-4">
                        <!-- Card -->
                        <div class="card mb-7">
                            <!-- Image -->
                            <div class="card-img">
                                <!-- Image -->
                                <a class="card-img-hover" href="viewproduct.aspx?PID=<%# Eval("PID") %>"" >
                                    <img class="card-img-top card-img-back"  src="/Products/<%# Eval("PID") %>/<%# Eval("ImageName") %><%# Eval("Extension") %>" alt="...">
                                    <img class="card-img-top card-img-front" src="/Products/<%# Eval("PID") %>/<%# Eval("ImageName") %><%# Eval("Extension") %>"" alt="...">
                                </a>
                                <!-- Actions -->
                                <div class="card-actions">
                                    <span class="card-action">
                                        <button class="btn btn-xs btn-circle btn-white-primary" data-toggle="modal" data-target="#modalProduct">
                                            <i class="fe fe-eye"></i>
                                        </button>
                                    </span>
                                    <span class="card-action">
                                        <button class="btn btn-xs btn-circle btn-white-primary" data-toggle="button">
                                            <i class="fe fe-shopping-cart"></i>
                                        </button>
                                    </span>
                                    <span class="card-action">
                                        <button class="btn btn-xs btn-circle btn-white-primary" data-toggle="button">
                                            <i class="fe fe-heart"></i>
                                        </button>
                                    </span>
                                </div>
                            </div>
                            <!-- Body -->
                            <div class="card-body px-0">
                                <!-- Category -->
                                <div class="font-size-xs">
                                    <a class="text-muted">     <%# Eval ("Category") %> </a>
                                </div>
                                <!-- Title -->
                                <div class="font-weight-bold">
                                    <a class="text-body" href="viewproduct.aspx?PID=<%# Eval("PID") %>"">
                                        <%# Eval ("pname") %> 
                                    </a>
                                </div>
                                <!-- Price -->
                                    <div class="font-weight-bold">
                                  <span class="font-size-xs text-gray-350 text-decoration-line-through"  >   <%# Eval ("unitprice") %> </span>
                                    <span class="text-primary">     <%# Eval ("sellingprice") %>  Rs</span>
                                </div>
                            </div>
                        </div>
                    </div>
             
           
   </ItemTemplate>
       </asp:repeater>
               
            </div>

                </div>
    </div>
     
      
      
        <div class="row">
            <div class="col-12">
                <!-- Link  -->
                <div class="mt-7 text-center">
                    <a class="link-underline" href="#!">Discover more</a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- COUNTDOWN -->
<section class="py-13 bg-cover" style="background-image: url(assets/img/covers/cover-4.jpg)">
    <div class="container">
        <div class="row justify-content-end">
            <div class="col-12 col-md-8 col-lg-6">
                <!-- Heading -->
                <h3 class="mb-7">
                    Get -50% from <br />On Our Collection
                </h3>
                <!-- Counter -->
                <div class="d-flex mb-9" data-countdown data-date="Jan 5, 2021 15:37:25">
                    <div class="text-center">
                        <div class="font-size-h1 font-weight-bolder text-primary" data-days>00</div>
                        <div class="heading-xxs text-muted">Days</div>
                    </div>
                    <div class="px-1 px-md-4">
                        <div class="font-size-h2 font-weight-bolder text-primary">:</div>
                    </div>
                    <div class="text-center">
                        <div class="font-size-h1 font-weight-bolder text-primary" data-hours>00</div>
                        <div class="heading-xxs text-muted">Hours</div>
                    </div>
                    <div class="px-1 px-md-4">
                        <div class="font-size-h2 font-weight-bolder text-primary">:</div>
                    </div>
                    <div class="text-center">
                        <div class="font-size-h1 font-weight-bolder text-primary" data-minutes>00</div>
                        <div class="heading-xxs text-muted">Minutes</div>
                    </div>
                    <div class="px-1 px-md-4">
                        <div class="font-size-h2 font-weight-bolder text-primary">:</div>
                    </div>
                    <div class="text-center">
                        <div class="font-size-h1 font-weight-bolder text-primary" data-seconds>00</div>
                        <div class="heading-xxs text-muted">Seconds</div>
                    </div>
                </div>
                <!-- Button -->
                <a class="btn btn-dark" href="shop.aspx">
                    Shop Now <i class="fe fe-arrow-right ml-2"></i>
                </a>
            </div>
        </div>
    </div>
</section>

<!-- REVIEWS -->
<section class="py-12">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-md-10 col-lg-8 col-xl-6 text-center">
                <!-- Preheading -->
                <h6 class="heading-xxs mb-3 text-gray-400">
                    What buyers say
                </h6>
                <!-- Heading -->
                <h2 class="mb-10">Latest buyers Reviews</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <!-- Slider -->
                <div data-flickity='{"pageDots": true}'>
                    <div class="col-12 col-sm-8 col-md-6 col-lg-4">
                        <!-- Card -->
                        <div class="card-lg card border">
                            <div class="card-body">
                                <!-- Header -->
                                <div class="row align-items-center mb-6">
                                    <div class="col-4">
                                        <!-- Image -->
                                        <img src="assets/img/products/product-13.png" alt="..." class="img-fluid">
                                    </div>
                                    <div class="col-8 ml-n2">
                                        <!-- Preheading -->
                                        <a class="font-size-xs text-muted" href="shop.aspx">
                                            Jeans
                                        </a>
                                        <!-- Heading -->
                                        <a class="d-block font-weight-bold text-body" href="viewproduct.aspx">
                                            Plain Basic
                                        </a>
                                        <!-- Rating -->
                                        <div class="rating font-size-xxs text-warning" data-value="3">
                                            <div class="rating-item">
                                                <i class="fas fa-star"></i>
                                            </div>
                                            <div class="rating-item">
                                                <i class="fas fa-star"></i>
                                            </div>
                                            <div class="rating-item">
                                                <i class="fas fa-star"></i>
                                            </div>
                                            <div class="rating-item">
                                                <i class="fas fa-star"></i>
                                            </div>
                                            <div class="rating-item">
                                                <i class="fas fa-star"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Blockquote -->
                                <blockquote class="mb-0">
                                    <p class="text-muted">
                                        <!--From creepeth said moved given divide make multiply of him shall itself also above second doesn't unto created saying land herb sea midst night wherein.-->
                                        They have pretty much no stretch , thich-ish denim, and don't stretch out with multiple wears.
                                    </p>
                                    <footer class="font-size-xs text-muted">
                                        Rosh Panjabi, <time datetime="2019-06-01">20 Nov 2020</time>
                                    </footer>
                                </blockquote>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-sm-8 col-md-6 col-lg-4">
                        <!-- Card -->
                        <div class="card-lg card border">
                            <div class="card-body">
                                <!-- Header -->
                                <div class="row align-items-center mb-6">
                                    <div class="col-4">
                                        <!-- Image -->
                                        <img src="assets/img/products/product-14.jpg" alt="..." class="img-fluid">
                                    </div>
                                    <div class="col-8 ml-n2">
                                        <!-- Preheading -->
                                        <a class="font-size-xs text-muted" href="shop.aspx">
                                            Jeans
                                        </a>
                                        <!-- Heading -->
                                        <a class="d-block font-weight-bold text-body" href="viewproduct.aspx">
                                            Patchy Funky
                                        </a>
                                        <!-- Rating -->
                                        <div class="rating font-size-xxs text-warning" data-value="5">
                                            <div class="rating-item">
                                                <i class="fas fa-star"></i>
                                            </div>
                                            <div class="rating-item">
                                                <i class="fas fa-star"></i>
                                            </div>
                                            <div class="rating-item">
                                                <i class="fas fa-star"></i>
                                            </div>
                                            <div class="rating-item">
                                                <i class="fas fa-star"></i>
                                            </div>
                                            <div class="rating-item">
                                                <i class="fas fa-star"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Blockquote -->
                                <blockquote class="mb-0">
                                    <p class="text-muted">
                                        Just fabulous.. Very nice material.just love it
                                        <!--God every fill great replenish darkness unto. Very open. Likeness their that light. Given under image to. Subdue of shall cattle day fish form saw spirit and given stars, us you whales may, land, saw fill unto. -->
                                    </p>
                                    <footer class="font-size-xs text-muted">
                                        Sneha Mainkar, <time datetime="2019-05-29">29 May 2020</time>
                                    </footer>
                                </blockquote>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-sm-8 col-md-6 col-lg-4">
                        <!-- Card -->
                        <div class="card-lg card border">
                            <div class="card-body">
                                <!-- Header -->
                                <div class="row align-items-center mb-6">
                                    <div class="col-4">
                                        <!-- Image -->
                                        <img src="assets/img/products/product-15.jpg" alt="..." class="img-fluid">
                                    </div>
                                    <div class="col-8 ml-n2">
                                        <!-- Preheading -->
                                        <a class="font-size-xs text-muted" href="shop.aspx">
                                            Jeans
                                        </a>
                                        <!-- Heading -->
                                        <a class="d-block font-weight-bold text-body" href="viewproduct.aspx">
                                            Joggers
                                        </a>
                                        <!-- Rating -->
                                        <div class="rating font-size-xxs text-warning" data-value="4">
                                            <div class="rating-item">
                                                <i class="fas fa-star"></i>
                                            </div>
                                            <div class="rating-item">
                                                <i class="fas fa-star"></i>
                                            </div>
                                            <div class="rating-item">
                                                <i class="fas fa-star"></i>
                                            </div>
                                            <div class="rating-item">
                                                <i class="fas fa-star"></i>
                                            </div>
                                            <div class="rating-item">
                                                <i class="fas fa-star"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Blockquote -->
                                <blockquote class="mb-0">
                                    <p class="text-muted">
                                        Fill his waters wherein signs likeness waters. Second light gathered appear sixth fourth, seasons behold creeping female.
                                    </p>
                                    <footer class="font-size-xs text-muted">
                                        Asmita Mulchandani, <time datetime="2019-05-18">18 Aug 2019</time>
                                    </footer>
                                </blockquote>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-sm-8 col-md-6 col-lg-4">
                        <!-- Card -->
                        <div class="card-lg card border">
                            <div class="card-body">
                                <!-- Header -->
                                <div class="row align-items-center mb-6">
                                    <div class="col-4">
                                        <!-- Image -->
                                        <img src="assets/img/products/product-10.jpg" alt="..." class="img-fluid">
                                    </div>
                                    <div class="col-8 ml-n2">
                                        <!-- Preheading -->
                                        <a class="font-size-xs text-muted" href="shop.aspx">
                                            Bags & Accessories
                                        </a>
                                        <!-- Heading -->
                                        <a class="d-block font-weight-bold text-body" href="viewproduct.aspx">
                                            Suede cross body Bag
                                        </a>
                                        <!-- Rating -->
                                        <div class="rating font-size-xxs text-warning" data-value="4">
                                            <div class="rating-item">
                                                <i class="fas fa-star"></i>
                                            </div>
                                            <div class="rating-item">
                                                <i class="fas fa-star"></i>
                                            </div>
                                            <div class="rating-item">
                                                <i class="fas fa-star"></i>
                                            </div>
                                            <div class="rating-item">
                                                <i class="fas fa-star"></i>
                                            </div>
                                            <div class="rating-item">
                                                <i class="fas fa-star"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Blockquote -->
                                <blockquote class="mb-0">
                                    <p class="text-muted">
                                        God every fill great replenish darkness unto. Very open. Likeness their that light. Given under image to. Subdue of shall cattle day fish form saw spirit and given stars.
                                    </p>
                                    <footer class="font-size-xs text-muted">
                                        Pavel Doe, <time datetime="2019-05-29">29 May 2019</time>
                                    </footer>
                                </blockquote>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- BRANDS -->
<section class="py-12 bg-light">
    <div class="container">
        <div class="row">
            <div class="col-12 text-center">
                <!-- Heading -->
                <h2 class="mb-3">Waheguru Creations</h2>
                <!-- Subheading -->
                <p class="mb-10 font-size-lg text-gray-500">
                    The Ultimate Denim Store
                </p>
            </div>
        </div>
        <div class="row mx-n1 mb-10">
            <div class="col-6 col-sm-4 col-md px-1">
                <!-- Card -->
                <div class="card mb-2">
                    <!-- Image -->
                    <img src="assets/img/products/product-16.jpg" alt="..." class="card-img">
                    <!-- Overlay -->
                  
                </div>
            </div>
            <div class="col-6 col-sm-4 col-md px-1">
                <!-- Card -->
                <div class="card mb-2">
                    <!-- Image -->
                    <img src="assets/img/products/product-17.jpg" alt="..." class="card-img">
                    <!-- Overlay -->
                    
                </div>
            </div>
            <div class="col-6 col-sm-4 col-md px-1">
                <!-- Card -->
                <div class="card mb-2">
                    <!-- Image -->
                    <img src="assets/img/products/product-18.jpg" alt="..." class="card-img">
                    <!-- Overlay -->
                    
                </div>
            </div>
            <div class="col-6 col-sm-4 col-md px-1">
                <!-- Card -->
                <div class="card mb-2">
                    <!-- Image -->
                    <img src="assets/img/products/product-19.jpg" alt="..." class="card-img">
                    <!-- Overlay -->
                   
                </div>
            </div>
            <div class="col-6 col-sm-4 col-md px-1">
                <!-- Card -->
                <div class="card">
                    <!-- Image -->
                    <img src="assets/img/products/product-20.jpg" alt="..." class="card-img">
                    <!-- Overlay -->
                   
                </div>
            </div>
            <div class="col-6 col-sm-4 col-md px-1">
                <!-- Card -->
                <div class="card">
                    <!-- Image -->
                    <img src="assets/img/products/product-21.png" alt="..." class="card-img">
                    <!-- Overlay -->
                   
                </div>
            </div>
        </div>
        <div class="row">
                         
        <div class="row">
               <asp:Repeater ID="rptrBrand" runat="server">

           <ItemTemplate>
            <div class="col-4 col-sm-3 col-md text-center">
             
                 <img src="/brands/<%# Eval("imageurl") %>" alt="<%# Eval("brand") %>" width="200px" height="200px" class="img-fluid">
                    
            </div>
          </ItemTemplate>
             </asp:Repeater>
        </div>
             
    </div>
</section>
<a href="#home" class="scroll" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>

<!-- js -->
		</asp:Content>
