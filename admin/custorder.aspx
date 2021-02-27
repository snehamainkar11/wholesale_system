<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/adminmaster.Master"  CodeFile="custorder.aspx.cs" Inherits="wholesale.admin.custorder" %>

<asp:Content ID="content1" ContentPlaceHolderID="admincontent" runat="server">  
  <div class="content-page">
                <div class="content">
                    

<!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box">
            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Order</a></li>
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Sales</a></li>
                    <li class="breadcrumb-item active">Order Details</li>
                </ol>
            </div>
            <h4 class="page-title">Order Details</h4>
        </div>
    </div>
</div>
<!-- end page title -->

<div class="row justify-content-center">
    <div class="col-lg-7 col-md-10 col-sm-11">

        <div class="horizontal-steps mt-4 mb-4 pb-5">
            <div class="horizontal-steps-content">
                <div class="step-item">
                    <span data-toggle="tooltip" data-placement="bottom" title="" data-original-title="20/08/2018 07:24 PM">Order Placed</span>
                </div>
                <div class="step-item current">
                    <span data-toggle="tooltip" data-placement="bottom" title="" data-original-title="21/08/2018 11:32 AM">Packed</span>
                </div>
                <div class="step-item">
                    <span>Shipped</span>
                </div>
                <div class="step-item">
                    <span>Delivered</span>
                </div>
            </div>

            <div class="process-line" style="width: 33%;"></div>
        </div>

    </div>
</div>
<!-- end row -->


<div class="row">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-body">
                                        <button type="button"  style="float:right" class="btn btn-outline-info btn-rounded"><i class=" dripicons-document-remove"></i> Generate Invoive</button>

                 <table class="table mb-0">
                        <thead>
                            <tr>
                                <th>Customer Name</th>
                                <th>Invoice Number</th>
                                <th>Ordered Date</th>
                                <th>Delivery Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>The Military Duffle Bag</td>
                                <td>56745</td>
                                <td>12-4-2020</td>
                                <td>14-4-2020</td>
                            </tr>
              </table>

            </div>
        </div>
    </div> <!-- end col -->
<div class="row">
    <div class="col-lg-7">
        <div class="card">
            <div class="card-body">
                <h4 class="header-title mb-2">Items from Order #12537</h4>

                <div class="table-responsive">
                    <table class="table mb-0">
                        <thead class="thead-light">
                            <tr>
                                <th>Item</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>The Military Duffle Bag</td>
                                <td>3</td>
                                <td>128 Rs</td>
                                <td>384 Rs</td>
                            </tr>
                            <tr>
                                <td>Mountain Basket Ball</td>
                                <td>1</td>
                                <td>199 Rs</td>
                                <td>199 Rs</td>
                            </tr>
                            <tr>
                                <td>Wavex Canvas Messenger Bag</td>
                                <td>5</td>
                                <td>180 Rs</td>
                                <td>900 Rs</td>
                            </tr>
                            <tr>
                                <td>The Utility Shirt</td>
                                <td>2</td>
                                <td>79 Rs</td>
                                <td>158 Rs</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- end table-responsive -->

            </div>
        </div>
    </div> <!-- end col -->

    <div class="col-lg-5">
        <div class="card">
            <div class="card-body">
                <h4 class="header-title mb-3">Order Summary</h4>

                <div class="table-responsive">
                    <table class="table mb-0">
                        <thead class="thead-light">
                            <tr>
                                <th>Description</th>
                                <th>Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Grand Total :</td>
                                <td>1641 Rs</td>
                            </tr>
                            <tr>
                                <td>Shipping Charge :</td>
                                <td>23 Rs</td>
                            </tr>
                            <tr>
                                <td>Estimated Tax : </td>
                                <td>19.22 Rs</td>
                            </tr>
                            <tr>
                                <th>Total :</th>
                                <th>1683.22 RS</th>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- end table-responsive -->

            </div>
        </div>
    </div> <!-- end col -->
</div>
<!-- end row -->


<div class="row">
    <div class="col-lg-4">
        <div class="card">
            <div class="card-body">
                <h4 class="header-title mb-3">Shipping Information</h4>

                <h5>Stanley Jones</h5>

                <address class="mb-0 font-14 address-lg">
                    795 Folsom Ave, Suite 600<br>
                    San Francisco, CA 94107<br>
                    <abbr title="Phone">P:</abbr> (123) 456-7890 <br />
                    <abbr title="Mobile">M:</abbr> (+01) 12345 67890
                </address>

            </div>
        </div>
    </div> <!-- end col -->

    <div class="col-lg-4">
        <div class="card">
            <div class="card-body">
                <h4 class="header-title mb-3">Billing Information</h4>

                <ul class="list-unstyled mb-0">
                    <li>
                        <p class="mb-2"><span class="font-weight-bold mr-2">Payment Type:</span> Credit Card</p>
                        <p class="mb-2"><span class="font-weight-bold mr-2">Provider:</span> Visa ending in 2851</p>
                        <p class="mb-2"><span class="font-weight-bold mr-2">Valid Date:</span> 02/2020</p>
                        <p class="mb-0"><span class="font-weight-bold mr-2">CVV:</span> xxx</p>
                    </li>
                </ul>

            </div>
        </div>
    </div> <!-- end col -->

    <div class="col-lg-4">
        <div class="card">
            <div class="card-body">
                <h4 class="header-title mb-3">Delivery Info</h4>

                <div class="text-center">
                    <i class="mdi mdi-truck-fast h2 text-muted"></i>
                    <h5><b>UPS Delivery</b></h5>
                    <p class="mb-1"><b>Order ID :</b> xxxx235</p>
                    <p class="mb-0"><b>Payment Mode :</b> COD</p>
                </div>
            </div>
        </div>
    </div> <!-- end col -->
</div>
<!-- end row -->


</asp:Content>

<asp:Content ID="content2" ContentPlaceHolderID="footer" runat="server">  
<script src="admin-assets/js/vendor/buttons.print.min.js"></script>
    </asp:Content>