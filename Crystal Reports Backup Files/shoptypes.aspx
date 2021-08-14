<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false"  MasterPageFile="~/Site.Master" CodeFile="shoptypes.aspx.cs" Inherits="wholesale.shoptypes" %>
<asp:Content ID="conten1" ContentPlaceHolderID="Maincontent" runat="server">  
    

<section class="py-11">
    <div class="container">
        <div class="row">
            <div class="col-12 col-md-4 col-lg-3">
                <!-- Filters -->
                <form class="mb-10 mb-md-0">
                    <ul class="nav nav-vertical" id="filterNav">
                        <li class="nav-item">
                            <!-- Toggle -->
                            <a class="nav-link dropdown-toggle font-size-lg text-reset border-bottom mb-6" data-toggle="collapse" href="#categoryCollapse">
                                Category
                            </a>
                            <!-- Collapse -->
                            <div class="collapse show" id="categoryCollapse">
                                <div class="form-group">
                                    <ul class="list-styled mb-0" id="productsNav">
                                        <li class="list-styled-item">
                                            <a class="list-styled-link" href="#">
                                                All Products
                                            </a>
                                        </li>
                                        <li class="list-styled-item">
                                            <!-- Toggle -->
                                            <a class="list-styled-link" data-toggle="collapse" href="#blousesCollapse">
                                                Jeans
                                            </a>
                                            <!-- Collapse -->
                                            <div class="collapse" id="blousesCollapse" data-parent="#productsNav">
                                                <div class="py-4 pl-5">
                                                    <div class="custom-control custom-checkbox mb-3">
                                                        <label  for="blousesOne">
                                                            Skiny Jeans
                                                        </label>
                                                    </div>
                                                    <div class="custom-control custom-checkbox mb-3">
                                                        <label  for="blousesTwo">
                                                            Straight Jeans
                                                        </label>
                                                    </div>
                                                    <div class="custom-control custom-checkbox mb-3">
                                                        <label  for="blousesTwo">
                                                            Boyfriend Jeans
                                                        </label>
                                                    </div>
                                                    <div class="custom-control custom-checkbox mb-3">
                                                        <label  for="blousesThree">
                                                            Whiskers Jeans
                                                        </label>
                                                    </div>
                                                    <div class="custom-control custom-checkbox mb-3">
                                                        <label  for="blousesTwo">
                                                            Cargo Jeans
                                                        </label>
                                                    </div>
                                                    <div class="custom-control custom-checkbox">
                                                        <label  for="blousesFour">
                                                            Wide Jeans
                                                        </label>
                                                    </div>
                                                    <div class="custom-control custom-checkbox">
                                                        <label  for="blousesFour">
                                                            Side Stripe Jeans
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="list-styled-item">
                                            <!-- Toggle -->
                                            <a class="list-styled-link" data-toggle="collapse" href="#coatsCollapse">
                                                Joggers
                                            </a>
                                            <!-- Collapse -->
                                            <div class="collapse" id="coatsCollapse" data-parent="#productsNav">
                                                <div class="py-4 pl-5">
                                                    <div class="custom-control custom-checkbox mb-3">
                                                        <label  for="coatsOne">
                                                            Metro Street Joggers
                                                        </label>
                                                    </div>
                                                    <div class="custom-control custom-checkbox mb-3">
                                                        <label  for="coatsTwo">
                                                            Cropped Joggers
                                                        </label>
                                                    </div>
                                                    <div class="custom-control custom-checkbox">
                                                        <label  for="coatsThree">
                                                            Restore Joggers
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="list-styled-item">
                                            <!-- Toggle -->
                                            <a class="list-styled-link" data-toggle="collapse" href="#dressesCollapse" aria-expanded="true">
                                                Funky
                                            </a>
                                            <!-- Collapse -->
                                            <div class="collapse show" id="dressesCollapse" data-parent="#productsNav">
                                                <div class="py-4 pl-5">
                                                    <div class="custom-control custom-checkbox mb-3">
                                                        <label  for="dressesOne">
                                                            Black Funky
                                                        </label>
                                                    </div>
                                                    <div class="custom-control custom-checkbox mb-3">
                                                        <label  for="dressesTwo">
                                                            Stone Funky
                                                        </label>
                                                    </div>
                                                    <div class="custom-control custom-checkbox mb-3">
                                                        <label  for="dressesThree">
                                                            Patches Funky
                                                        </label>
                                                    </div>
                                                    <!--<div class="custom-control custom-checkbox">
                                                        <input class="custom-control-input" id="dressesFour" type="checkbox">
                                                        <label  for="dressesFour">
                                                            Maxi Dresses
                                                        </label>
                                                    </div>-->
                                                </div>
                                            </div>
                                        </li>
                                        <li class="list-styled-item">
                                            <!-- Toggle -->
                                            <a class="list-styled-link" data-toggle="collapse" href="#hoodiesCollapse">
                                                Ripped
                                            </a>
                                            <!-- Collapse -->
                                            <div class="collapse" id="hoodiesCollapse" data-parent="#productsNav">
                                                <div class="py-4 pl-5">
                                                    <div class="custom-control custom-checkbox mb-3">
                                                        <label  for="hoodiesOne">
                                                            Damage Ripped
                                                        </label>
                                                    </div>
                                                    <div class="custom-control custom-checkbox mb-3">
                                                        <label  for="hoodiesTwo">
                                                            Scrape Ripped
                                                        </label>
                                                    </div>
                                                    <div class="custom-control custom-checkbox mb-3">
                                                        <label for="hoodiesThree">
                                                            Shred Ripped
                                                        </label>
                                                    </div>
                                                    <div class="custom-control custom-checkbox">
                                                        <input class="custom-control-input" id="hoodiesFour" type="checkbox">
                                                        <label  for="hoodiesFour">
                                                            Hole Ripped
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="list-styled-item">
                                            <!-- Toggle -->
                                            <a class="list-styled-link" data-toggle="collapse" href="#denimCollapse">
                                                Denim
                                            </a>
                                            <!-- Collapse -->
                                            <div class="collapse" id="denimCollapse" data-parent="#productsNav">
                                                <div class="py-4 pl-5">
                                                    <div class="custom-control custom-checkbox mb-3">
                                                        <input class="custom-control-input" id="denimOne" type="checkbox">
                                                        <label  for="denimOne">
                                                            Women Shorts
                                                        </label>
                                                    </div>
                                                    <div class="custom-control custom-checkbox mb-3">
                                                        <input class="custom-control-input" id="denimTwo" type="checkbox">
                                                        <label  for="denimTwo">
                                                            Juniors' Shorts
                                                        </label>
                                                    </div>
                                                    <div class="custom-control custom-checkbox mb-3">
                                                        <input class="custom-control-input" id="denimThree" type="checkbox">
                                                        <label  for="denimThree">
                                                            Men Shorts
                                                        </label>
                                                    </div>
                                                    <!--<div class="custom-control custom-checkbox">
                                                        <input class="custom-control-input" id="denimFour" type="checkbox">
                                                        <label  for="denimFour">
                                                            Women Plus Shorts
                                                        </label>
                                                    </div>-->
                                                </div>
                                            </div>
                                        </li>
                                        <li class="list-styled-item">
                                            <!-- Toggle -->
                                            <a class="list-styled-link" data-toggle="collapse" href="#jeansCollapse">
                                                Knee Focus
                                            </a>
                                            <!-- Collapse -->
                                            <div class="collapse" id="jeansCollapse" data-parent="#productsNav">
                                                <div class="py-4 pl-5">
                                                    <div class="custom-control custom-checkbox mb-3">
                                                        <input class="custom-control-input" id="jeansOne" type="checkbox">
                                                        <label  for="jeansOne">
                                                            Knee Cut
                                                        </label>
                                                    </div>
                                                    <div class="custom-control custom-checkbox mb-3">
                                                        <input class="custom-control-input" id="jeansTwo" type="checkbox">
                                                        <label  for="jeansTwo">
                                                            Knee Net
                                                        </label>
                                                    </div>
                                                   <!-- <div class="custom-control custom-checkbox mb-3">
                                                        <input class="custom-control-input" id="jeansThree" type="checkbox">
                                                        <label  for="jeansThree">
                                                            Surf, Skate & Street Clothing
                                                        </label>
                                                    </div>
                                                    <div class="custom-control custom-checkbox">
                                                        <input class="custom-control-input" id="jeansFour" type="checkbox">
                                                        <label  for="jeansFour">
                                                            Men Big & Tall Pants
                                                        </label>
                                                    </div>-->
                                                </div>
                                            </div>
                                        </li>
                                        <li class="list-styled-item">
                                            <!-- Toggle -->
                                           <!-- <a class="list-styled-link" data-toggle="collapse" href="#jumpersCollapse">
                                                Jumpers and Cardigans
                                            </a>-->
                                            <!-- Collapse -->
                                           <!-- <div class="collapse" id="jumpersCollapse" data-parent="#productsNav">
                                                <div class="py-4 pl-5">
                                                    <div class="custom-control custom-checkbox mb-3">
                                                        <input class="custom-control-input" id="jumpersOne" type="checkbox">
                                                        <label  for="jumpersOne">
                                                            Sweaters Plus-Size
                                                        </label>
                                                    </div>
                                                    <div class="custom-control custom-checkbox mb-3">
                                                        <input class="custom-control-input" id="jumpersTwo" type="checkbox">
                                                        <label  for="jumpersTwo">
                                                            Plus Sweaters
                                                        </label>
                                                    </div>
                                                    <div class="custom-control custom-checkbox mb-3">
                                                        <input class="custom-control-input" id="jumpersThree" type="checkbox">
                                                        <label  for="jumpersThree">
                                                            Petite Cardigans
                                                        </label>
                                                    </div>
                                                    <div class="custom-control custom-checkbox">
                                                        <input class="custom-control-input" id="jumpersFour" type="checkbox">
                                                        <label  for="jumpersFour">
                                                            Tops, Tees & Blouses
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>-->


                                        <li class="list-styled-item">
                                            <!-- Toggle -->
                                           <!-- <a class="list-styled-link" data-toggle="collapse" href="#legginsCollapse">
                                                Leggings
                                            </a>
                                            <!-- Collapse -->
                                            <div class="collapse" id="legginsCollapse" data-parent="#productsNav">
                                                <div class="py-4 pl-5">
                                                    <div class="custom-control custom-checkbox mb-3">
                                                        <input class="custom-control-input" id="legginsOne" type="checkbox">
                                                        <label  for="legginsOne">
                                                            Novelty Leggings
                                                        </label>
                                                    </div>
                                                    <div class="custom-control custom-checkbox mb-3">
                                                        <input class="custom-control-input" id="legginsTwo" type="checkbox">
                                                        <label  for="legginsTwo">
                                                            Novelty Pants & Capris
                                                        </label>
                                                    </div>
                                                    <div class="custom-control custom-checkbox mb-3">
                                                        <input class="custom-control-input" id="legginsThree" type="checkbox">
                                                        <label  for="legginsThree">
                                                            Women Yoga Leggings
                                                        </label>
                                                    </div>
                                                    <div class="custom-control custom-checkbox">
                                                        <input class="custom-control-input" id="legginsFour" type="checkbox">
                                                        <label  for="legginsFour">
                                                            Workout & Training Leggings
                                                        </label>
                                                    </div> 
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item">
                            <!-- Toggle -->
                            <!--<a class="nav-link dropdown-toggle font-size-lg text-reset border-bottom mb-6" data-toggle="collapse" href="#seasonCollapse">
                                Season
                            </a>-->
                            <!-- Collapse -->
                           <!-- <div class="collapse" id="seasonCollapse" data-toggle="simplebar" data-target="#seasonGroup">
                                <div class="form-group form-group-overflow mb-6" id="seasonGroup">
                                    <div class="custom-control custom-checkbox mb-3">
                                        <input class="custom-control-input" id="seasonOne" type="checkbox" checked>
                                        <label  for="seasonOne">
                                            Summer
                                        </label>
                                    </div>
                                    <div class="custom-control custom-checkbox mb-3">
                                        <input class="custom-control-input" id="seasonTwo" type="checkbox">
                                        <label  for="seasonTwo">
                                            Winter
                                        </label>
                                    </div>
                                    <div class="custom-control custom-checkbox">
                                        <input class="custom-control-input" id="seasonThree" type="checkbox">
                                        <label  for="seasonThree">
                                            Spring & Autumn
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </li>-->
                        <li class="nav-item">
                            <!-- Toggle -->
                            <a class="nav-link dropdown-toggle font-size-lg text-reset border-bottom mb-6" data-toggle="collapse" href="#sizeCollapse">
                                Size
                            </a>
                            <!-- Collapse -->
                            <div class="collapse" id="sizeCollapse" data-toggle="simplebar" data-target="#sizeGroup">
                                <div class="form-group form-group-overlow mb-6" id="sizeGroup">
                                    <div class="custom-control custom-control-inline custom-control-size mb-2">
                                        <input class="custom-control-input" id="sizeOne" type="checkbox">
                                        <label  for="sizeOne">
                                            28
                                        </label>
                                    </div>
                                    <div class="custom-control custom-control-inline custom-control-size mb-2">
                                        <input class="custom-control-input" id="sizeTwo" type="checkbox" disabled>
                                        <label  for="sizeTwo">
                                            30
                                        </label>
                                    </div>
                                    <div class="custom-control custom-control-inline custom-control-size mb-2">
                                        <input class="custom-control-input" id="sizeThree" type="checkbox">
                                        <label  for="sizeThree">
                                            32
                                        </label>
                                    </div>
                                    <div class="custom-control custom-control-inline custom-control-size mb-2">
                                        <input class="custom-control-input" id="sizeFour" type="checkbox">
                                        <label  for="sizeFour">
                                            34
                                        </label>
                                    </div>
                                    <div class="custom-control custom-control-inline custom-control-size mb-2">
                                        <input class="custom-control-input" id="sizeFive" type="checkbox" checked>
                                        <label  for="sizeFive">
                                            36
                                        </label>
                                    </div>
                                    <div class="custom-control custom-control-inline custom-control-size mb-2">
                                        <input class="custom-control-input" id="sizeSix" type="checkbox">
                                        <label  for="sizeSix">
                                            38
                                        </label>
                                    </div>
                                    <div class="custom-control custom-control-inline custom-control-size mb-2">
                                        <input class="custom-control-input" id="sizeSeven" type="checkbox">
                                        <label  for="sizeSeven">
                                            40
                                        </label>
                                    </div>
                                    <div class="custom-control custom-control-inline custom-control-size mb-2">
                                        <input class="custom-control-input" id="sizeEight" type="checkbox" disabled>
                                        <label  for="sizeEight">
                                            42
                                        </label>
                                    </div>
                                    <!--<div class="custom-control custom-control-inline custom-control-size mb-2">
                                        <input class="custom-control-input" id="sizeNine" type="checkbox">
                                        <label  for="sizeNine">
                                            
                                        </label>
                                    </div>
                                    <div class="custom-control custom-control-inline custom-control-size mb-2">
                                        <input class="custom-control-input" id="sizeTen" type="checkbox">
                                        <label  for="sizeTen">
                                            4XL
                                        </label>
                                    </div>
                                    <div class="custom-control custom-control-inline custom-control-size mb-2">
                                        <input class="custom-control-input" id="sizeEleven" type="checkbox">
                                        <label  for="sizeEleven">
                                            One Size
                                        </label>
                                    </div>-->
                                </div>
                            </div>
                        </li>
                        <li class="nav-item">
                            <!-- Toggle -->
                            <a class="nav-link dropdown-toggle font-size-lg text-reset border-bottom mb-6" data-toggle="collapse" href="#colorCollapse">
                                Color
                            </a>
                            <!-- Collapse -->
                            <div class="collapse" id="colorCollapse" data-toggle="simplebar" data-target="#colorGroup">
                                <div class="form-group form-group-overflow mb-6" id="colorGroup">
                                    <div class="custom-control custom-control-color mb-3">
                                        <input class="custom-control-input" id="colorOne" type="checkbox">
                                        <label class="custom-control-label text-dark" for="colorOne">
                                            <span class="text-body">Black</span>
                                        </label>
                                    </div>
                                    <div class="custom-control custom-control-color mb-3">
                                        <input class="custom-control-input" id="colorTwo" type="checkbox" checked>
                                        <label  style="color: #f9f9f9;" for="colorTwo">
                                            <span class="text-body">White</span>
                                        </label>
                                    </div>
                                    <div class="custom-control custom-control-color mb-3">
                                        <input class="custom-control-input" id="colorThree" type="checkbox">
                                        <label class="custom-control-label text-info" for="colorThree">
                                            <span class="text-body">Blue</span>
                                        </label>
                                    </div>
                                    <div class="custom-control custom-control-color mb-3">
                                        <input class="custom-control-input" id="colorFour" type="checkbox">
                                        <label class="custom-control-label text-primary" for="colorFour">
                                            <span class="text-body">Red</span>
                                        </label>
                                    </div>
                                    <div class="custom-control custom-control-color mb-3">
                                        <input class="custom-control-input" id="colorFive" type="checkbox" disabled>
                                        <label  for="colorFive" style="color: #795548">
                                            <span class="text-body">Brown</span>
                                        </label>
                                    </div>
                                    <div class="custom-control custom-control-color mb-3">
                                        <input class="custom-control-input" id="colorSix" type="checkbox">
                                        <label class="custom-control-label text-gray-300" for="colorSix">
                                            <span class="text-body">Gray</span>
                                        </label>
                                    </div>
                                    <div class="custom-control custom-control-color mb-3">
                                        <input class="custom-control-input" id="colorSeven" type="checkbox">
                                        <label  for="colorSeven" style="color: #17a2b8;">
                                            <span class="text-body">Cyan</span>
                                        </label>
                                    </div>
                                    <div class="custom-control custom-control-color">
                                        <input class="custom-control-input" id="colorEight" type="checkbox">
                                        <label  for="colorEight" style="color: #e83e8c;">
                                            <span class="text-body">Pink</span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item">
                            <!-- Toggle -->
                            <a class="nav-link dropdown-toggle font-size-lg text-reset border-bottom mb-6" data-toggle="collapse" href="#brandCollapse">
                                Brand
                            </a>
                            <!-- Collapse -->
                            <div class="collapse" id="brandCollapse" data-toggle="simplebar" data-target="#brandGroup">
                                <!-- Search -->
                                <div data-toggle="lists" data-options='{"valueNames": ["name"]}'>
                                    <!-- Input group -->
                                 
                                    <!-- Form group -->
                                    <div class="form-group form-group-overflow mb-6" id="brandGroup">
                                        <div class="list">
                                            <div class="custom-control custom-checkbox mb-3">
                                                <label  for="brandOne">
                                                    Agent Jack's
                                                </label>
                                            </div>
                                            <div class="custom-control custom-checkbox mb-3">
                                                <label  for="brandTwo">
                                                    Hangout Denim
                                                </label>
                                            </div>
                                            <div class="custom-control custom-checkbox mb-3">
                                                <label  for="brandThree">
                                                    James Walker
                                                </label>
                                            </div>
                                            <div class="custom-control custom-checkbox mb-3">
                                                <label  for="brandFour">
                                                    Adidas
                                                </label>
                                            </div>
                                            <div class="custom-control custom-checkbox mb-3">
                                                <label  for="brandFive">
                                                    Forever21
                                                </label>
                                            </div>
                                            <div class="custom-control custom-checkbox mb-3">
                                                <label  for="brandSix">
                                                    H&M
                                                </label>
                                            </div>
                                            <div class="custom-control custom-checkbox mb-3">
                                                <label  for="brandSeven">
                                                    Calvin-Klien
                                                </label>
                                            </div>
                                            <div class="custom-control custom-checkbox mb-3">
                                                <label  for="brandEight">
                                                    Only
                                                </label>
                                            </div>
                                            <div class="custom-control custom-checkbox">
                                                <label  for="brandNine">
                                                    Zara
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item">
                            <!-- Toggle -->
                            <a class="nav-link dropdown-toggle font-size-lg text-reset border-bottom mb-6" data-toggle="collapse" href="#priceCollapse">
                                Price
                            </a>
                            <!-- Collapse -->
                            <div class="collapse" id="priceCollapse" data-toggle="simplebar" data-target="#priceGroup">
                                <!-- Form group-->
                                <div class="form-group form-group-overflow mb-6" id="priceGroup">
                                    <div class="custom-control custom-checkbox mb-3">
                                        <input class="custom-control-input" id="priceOne" type="checkbox" checked>
                                        <label  for="priceOne">
                                            0-499
                                        </label>
                                    </div>
                                    <div class="custom-control custom-checkbox mb-3">
                                        <input class="custom-control-input" id="priceTwo" type="checkbox" checked>
                                        <label  for="priceTwo">
                                            499-999
                                        </label>
                                    </div>
                                    <div class="custom-control custom-checkbox mb-3">
                                        <input class="custom-control-input" id="priceThree" type="checkbox">
                                        <label  for="priceThree">
                                            999-1999
                                        </label>
                                    </div>
                                    <div class="custom-control custom-checkbox">
                                        <input class="custom-control-input" id="priceFour" type="checkbox">
                                        <label  for="priceFour">
                                            1999 and above
                                        </label>
                                    </div>
                                </div>
                                <!-- Range -->
                                <!-- <div class="d-flex align-items-center">
                                    <input type="number" class="form-control form-control-xs" placeholder="499" min="10">
                                    <div class="text-gray-350 mx-2">to</div>
                                    Input 
                                    <input type="number" class="form-control form-control-xs" placeholder="999" max="350">
                                </div> -->
                            </div>
                        </li>
                    </ul>
                </form>
            </div>
            <div class="col-12 col-md-8 col-lg-9">
                <!-- Slider -->
                <div class="flickity-page-dots-inner mb-9" data-flickity='{"pageDots": true}'>
                    <!-- Item -->
                    <div class="w-100">
                        <div class="card bg-h-100 bg-left" style="background-image: url(assets/img/covers/cover-24.jpg);">
                            <div class="row" style="min-height: 400px;">
                                <div class="col-12 col-md-10 col-lg-8 col-xl-6 align-self-center">
                                    <div class="card-body px-md-10 py-11">
                                        <!-- Heading -->
                                        <h4>
                                            2021 Collection
                                        </h4>
                                        <!-- Button -->
                                        <a class="btn btn-link px-0 text-body" href="shop.aspx">
                                            View Collection <i class="fe fe-arrow-right ml-2"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-12 col-md-2 col-lg-4 col-xl-6 d-none d-md-block bg-cover" style="background-image: url(assets/img/covers/cover-16.jpg);"></div>
                            </div>
                        </div>
                    </div>

                    <!-- Item -->
                    <div class="w-100">
                        <div class="card bg-cover" style="background-image: url(assets/img/covers/cover-29.jpg)">
                            <div class="row align-items-center" style="min-height: 400px;">
                                <div class="col-12 col-md-10 col-lg-8 col-xl-6">
                                    <div class="card-body px-md-10 py-11">
                                        <!-- Heading -->
                                        <h4 class="mb-5">Get -50% from Our Exclusive Collection</h4>
                                        <!-- Text -->
                                        <p class="mb-7">
                                            The Ultimate Denim Store.
                                            <!--Appear, dry there darkness they're seas.--> <br>
                                            <strong class="text-primary">Use code 4GF5SD</strong>
                                        </p>
                                        <!-- Button -->
                                        <a class="btn btn-outline-dark" href="shop.aspx">
                                            Shop Now <i class="fe fe-arrow-right ml-2"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Item -->
                    <div class="w-100">
                        <div class="card bg-cover" style="background-image: url(assets/img/covers/cover-30.jpg);">
                            <div class="row align-items-center" style="min-height: 400px;">
                                <div class="col-12">
                                    <div class="card-body px-md-10 py-11 text-center text-white">
                                        <!-- Preheading -->
                                        <p class="text-uppercase">Enjoy an extra</p>
                                        <!-- Heading -->
                                        <h1 class="display-4 text-uppercase">50% off</h1>
                                        <!-- Link -->
                                        <a class="link-underline text-reset" href="shop.aspx">Shop Collection</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Header -->
                <div class="row align-items-center mb-7">
                    <div class="col-12 col-md">
                        <!-- Heading -->
                        <h3 class="mb-1">Clothing</h3>
                        <!-- Breadcrumb -->
                        <ol class="breadcrumb mb-md-0 font-size-xs text-gray-400">
                            <li class="breadcrumb-item">
                                <a class="text-gray-400" href="index.aspx">Home</a>
                            </li>
                            <li class="breadcrumb-item active">
                                Clothing
                            </li>
                        </ol>
                    </div>
                    <div class="col-12 col-md-auto">
                        <!-- Select -->
                        <select class="custom-select custom-select-xs">
                            <option selected>Most popular</option>
                        </select>
                    </div>
                </div>
                <!-- Tags -->
                <!--<div class="row mb-7">
                    <div class="col-12">
                        <span class="btn btn-xs btn-light font-weight-normal text-muted mr-3 mb-3">
                            Shift dresses <a class="text-reset ml-2" href="#!" role="button">
                                <i class="fe fe-x"></i>
                            </a>
                        </span>
                        <span class="btn btn-xs btn-light font-weight-normal text-muted mr-3 mb-3">
                            Summer <a class="text-reset ml-2" href="#!" role="button">
                                <i class="fe fe-x"></i>
                            </a>
                        </span>
                        <span class="btn btn-xs btn-light font-weight-normal text-muted mr-3 mb-3">
                            M <a class="text-reset ml-2" href="#!" role="button">
                                <i class="fe fe-x"></i>
                            </a>
                        </span>
                        <span class="btn btn-xs btn-light font-weight-normal text-muted mr-3 mb-3">
                            White <a class="text-reset ml-2" href="#!" role="button">
                                <i class="fe fe-x"></i>
                            </a>
                        </span>
                        <span class="btn btn-xs btn-light font-weight-normal text-muted mr-3 mb-3">
                            Red <a class="text-reset ml-2" href="#!" role="button">
                                <i class="fe fe-x"></i>
                            </a>
                        </span>
                        <span class="btn btn-xs btn-light font-weight-normal text-muted mr-3 mb-3">
                            Adidas <a class="text-reset ml-2" href="#!" role="button">
                                <i class="fe fe-x"></i>
                            </a>
                        </span>
                        <span class="btn btn-xs btn-light font-weight-normal text-muted mr-3 mb-3">
                            $10.00 - $49.00 <a class="text-reset ml-2" href="#!" role="button">
                                <i class="fe fe-x"></i>
                            </a>
                        </span>
                        <span class="btn btn-xs btn-light font-weight-normal text-muted mr-3 mb-3">
                            $50.00 - $99.00 <a class="text-reset ml-2" href="#!" role="button">
                                <i class="fe fe-x"></i>
                            </a>
                        </span>
                    </div>
                </div>-->
                <!-- Products -->
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
      
          
                           
                        </div>
                    </div>
                  
                </div>  
   <!--       <nav class="d-flex justify-content-center justify-content-md-end">
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
            
   --></div>
        </div>
    </div>
</section>


</asp:Content>
