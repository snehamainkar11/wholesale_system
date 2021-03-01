<%@ Page Language="C#" AutoEventWireup="true"   MasterPageFile="~/Site.Master"  CodeFile="wishlist.aspx.cs" Inherits="wholesale.wishlist" %>

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
                        <a class="list-group-item list-group-item-action dropright-toggle" href="cart.aspx">
                            Orders
                        </a>
                        <a class="list-group-item list-group-item-action dropright-toggle active" href="WishList.aspx">
                            Wishlist
                        </a>
                        <a class="list-group-item list-group-item-action dropright-toggle" href="profile.aspx">
                            Personal Info
                        </a>
                    </div>
                </nav>
            </div>
            <div class="col-12 col-md-9 col-lg-8 offset-lg-1">
                <!-- Products -->
                <div class="row">
                    <!-- Item -->
                    <div class="col-6 col-md-4">
                        <div class="card mb-7">
                            <!-- Image -->
                            <div class="card-img">
                                <!-- Action -->
                                <button class="btn btn-xs btn-circle btn-white-primary card-action card-action-right">
                                    <i class="fe fe-x"></i>
                                </button>
                                <!-- Button -->
                                <button class="btn btn-xs btn-block btn-dark card-btn" data-toggle="modal" data-target="#modalProduct">
                                    <i class="fe fe-eye mr-2 mb-1"></i> Quick View
                                </button>
                                <!-- Image -->
                                <img class="card-img-top" src="../assets/img/products/product-6.jpg" alt="...">
                            </div>
                            <!-- Body -->
                            <div class="card-body font-weight-bold text-center">
                                <a class="text-body" href="product.html">Joggers</a> <br>
                                <span class="text-muted">Rs.799</span>
                            </div>
                        </div>
                    </div>
                    <!-- Item -->
                    <div class="col-6 col-md-4">
                        <div class="card mb-7">
                            <!-- Image -->
                            <div class="card-img">
                                <!-- Action -->
                                <button class="btn btn-xs btn-circle btn-white-primary card-action card-action-right">
                                    <i class="fe fe-x"></i>
                                </button>
                                <!-- Badge -->
                                <span class="badge badge-dark card-badge card-badge-left text-uppercase">
                                    Sale
                                </span>
                                <!-- Button -->
                                <button class="btn btn-xs btn-block btn-dark card-btn" data-toggle="modal" data-target="#modalProduct">
                                    <i class="fe fe-eye mr-2 mb-1"></i> Quick View
                                </button>
                                <!-- Image -->
                                <img class="card-img-top" src="../assets/img/products/product-10.jpg" alt="...">
                            </div>
                            <!-- Body -->
                            <div class="card-body font-weight-bold text-center">
                                <a class="text-body" href="product.html">Patches Funky</a> <br>
                                <span>
                                    <span class="font-size-xs text-gray-350 text-decoration-line-through">Rs.1,699</span>
                                    <span class="text-primary">Rs.1,599</span>
                                </span>
                            </div>
                        </div>
                    </div>
                    <!-- Item -->
                    <div class="col-6 col-md-4">
                        <div class="card mb-7">
                            <!-- Image -->
                            <div class="card-img">
                                <!-- Action -->
                                <button class="btn btn-xs btn-circle btn-white-primary card-action card-action-right">
                                    <i class="fe fe-x"></i>
                                </button>
                                <!-- Button -->
                                <button class="btn btn-xs btn-block btn-dark card-btn" data-toggle="modal" data-target="#modalProduct">
                                    <i class="fe fe-eye mr-2 mb-1"></i> Quick View
                                </button>
                                <!-- Image -->
                                <img class="card-img-top" src="../assets/img/products/product-32.jpg" alt="...">
                            </div>
                            <!-- Body -->
                            <div class="card-body font-weight-bold text-center">
                                <a class="text-reset" href="product.html">Printed Pants</a>
                                <span class="text-muted">Rs.899</span>
                            </div>
                        </div>
                    </div>
                    <!-- Item -->
                    <div class="col-6 col-md-4">
                        <div class="card mb-7">
                            <!-- Image -->
                            <div class="card-img">
                                <!-- Action -->
                                <button class="btn btn-xs btn-circle btn-white-primary card-action card-action-right">
                                    <i class="fe fe-x"></i>
                                </button>
                                <!-- Button -->
                                <button class="btn btn-xs btn-block btn-dark card-btn" data-toggle="modal" data-target="#modalProduct">
                                    <i class="fe fe-eye mr-2 mb-1"></i> Quick View
                                </button>
                                <!-- Image -->
                                <img class="card-img-top" src="../assets/img/products/product-7.jpg" alt="...">
                            </div>
                            <!-- Body -->
                            <div class="card-body font-weight-bold text-center">
                                <a class="text-body" href="product.html">Whisker Jeans</a> <br>
                                <a class="text-primary" href="#">Rs.899</a>
                            </div>
                        </div>
                    </div>
                    <!-- Item -->
                    <div class="col-6 col-md-4">
                        <div class="card mb-7">
                            <!-- Image -->
                            <div class="card-img">
                                <!-- Action -->
                                <button class="btn btn-xs btn-circle btn-white-primary card-action card-action-right">
                                    <i class="fe fe-x"></i>
                                </button>
                                <!-- Button -->
                                <button class="btn btn-xs btn-block btn-dark card-btn" data-toggle="modal" data-target="#modalProduct">
                                    <i class="fe fe-eye mr-2 mb-1"></i> Quick View
                                </button>
                                <!-- Image -->
                                <img class="card-img-top" src="../assets/img/products/product-11.jpg" alt="...">
                            </div>
                            <!-- Body -->
                            <div class="card-body font-weight-bold text-center">
                                <a class="text-body" href="product.html">Knee Cut</a> <br>
                                <span class="text-muted">Rs.1019</span>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Pagination -->
                <nav class="d-flex justify-content-center justify-content-md-end">
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
