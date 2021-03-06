<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/adminmaster.Master"  CodeFile="dashboard.aspx.cs" Inherits="wholesale.Dashboard" %>
<asp:Content ID="content1" ContentPlaceHolderID="admincontent" runat="server">  
  <div class="content-page">
                <div class="content">
               </div>     
                    
<div class="content">

                                     
     <div class="row">
        <div class="col-12">
            <div class="page-title-box">
                <div class="page-title-right">
                        <div class="form-group">
                            <div class="input-group">
                                <input type="text" class="form-control form-control-light" id="dash-daterange">
                                <div class="input-group-append">
                                    <span class="input-group-text bg-primary border-primary text-white">
                                        <i class="mdi mdi-calendar-range font-13"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                       
                </div>
                <h4 class="page-title">Dashboard</h4>
            </div>
        </div>
    </div>
    
<div class="row">
     <div class="col-xl-3 col-lg-4">
        <div class="card overflow-hidden" style="background-color:white;color:midnightblue">
            <div class="card-body">
                <div class="float-right">

                    <asp:HyperLink type="button" class="btn btn-sm btn-light" runat="server" NavigateUrl="~/admin/productlist.aspx">View</asp:HyperLink>
                </div>
                <h5 class="text-uppercase mt-0" title="Inventory Summary">Inventory Summary</h5>
                <div id="spark1" class="apex-charts mb-3" data-colors="#734CEA">
                                  <h2><i class="dripicons-basket"></i>  <asp:Label ID="lblprod" runat="server" ToolTip=" Total Products in Stock"></asp:Label></h2><h5 style="color:darkblue">Products</h5>

                </div>

                <div class="row text-center">
                    
                    <div class="col-12">
                        <h5 class="text-success d-block">Manufactured Products in Month</h5>
                        <p class="font-18 mb-0 text-danger"> <asp:Label ID="Label1" runat="server"></asp:Label></p>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- end col-->
  
     <div class="col-xl-3 col-lg-4">
        <div class="card overflow-hidden" style="background-color:white;color:midnightblue">
            <div class="card-body">
                <div class="float-right">

                    <asp:HyperLink type="button" class="btn btn-sm btn-light" runat="server" NavigateUrl="~/admin/salesorder.aspx">View</asp:HyperLink>
                </div>
                <h5 class="text-uppercase mt-0" title="Sales Summary">Sales Summary</h5>
                <div id="spark1" class="apex-charts mb-3" data-colors="#734CEA">
                                  <h2><i class=" uil-tag-alt"></i>  <asp:Label ID="lblsale" runat="server" ToolTip=" Total Orders"></asp:Label></h2><h5 style="color:darkblue">Orders</h5>

                </div>

                <div class="row text-center">
                    
                    <div class="col-12">
                        <h5 class="text-success d-block">Total Sales in Current Month</h5>
                        <p class="font-18 mb-0 text-danger"> <asp:Label ID="label2" runat="server"></asp:Label></p>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- end col-->
  
   <!-- end col-->
   <div class="col-xl-3 col-lg-4">
        <div class="card overflow-hidden" style="background-color:white;color:midnightblue">
            <div class="card-body">
                <div class="float-right">

                    <asp:HyperLink type="button" class="btn btn-sm btn-light" runat="server" NavigateUrl="~/admin/salesorder.aspx">View</asp:HyperLink>
                </div>
                <h5 class="text-uppercase mt-0" title="Sales Summary">Expense Summary</h5>
                <div id="spark1" class="apex-charts mb-3" data-colors="#734CEA">
                                  <h3><i class="dripicons-wallet"></i>  <asp:Label ID="Label3" runat="server" ToolTip=" Total Orders"></asp:Label></h3><h5 style="color:darkblue">Total Expense</h5>

                </div>

              <div class="row text-left">
                    <div class="col-6">
                        <h5 class="text-success d-block">Employee Salary</h5>
                        <p class="font-18 mb-0 text-danger"><asp:Label ID="Label4" runat="server" ></asp:Label></p>
                    </div>
                    <div class="col-6">
                        <h5 class="text-success d-block">Expense</h5>
                        <p class="font-18 mb-0 text-danger"><asp:Label ID="Label5" runat="server"></asp:Label></p>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- end col-->
  
  </div>


    
<div class="row mb-1">
     <div class="col-xl-3 col-lg-6">
        <div class="card overflow-hidden" style="background-color:white;color:midnightblue">
            <div class="card-body">
                <div class="float-right">

                    <asp:HyperLink type="button" class="btn btn-sm btn-light" runat="server" NavigateUrl="~/admin/ReceivedOrder.aspx">View</asp:HyperLink>
                </div>
                <h5 class="text-uppercase mt-0" title="Online Orders">Purchase Orders</h5>
                <div id="spark1" class="apex-charts mb-3" data-colors="#734CEA">
                                  <h2><i class=" uil-shopping-trolley"></i>   <asp:Label ID="porder" runat="server" ToolTip="No of Orders"></asp:Label></h2>
                    <h5 style="color:darkblue">Orders</h5>
                </div>

                <div class="row text-center">
                    
                    <div class="col-6">
                        <h5 class=" d-block">Pending Orders</h5>
                        <p class="font-18 mb-0 text-danger"><asp:Label ID="pending" runat="server" ></asp:Label></p>
                    </div>
                    <div class="col-6">
                        <h5 class=" d-block">Due Amount</h5>
                        <p class="font-18 mb-0 text-danger"><asp:Label ID="due" runat="server"></asp:Label></p>
                    </div>
                       
                </div>
            </div>
        </div>
    </div> <!-- end col-->
    <div class="col-xl-3 col-lg-6">
        <div class="card overflow-hidden" style="background-color:white;color:midnightblue">
            <div class="card-body">
                <div class="float-right">

                    <asp:HyperLink type="button" class="btn btn-sm btn-light" runat="server" NavigateUrl="~/admin/onlineorder.aspx">View</asp:HyperLink>
                </div>
                <h5 class="text-uppercase mt-0" title="Online Orders">Online Orders</h5>
                <div id="spark1" class="apex-charts mb-3" data-colors="#734CEA">
                                  <h2><i class="  uil-cart"></i> <asp:Label ID="orders" runat="server" ToolTip="No of Orders"></asp:Label></h2>
                     <h5 style="color:darkblue">Revenue INR</h5>
                    <h4 style="color:darkblue"><asp:Label ID="onliners" runat="server" ToolTip="Total Rs"></asp:Label></h4>

                </div>

                <div class="row text-center">
                    
                    <div class="col-4">
                        <h5 class=" d-block">Pending</h5>
                        <p class="font-18 mb-0 text-danger"><asp:Label ID="placed" runat="server" ></asp:Label></p>
                    </div>
                    <div class="col-4">
                        <h5 class=" d-block">Shipped</h5>
                        <p class="font-18 mb-0 text-danger"><asp:Label ID="shipped" runat="server"></asp:Label></p>
                    </div>
                       <div class="col-4">
                        <h5 class=" d-block">Delivered</h5>
                        <p class="font-18 mb-0 text-danger"><asp:Label ID="delivered" runat="server"></asp:Label></p>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- end col-->
    </div>
<!-- end row-->
    <div class="row mb-1">
        <div class="col-xl-4 col-lg-6">
           <div class="card">
            <div class="card-body">
                <h4 class="header-title mb-3">Product Stock</h4>

                <div class="table-responsive">
                    <table class="table table-hover table-centered mb-0">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Products</th>
                                <th>Stock</th>
                                <th>Reorder level</th>

                            </tr>
                        </thead>
                        <tbody>
                             
                            
                                 <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <tr>
                                <td><%# Eval("pcode") %></td>
                                <td><%# Eval("pname") %></td>
                                <td><%# Eval("quantity") %></td>
                                <td><%# Eval("minlevel") %></td>
                                 </tr>
                            </Itemtemplate>
                                  </asp:Repeater>
                           
                            
                          
                        </tbody>
                    </table>
                </div> <!-- end table responsive-->
            </div> <!-- end col-->
        </div> <!-- end row--></div>
        <div class="col-xl-4 col-lg-6">
       <div class="card">
            <div class="card-body">
                <h4 class="header-title mb-3">Recent Orders</h4>

                <div class="table-responsive">
                    <table class="table table-hover table-centered mb-0">
                        <thead>
                            <tr>
                                <th>Invoice No</th>
                                <th>Customer</th>
                                <th>Total amount</th>
                                <th>Status</th>

                            </tr>
                        </thead>
                        <tbody>
                             
                            
                                 <asp:Repeater ID="rptr" runat="server">
                <ItemTemplate>
                    <tr>
                                <td><%# Eval("orderno") %></td>
                                <td><%# Eval("cname") %></td>
                                <td><%# Eval("grand") %> Rs</td>
                                <td><%# Eval("status") %></td>
                                 </tr>
                            </Itemtemplate>
                                  </asp:Repeater>
                           
                            
                          
                        </tbody>
                    </table>
                </div> <!-- end table responsive-->
            </div> <!-- end col-->
        </div> <!-- end row-->
            </div></div>
        </div>
        </asp:Content>