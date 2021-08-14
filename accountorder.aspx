
<%@ Page Language="C#" AutoEventWireup="true"MasterPageFile="~/Site.Master" CodeBehind="accountorder.aspx.cs" Inherits="wholesale.accountorder" %>


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
                        <a class="list-group-item list-group-item-action dropright-toggle active" href="AccountOrders.aspx">
                            Orders
                        </a>
                        <a class="list-group-item list-group-item-action dropright-toggle" href="WishList.aspx">
                            Wishlist
                        </a>
                        <a class="list-group-item list-group-item-action dropright-toggle" href="PersonalInfo.aspx">
                            Personal Info
                        </a>
                    </div>
                </nav>
            </div>
            <div class="col-12 col-md-9 col-lg-8 offset-lg-1">
                
                <div class="card card-lg mb-5 border">
                   
                    <div class="card-body pb-0">
                        
                        <div class="card card-sm">
                            <div class="card-body bg-light">
                                <div class="row">
                                     <asp:Repeater Id="rptr" runat="server" >
                                        <ItemTemplate>
                                    <div class="col-6 col-lg-3">
                                        <!-- Heading -->
                                        <h6 class="heading-xxxs text-muted">Order No:</h6>
                                        <!-- Text -->
                                        <p class="mb-lg-0 font-size-sm font-weight-bold">
                                             <%# Eval ("Id") %> 
                                        </p>
                                    </div>
                                    <div class="col-6 col-lg-3">
                                        <!-- Heading -->
                                        <h6 class="heading-xxxs text-muted">Shipped date:</h6>
                                        <!-- Text -->
                                        <p class="mb-lg-0 font-size-sm font-weight-bold">
                                            <time datetime="2019-10-01">
                                                 <%# Eval ("odate", "{0:dd/MM/yyyy}") %>
                                            </time>
                                        </p>
                                    </div>
                                    <div class="col-6 col-lg-3">
                                        <!-- Heading -->
                                        <h6 class="heading-xxxs text-muted">Status:</h6>
                                        <!-- Text -->
                                        <p class="mb-0 font-size-sm font-weight-bold">
                                             <%# Eval ("shipstatus") %> 
                                        </p>
                                    </div>
                                    <div class="col-6 col-lg-3">
                                        <!-- Heading -->
                                        <h6 class="heading-xxxs text-muted">Order Amount:</h6>
                                        <!-- Text -->
                                        <p class="mb-0 font-size-sm font-weight-bold">
                                              <%# Eval ("grandtotal") %> Rs
                                        </p>
                                    </div>
                                </ItemTemplate></asp:Repeater>  </div>
                            </div>
                            
                        
                    </div>
                    </div>
                  
                    <div class="card-footer">
                        <!-- Heading -->
                        <h6 class="mb-7">Order Items</h6>
                        <!-- Divider -->
                        <hr class="my-5">
                            
           
                        <ul class="list-group list-group-lg list-group-flush-y list-group-flush-x">
                             <asp:Repeater Id="Repeater2" runat="server" >
                                        <ItemTemplate>
                            <li class="list-group-item">
                                <div class="row align-items-center">
                                    <div class="col-4 col-md-3 col-xl-2">
                                        <!-- Image -->
                                        <a><img src="/Products/<%# Eval("ProID") %>/<%# Eval("Name") %><%# Eval("Extension") %>" alt="..." class="img-fluid"></a>
                                    </div>
                                    <div class="col">
                                        <!-- Title -->
                                        <p class="mb-4 font-size-sm font-weight-bold">
                                            <a class="text-body" href="viewproduct.aspx"><%# Eval("pname") %></a> <br>
                                            <span class="text-muted">Rs.<%# Eval("sellingprice") %></span>
                                        </p>
                                        <!-- Text -->
                                        <div class="font-size-sm text-muted">
                                          Size : <%# Eval("size") %> <br>
                                            Color:<%# Eval("color") %>
                                        </div>
                                            <p class="text-body"> Quantity:<%# Eval("quantity") %></p>

                                    </div>
                                </div>
                            </li>
                          
                       </ItemTemplate>
                                 </asp:Repeater>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
              <asp:Repeater Id="Repeater1" runat="server" >
                                        <ItemTemplate>
                <div class="card card-lg mb-5 border">
                    <div class="card-body">

                        <!-- Heading -->
                        <h6 class="mb-7">Order Total</h6>
                   
                        <ul class="list-group list-group-sm list-group-flush-y list-group-flush-x">
                            <li class="list-group-item d-flex">
                                <span>Subtotal</span>
                                <span class="ml-auto">Rs.  <%# Eval ("total") %></span>
                            </li>
                            <li class="list-group-item d-flex">
                                <span>Tax</span>
                                <span class="ml-auto"> <%# Eval ("tax") %> Rs  (5 %)</span>
                            </li>
                            <li class="list-group-item d-flex">
                                <span>Shipping</span>
                                <span class="ml-auto"> Rs. <%# Eval ("shippcharge") %></span>
                            </li>
                            <li class="list-group-item d-flex font-size-lg font-weight-bold">
                                <span>Total</span>
                                <span class="ml-auto"> Rs. <%# Eval ("grandtotal") %></span>
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
                                   <%# Eval ("ad1") %>, <br>
                                   <%# Eval ("ad2") %>, <br>
                                   <%# Eval ("city") %> ,<br>
                                     <%# Eval ("zip") %> 
                                </p>
                            </div>
                            <div class="col-12 col-md-4">
                                <!-- Heading -->
                                <p class="mb-4 font-weight-bold">
                                    Shipping Address:
                                </p>
                                <p class="mb-7 mb-md-0 text-gray-500">
                                     <%# Eval ("ad1") %>, <br>
                                   <%# Eval ("ad2") %>, <br>
                                   <%# Eval ("city") %> ,<br>
                                     <%# Eval ("zip") %>
                                </p>
                            </div>
                            <div class="col-12 col-md-4">
                                <!-- Heading -->
                               <p class="mb-4 font-weight-bold">
                                    Payment Method :
                                </p>
                                <p class="mb-0 text-gray-500">
                                    <%# Eval ("paymode") %>
                                </p>
                                <!-- Heading -->
                                <p class="mb-4 font-weight-bold">
                                    Payment Status :
                                </p>
                                <p class="mb-0 text-gray-500">
                                    <%# Eval ("paystatus") %>
                                </p>
                            </div>
                        </div>
                    </div>
                      
                </div>
                                             </ItemTemplate></asp:Repeater>
            </div>
        </div>
    </div>
</section>

    </asp:Content>