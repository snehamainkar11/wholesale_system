<%@ Page Language="C#" AutoEventWireup="true" CodeFile="viewproduct.aspx.cs" Inherits="wholesale.viewproduct" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<!doctype html>
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
    <!-- Theme CSS -->
    <style type="text/css">
     .Star {
            background-image: url(Star.gif);
            height: 17px;
            width: 17px;
        }

        .WaitingStar {
            background-image: url(WaitingStar.gif);
            height: 17px;
            width: 17px;
        }

        .FilledStar {
            background-image: url(FilledStar.gif);
            height: 17px;
            width: 17px;
        }
        </style>
    <link rel="stylesheet" href="assets/css/theme.min.css">
    <title>Waheguru Creation</title>
</head>
<body>
    <!-- MODALS -->
    <!-- Newsletter: Horizontal -->
    <form runat="server">


    
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
                    <li class="breadcrumb-item">
                        <a class="text-gray-400" href="Shop.aspx">Jeans</a>
                    </li>
                    <li class="breadcrumb-item active">
                        
                    </li>
                </ol>
            </div>
        </div>
    </div>
</nav>
<!-- PRODUCT -->
<section>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="row">
                    <div class="col-12 col-md-6">
                        <!-- Card -->
                        <div class="card">
                            <!-- Badge -->
                            <div class="badge badge-primary card-badge text-uppercase">
                                Sale
                            </div>
                            <!-- Slider -->
                            <div class="mb-4" data-flickity='{"draggable": false, "fade": true}' id="productSlider">
                                <!-- Item -->
                                    <asp:Repeater Id="rptrImage" runat="server" >
                                        <ItemTemplate>

                                          <a href= "/Products/<%# Eval("ProID") %>/<%# Eval("Name") %><%# Eval("Extension") %>"  data-fancybox >
                                               <img  src="/Products/<%# Eval("ProID") %>/<%# Eval("Name") %><%# Eval("Extension") %>" alt="..."class="card-img-top">
                            </a>
                                                </ItemTemplate>
                            
                                    </asp:Repeater>
                                      
                            </div>
                        </div
                           
                        <!-- Slider -->
                        <div class="flickity-nav mx-n2 mb-10 mb-md-0" data-flickity='{"asNavFor": "#productSlider", "contain": true, "wrapAround": false}'>
                            <!-- Item -->
                            <div class="col-12 px-2" style="max-width: 113px;">
                                <!-- Image -->
                                <div class="embed-responsive embed-responsive-1by1 bg-cover" style="background-image: url(assets/img/products/product-5.jpg);"></div>
                            </div>
                            <!-- Item -->
                            <div class="col-12 px-2" style="max-width: 113px;">
                                <!-- Image -->
                                <div class="embed-responsive embed-responsive-1by1 bg-cover" style="background-image: url(assets/img/products/product-120.jpg);"></div>
                            </div>
                            <!-- Item -->
                            <div class="col-12 px-2" style="max-width: 113px;">
                                <!-- Image -->
                                <div class="embed-responsive embed-responsive-1by1 bg-cover" style="background-image: url(assets/img/products/product-5.jpg);"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-6 pl-lg-10">
                        <!-- Header -->
                        <div class="row mb-1">
                            <div class="col">
                                <!-- Preheading -->
                                <a class="text-muted" href="shop.aspx">Jeans</a>
                            </div>
                            <div class="col-auto">
                               <asp:Repeater ID="rptr1" runat="server">
                <ItemTemplate>
                                <div class="rating font-size-xs text-dark" data-value= <%#Eval("AverageRating")%>  >
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
                    </ItemTemplate></asp:Repeater>
                                <a class="font-size-sm text-reset ml-2" href="#reviews">
                                    Reviews
                                </a>
                            </div>
                        </div>
                                                    

                        <!-- Heading -->
                                         
       <asp:Repeater ID="Repeater1" runat="server">

           <ItemTemplate>
                        <h3 class="mb-2"><%# Eval ("pname") %> 
</h3>
                        <!-- Price -->Rs.1,099
                        <div class="mb-7">
                            <span class="font-size-lg font-weight-bold text-gray-350 text-decoration-line-through">       <%# Eval ("unitprice") %> 
</span>
                            <span class="ml-1 font-size-h5 font-weight-bolder text-primary">                                        <%# Eval ("sellingprice") %> 
</span>
                            <span class="font-size-sm ml-1">             <%# Eval ("status") %> 
</span>
                        </div>
                        <!-- Form -->
                      
                            <div class="form-group">
                                <!-- Label -->
                                <p class="mb-5">
                                    Color: <strong id="colorCaption">                                        <%# Eval ("color") %> 
</strong>
                                </p>
                                <!-- Radio -->
                                <div class="mb-8 ml-n1">
                                    <asp:RadioButton ID="imgRadioOne" class="custom-control-input" runat="server" name="imgRadio" data-toggle="form-caption" data-target="#colorCaption" value="White"/>
                                    <div class="custom-control custom-control-inline custom-control-img">
                                       <!-- <input type="radio" class="custom-control-input" id="imgRadioOne" name="imgRadio" data-toggle="form-caption" data-target="#colorCaption" value="White" checked>-->
                                        <label class="custom-control-label" for="imgRadioOne">
                                            <span class="embed-responsive embed-responsive-1by1 bg-cover" style="background-image: url(assets/img/products/product-5.jpg);"></span>
                                        </label>
                                    </div>
                                    <div class="custom-control custom-control-inline custom-control-img">
                                        <input type="radio" class="custom-control-input" id="imgRadioTwo" name="imgRadio" data-toggle="form-caption" data-target="#colorCaption" value="Black">
                                        <label class="custom-control-label" for="imgRadioTwo">
                                            <span class="embed-responsive embed-responsive-1by1 bg-cover" style="background-image: url(assets/img/products/product-120.jpg);"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <!-- Label -->
                                <p class="mb-5">
                                    Size: <strong><span id="sizeCaption">34</span> Size(IN)</strong>
                                <div class="mb-2">
                                     <div class="custom-control custom-control-inline custom-control-size mb-2">
                                        
                                        <asp:radiobuttonlist ID="rblSize" runat="server" RepeatDirection="Horizontal" >
                                        <asp:ListItem Value="28" Text="28"></asp:ListItem>
                                        <asp:ListItem Value="30" Text="30"></asp:ListItem>
                                        <asp:ListItem Value="32" Text="32"></asp:ListItem>
                                        <asp:ListItem Value="34" Text="34"></asp:ListItem>
                                        <asp:ListItem Value="36" Text="36"></asp:ListItem>
                                        <asp:ListItem Value="38" Text="38"></asp:ListItem>
                                        <asp:ListItem Value="40" Text="40"></asp:ListItem>

                                    </asp:radiobuttonlist>
                                </div>
                                    </div>
                                <!-- Size chart -->
                                <p class="mb-7">
                                    <img src="assets/img/icons/icon-ruler.svg" alt="..." class="img-fluid"> <a class="text-reset text-decoration-underline ml-3" data-toggle="modal" href="#modalSizeChart">Size chart</a>
                                </p>
                                <div class="form-row mb-7">
                                    <div class="col-7 col-lg">
                                        <!-- Quantity -->
                                         <div class="col-10 col-lg">
                                        <asp:TextBox ID="quantity" runat="server" Placeholder="Enter Quantity" class="form-control form-control-white-700 form-control-lg" Width="458px" Height="55px"></asp:TextBox>  
                                    
                                        </div>
                                    </div>
                                </div>
                                       
                                  

                  
                                    
                                    <div class="col-12 col-lg">
                                        <!-- Submit -->
                                        <asp:Button ID="ButtonAddtoCart" runat="server" Text="Add To Cart" BorderStyle="Solid" BackColor="Black" Width="465px" Height="55px" ForeColor="White" OnClick="ButtonAddtoCart_Click"/>  
                                      <asp:Label ID="lblError" CssClass="text-danger" runat="server">

                                        </asp:Label>
                                    </div>
                                    <div class="col-12 col-lg-auto">
                                       <asp:Button ID="Button3" runat="server" Text="Wishlist" BorderStyle="Solid" BackColor="Black" Width="465px" Height="55px" hover="White" ForeColor="White"/>  
                                     
                                    </div>
                                </div>
                               
                              
                            </div>
                       
                    </div>
             
                </div>
            </div>
        </div>
    </div>
</section>
     </ItemTemplate>
           </asp:Repeater>
<!-- DESCRIPTION -->
<section class="pt-11">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <!-- Nav -->
                <div class="nav nav-tabs nav-overflow justify-content-start justify-content-md-center border-bottom">
                    <a class="nav-link active" data-toggle="tab" href="#descriptionTab">
                        Description
                    </a>
                    <a class="nav-link" data-toggle="tab" href="#sizeTab">
                        Material And Care
                    </a>
                    <a class="nav-link" data-toggle="tab" href="#shippingTab">
                        Shipping
                    </a>
                </div>
                <!-- Content -->
                 <asp:Repeater ID="Repeater2" runat="server">

           <ItemTemplate>
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="descriptionTab">
                        <div class="row justify-content-center py-9">
                            <div class="col-12 col-lg-10 col-xl-8">
                                <div class="row">
                                    <div class="col-12">
                                        <!-- Text -->
                                        <p class="text-gray-500">
                                           <%# Eval ("pdesc") %>
                                            <!--Won't herb first male seas, beast. Let upon, female upon third fifth every. Man subdue rule after years herb after
                                            form. And image may, morning. Behold in tree day sea that together cattle whose. Fifth gathering brought
                                            bearing. Abundantly creeping whose. Beginning form have void two. A whose.-->
                                        </p>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <!-- List -->
                                        <ul class="list list-unstyled mb-md-0 text-gray-500">
                                            <li>
                                                <strong class="text-body">Product Code</strong>:  <%# Eval ("pcode") %>
                                            </li>
                                            <li>
                                                <strong class="text-body">Lenght</strong>: <%# Eval ("length") %>
                                            </li>
                                            <li>
                                                <strong class="text-body">Specification</strong>:  <%# Eval ("subcatname") %>
                                            </li>
                                        </ul>
                                    </div>
                                 
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="sizeTab">
                        <div class="row justify-content-center py-9">
                            <div class="col-12 col-lg-10 col-xl-8">
                                <div class="row">
                                    <div class="col-12 col-md-6">
                                        <!-- Text -->
                                        <p class="mb-4">
                                            <strong>Information:</strong>
                                        </p>
                                        <!-- List -->
                                        <ul class="mb-md-0 text-gray-500">
                                            <li>
                                               <%# Eval ("materialcare") %>
                                            </li>
                                            <li>
                                                Make great day bearing.
                                            </li>
                                            <li>
                                                For the moveth is days don't said days.
                                            </li>
                                        </ul>
                                    </div>
                                  
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="shippingTab">
                        <div class="row justify-content-center py-9">
                            <div class="col-12 col-lg-10 col-xl-8">
                                <!-- Table -->
                                <div class="table-responsive">
                                    <table class="table table-bordered table-sm table-hover">
                                        <thead>
                                            <tr>
                                                <th>Shipping Options</th>
                                                <th>Delivery Time</th>
                                                <th>Price</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Standard Shipping</td>
                                                <td>Delivery in 5 - 7 working days</td>
                                                <td>Rs.100</td>
                                            </tr>
                                            <tr>
                                                <td>Express Shipping</td>
                                                <td>Delivery in 3 - 5 working days</td>
                                                <td>Rs.150</td>
                                            </tr>
                                            <tr>
                                                <td>1 - 2 day Shipping</td>
                                                <td>Delivery in 1 - 2 working days</td>
                                                <td>Rs.250</td>
                                            </tr>
                                          
                                        </tbody>
                                    </table>
                                </div>
                                <!-- Caption -->
                               
                                       
  </ItemTemplate>
       </asp:repeater>
                            </div>
                        </div>
                         
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- PRODUCTS -->
<section class="pt-11">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <!-- Heading -->
                <h4 class="mb-10 text-center">You might also like</h4>
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
                                    <img class="card-img-top cardk"  src="/Products/<%# Eval("PID") %>/<%# Eval("ImageName") %><%# Eval("Extension") %>" alt="...">
                                    <img class="card-img-top card-img-front" src="/Products/<%# Eval("PID") %>/<%# Eval("ImageName") %><%# Eval("Extension") %>"" alt="...">
                                </a>
                                &nbsp;<!-- Actions --><div class="card-actions">
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
      </
      
<!-- REVIEWS -->
<section class="pt-9 pb-11" id="reviews">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <!-- Heading -->
                <h4 class="mb-10 text-center">Customer Reviews</h4>
                <!-- Header -->
                <div class="row align-items-center">
                    <div class="col-12 col-md-auto">
                        <!-- Dropdown -->
                        <div class="dropdown mb-4 mb-md-0">
                            <!-- Toggle -->
                            <a class="dropdown-toggle text-reset" data-toggle="dropdown" href="#">
                                <strong>Sort by: Newest</strong>
                            </a>
                            <!-- Menu -->
                            <div class="dropdown-menu mt-3">
                                <a class="dropdown-item" href="#!">Newest</a>
                                <a class="dropdown-item" href="#!">Oldest</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md text-md-center">
                         <asp:Repeater ID="Repeater3" runat="server">
                <ItemTemplate>
                      <div class="rating font-size-xs text-dark" data-value= <%#Eval("AverageRating")%>  >
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
                    </ItemTemplate>
                    </asp:Repeater>
                        <!-- Count -->
                        <strong class="font-size-sm ml-2">Reviews</strong>
                    </div>
                    <div class="col-12 col-md-auto">
                        <!-- Button -->
                        <a class="btn btn-sm btn-dark" data-toggle="collapse" href="#reviewForm">
                            Write Review
                        </a>
                    </div>
                </div>
                <!-- New Review -->
                <div class="collapse" id="reviewForm">
                    <!-- Divider -->
                    <hr class="my-8">
                    <!-- Form -->
                   
                        <div class="row">
                            <div class="col-12 mb-6 text-center">
                                <!-- Text -->
                                <p class="mb-1 font-size-xs">
                                    Score:             <asp:Label ID="lbresult" runat="server" Text=""></asp:Label>

                                </p>
                                <!-- Rating form -->
                                <div class="rating-form">
                                    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
        <asp:Rating ID="Rating1" runat="server" 
            StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star"
            FilledStarCssClass="FilledStar">
        </asp:Rating>
                                  
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <!-- Name -->
                                <div class="form-group">
                                    <label class="sr-only" for="reviewName">Your Name:</label>
                                    <asp:TextBox ID="reviewName" runat="server" class="form-control form-control-sm" placeholder="Your Name *" ></asp:TextBox>  
                                    
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <!-- Email -->
                                <div class="form-group">
                                    <label class="sr-only" for="reviewEmail">Your Email:</label>
                                    <asp:TextBox class="form-control form-control-sm" id="reviewEmail" type="email" placeholder="Your Email *"  runat="server"/>
                                </div>
                            </div>
                            <div class="col-12">
                                <!-- Name -->
                                <div class="form-group">
                                    <label class="sr-only" for="reviewTitle">Review Title:</label>
                                    <asp:TextBox ID="reviewTitle" runat="server" class="form-control form-control-sm" placeholder="Review Title *" ></asp:TextBox>  
                                    
                                </div>
                            </div>
                            <div class="col-12">
                                <!-- Name -->
                                <div class="form-group">
                                    <label class="sr-only" for="reviewText">Review:</label>
                                    <asp:TextBox ID="txtreview" runat="server" class="form-control form-control-sm" Textmode="MultiLine" rows="5" placeholder="Review *" ></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-12 text-center">
                                <!-- Button -->
                               




                                <asp:Button ID="postrvw" OnClick="postrvw_Click" runat="server" Text="Post Review" AutoPostBack="true"/>  
                                      
                            </div>
                        </div>
                </div>
                <asp:Repeater ID="Repeater4" runat="server">
                <ItemTemplate>
                <div class="mt-8">
                    <div class="review">
                        <div class="review-body">
                            <div class="row">
                                <div class="col-12 col-md-auto">
                                    <!-- Avatar -->
                                    <div class="avatar avatar-xxl mb-6 mb-md-0">
                                        <span class="avatar-title rounded-circle">
                                            <i class="fa fa-user"></i>
                                        </span>
                                    </div>
                                </div>
                                <div class="col-12 col-md">
                                    <!-- Header -->
                                    <div class="row mb-6">
                                        <div class="col-12">
                                            
                                            <div class="rating font-size-sm text-dark" data-value= <%#Eval("ratings")%>   >
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
                                        <div class="col-12">
                                            <!-- Time -->
                                            <span class="font-size-xs text-muted">
                                               <%#Eval("username")%>  <time datetime="2019-07-25">25 Jan 2020</time>
                                            </span>
                                        </div>
                                    </div>
                                    <!-- Title -->
                                    <p class="mb-2 font-size-lg font-weight-bold">
                                         <%#Eval("title")%> 
                                    </p>
                                    <!-- Text -->
                                    <p class="text-gray-500">
                                          <%#Eval("feedback")%> 
                                          </p>
                                 
                                    <div class="row align-items-center">
                                        <div class="col-auto d-none d-lg-block">
                                            <!-- Text -->
                                            <p class="mb-0 font-size-sm">Was this review helpful?</p>
                                        </div>
                                        <div class="col-auto mr-auto">
                                            <!-- Rate -->
                                            <div class="rate">
                                                <a class="rate-item" data-toggle="vote" data-count="3" href="#" role="button">
                                                    <i class="fe fe-thumbs-up"></i>
                                                </a>
                                                <a class="rate-item" data-toggle="vote" data-count="0" href="#" role="button">
                                                    <i class="fe fe-thumbs-down"></i>
                                                </a>
                                            </div>
                                        </div>
                                     
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                  
               </ItemTemplate>
                                                 </asp:Repeater>
                <!-- Pagination -->
                <nav class="d-flex justify-content-center mt-9">
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
    </section></form>
      <script src="assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="assets/libs/flickity/dist/flickity.pkgd.min.js"></script>
    <script src="assets/libs/%40fancyapps/fancybox/dist/jquery.fancybox.min.js"></script>
    <script src="assets/libs/smooth-scroll/dist/smooth-scroll.min.js"></script>
    <script src="assets/libs/simplebar/dist/simplebar.min.js"></script>
    <script src="assets/libs/list.js/dist/list.min.js"></script>
    <script src="assets/libs/jarallax/dist/jarallax.min.js"></script>
    <script src="assets/libs/highlightjs/highlight.pack.min.js"></script>
    <script src="assets/libs/flickity-fade/flickity-fade.js"></script>
    <!-- Map (replace the API key to enable) -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCnKt8_N4-FKOnhI_pSaDL7g_g-XI1-R9E"></script>
    <!-- Theme JS -->
    <script src="assets/js/theme.min.js"></script>

        </body></html>
