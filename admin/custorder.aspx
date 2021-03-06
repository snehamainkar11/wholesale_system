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

<!-- end row -->


<div class="row">
 <div class="col-12">
        <div class="card">
            <div class="card-body">

                       
                             <div class="clearfix">
                   
                    <div class="float-left">
                        <h3>Invoice</h3>
                    </div>
 </div>
                      <hr />
                    
                    
    
                        
<div class="row">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-body">
                
                        <asp:Repeater runat="server" ID="rptr">
                    <ItemTemplate>
                    <div class="row">

                    <div class="col-sm-6">
              <div class="float-left mt-1">
                            <h4 style= "color:darkred">Billing From:</h4>
                            <h4><b style= "color:indianred">
                   <asp:Label Text="Waheguru Creations" runat="server" ID="cnameLabel" /></b></h4>
                     <h5>  address 1</h5>
                        <h5>City1,opp to avs,ahhsn road
                           Maharashtra</h5>
                             <h5>     Pincode :416602</h5>
                                    <h5>Contact No:738388444</h5>
                              </div>     

            </div>
                    
                    
              <div class="col-sm-4 offset-sm-2">
                        <div class="mt-3 float-sm-right">
                                            <h5><%# Eval("fname") %> &nbsp;&nbsp;<%# Eval("lname") %></h5>

                            <p class="font-16"><strong>Date: </strong> &nbsp;&nbsp;&nbsp; <asp:Label Text='<%# Eval("odate") %>' runat="server" ID="pdateLabel" /></p>
                  
                            <p class="font-16"><strong>Invoice No: </strong> <span class="float-center">Inv000<%# Eval("Id") %></span></p>
                        </div>
                    </div>
      </div>
    </div> <!-- end col -->
            <hr />
  </div>
                        


                           
<div class="row mb-0">  
    <div class="col-lg-6">
        <div class="card">
            <div class="card-body">
                <h4 class="header-title mb-2">Items from Order #<%# Eval("orderno") %></h4>

                <div class="table-responsive">
                         <asp:GridView runat="server" ID="gv" class="table table-bordered table-centered table-hover mb-0"
                                    AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Horizontal" ForeColor="Black">
                                    <Columns>
                                        <asp:BoundField DataField="pid" HeaderText="Items" SortExpression="pid"></asp:BoundField>
                                        <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price"></asp:BoundField>
                                        <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity"></asp:BoundField>
                                        <asp:BoundField DataField="total" HeaderText="Total" SortExpression="total"></asp:BoundField>
                                    </Columns>
                             <FooterStyle BackColor="#CCCC99" ForeColor="Black"></FooterStyle>

                             <HeaderStyle BackColor="Lavender" Font-Bold="True" ForeColor="Black"></HeaderStyle>

                             <PagerStyle HorizontalAlign="Right" BackColor="White" ForeColor="Black"></PagerStyle>

                             <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                             <SortedAscendingCellStyle BackColor="#F7F7F7"></SortedAscendingCellStyle>

                             <SortedAscendingHeaderStyle BackColor="#4B4B4B"></SortedAscendingHeaderStyle>

                             <SortedDescendingCellStyle BackColor="#E5E5E5"></SortedDescendingCellStyle>

                             <SortedDescendingHeaderStyle BackColor="#242121"></SortedDescendingHeaderStyle>
                         </asp:GridView>

                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:wholesaleConnectionString %>' SelectCommand="SELECT [pid], [price], [quantity], (price* quantity) as[total] FROM [custorderDet] WHERE ([orderno] = @orderno)">
                            <SelectParameters>
                                <asp:QueryStringParameter QueryStringField="orderno" Name="orderno" Type="String"></asp:QueryStringParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                </div>
                <!-- end table-responsive -->

            </div>
        </div>
    </div> <!-- end col -->
     
    <div class="col-lg-6">
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
                                <td><%# Eval("total") %> Rs</td>
                            </tr>
                            <tr>
                                <td>Shipping Charge :</td>
                                <td><%# Eval("shippcharge") %> Rs</td>
                            </tr>
                            <tr>
                                <td>Estimated Tax : </td>
                                <td><%# Eval("tax") %> Rs</td>
                            </tr>
                            <tr>
                                <th>Total :</th>
                                <th><%# Eval("grandtotal") %> Rs</th>
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
                <h4 class="header-title mb-3" style="text-decoration:underline">Shipping Information</h4>

                <h5><%# Eval("fname") %> &nbsp;&nbsp;<%# Eval("lname") %></h5>

                <address class="mb-0 font-14 address-lg">
                    <%# Eval("ad1") %><br/>
                   <%# Eval("ad2") %> &nbsp;&nbsp;<%# Eval("city") %><br/>
                    <abbr title="Zip">Zip:</abbr> <%# Eval("zip") %> <br />
                    <abbr title="Mobile">M:</abbr> <%# Eval("contact") %> 
                </address>

            </div>
        </div>
    </div> <!-- end col -->

    <div class="col-lg-4">
        <div class="card">
            <div class="card-body">
                <h4 class="header-title mb-3" style="text-decoration:underline">Billing Information</h4>

                <ul class="list-unstyled mb-0">
                    <li>
                        <p class="mb-2"><span class="font-weight-bold mr-2">Payment Type:</span><%# Eval("paymode") %></p>
                        <p class="mb-2"><span class="font-weight-bold mr-2">Status:</span> <%# Eval("paystatus") %></p>
                        <p class="mb-2"><span class="font-weight-bold mr-2">Payment Date:</span><%# Eval("odate") %></p>
                    </li>
                </ul>

            </div>
        </div>
    </div> <!-- end col -->

    <div class="col-lg-4">
        <div class="card">
            <div class="card-body">
                <h4 class="header-title mb-3" style="text-decoration:underline">Delivery Info</h4>

                <div class="text-center">
                    <i class="mdi mdi-truck-fast h2 text-muted"></i>
                    <h5><b>UPS Delivery</b></h5>
                    <p class="mb-1"><b>Order ID :</b><%# Eval("id") %></p>
                    <p class="mb-0"><b>Shipping Status :</b><%# Eval("shipstatus") %></p>
                </div>
            </div>
        </div>
    </div> <!-- end col -->
                      <div class="mt-2 float-sm-right">      <p class="mb-0"><span class="font-weight-bold mr-2">Note:</span> <%# Eval("note") %></p>
</div>
      </ItemTemplate>
                               </asp:Repeater> </div>     
                   <div class="d-print-none mt-4">
                   
                        <a href="javascript:window.print()" class="btn btn-primary"><i class="mdi mdi-printer"></i> Print</a>
                      
                        
       
</div>
<!-- end row -->
            </div></div></div></div></div>

</asp:Content>
