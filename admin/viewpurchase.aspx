<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/adminmaster.Master" CodeBehind="viewpurchase.aspx.cs" Inherits="wholesale.admin.viewpurchase" %>

<asp:Content ID="content1" ContentPlaceHolderID="admincontent" runat="server"> 

    <div class="content-page">
                <div class="content">
                <div class="content">

                    
           
  <div class="row">
    <div class="col-12">
        <div class="page-title-box">
             <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Purchase</a></li>
                    <li class="breadcrumb-item active">View Order</li>
                        </ol>
            </div>
            <h4 class="page-title">View Purchase Invoice</h4>
        </div>
         
        </div>
     </div>
         
                   
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">

                  <asp:Panel ID="panel1" runat="server" >
                       
                             <div class="clearfix">
                   
                    <div class="float-left">
                        <h3>Purchase Invoice</h3>
                    </div>
 </div>
                      <hr /><asp:Repeater runat="server" ID="rptr">
                    <ItemTemplate>
                    
                    
    
                        
<div class="row">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-body">
                    <div class="row">

                    <div class="col-sm-6">
              <div class="float-left mt-1">
                            <h4 style= "color:darkred">Supplier Details:</h4>
                            <h4><b style= "color:indianred">
                   <asp:Label Text='<%# Eval("company") %>' runat="server" ID="cnameLabel" /></b></h4>
                     <h5>   <%# Eval("address") %></h5>
                        <h5>  <%# Eval("city") %>,
                           <%# Eval("state") %></h5>
                             <h5>     Pincode :<%# Eval("zip") %></h5>
                                    <h5>Contact No:<%# Eval("contact") %></h5>
                              </div>     

            </div>
              <div class="col-sm-4 offset-sm-2">
                        <div class="mt-3 float-sm-right">
                            <p class="font-16"><strong> Order Date: </strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label Text=' <%# Eval("pdate", "{0:dd/MM/yyyy}") %>' runat="server" ID="Label2" /></p>
                            <p class="font-16"><strong> Received Date: </strong> &nbsp;&nbsp; <asp:Label Text=' <%# Eval("rdate", "{0:dd/MM/yyyy}") %>' runat="server" ID="Label1" /></p>

                            <p class="font-16"><strong>Invoice No: </strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="float-center" style="font-weight:bold;"><%# Eval("invno") %></span></p>
                        </div>
                    </div>
      </div>
    </div> <!-- end col -->
            <hr />
  </div>
      
     <div class="row">
     <div class="col-sm-6 col-lg-10 ">



        <div class="card">
            <div class="card-body">

                <h4 class="header-title mb-2">Items from Order #<%# Eval("pid") %></h4>

                        <div class="table-responsive">
                            <table class="table mb-0">
                                <asp:GridView runat="server" ID="gv" class="table table-bordered table-centered table-hover mb-0"
                                    AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Horizontal" ForeColor="Black">
                                    <Columns>
                                        <asp:BoundField DataField="sno" HeaderText="Sr.No" SortExpression="sno">
                                            <ItemStyle Width="10%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="pro_id" HeaderText="Items" SortExpression="pro_id"></asp:BoundField>
                                        <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity">
                                                                                        <ItemStyle Width="15%" />
                                        </asp:BoundField>
                                          <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price">
                                                                                        <ItemStyle Width="15%" />
                                        </asp:BoundField>
                                          <asp:BoundField DataField="total" HeaderText="Total" SortExpression="total">
                                                                                        <ItemStyle Width="15%" />
                                        </asp:BoundField>
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
                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:wholesaleConnectionString %>' SelectCommand="SELECT Supplier.supid, Purchase.supid AS Expr1, Purchase.pid, PurDetails.p_id, Supplier.company, Supplier.sname, Supplier.contact, Supplier.address, Supplier.city, Supplier.state, Supplier.zip, PurDetails.sno, PurDetails.pro_id, PurDetails.quantity,PurDetails.price,PurDetails.total, Purchase.invno, Purchase.invamt, Purchase.invpaid, Purchase.invrem, Purchase.pdate FROM Purchase INNER JOIN PurDetails ON Purchase.pid = PurDetails.p_id INNER JOIN Supplier ON Purchase.supid = Supplier.supid WHERE (purchase.pid = @pid)">
                                 <SelectParameters>
                                        <asp:QueryStringParameter QueryStringField="pid" Name="pid"></asp:QueryStringParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </table>
                        </div>    </div></div>      
       </div>
        <div class="col-sm-6 col-lg-6">
        <div class="card">
            <div class="card-body">
                <h4 class="header-title mb-2">Order Summary</h4>

                <div class="table-responsive">
                    <table class="table mb-0">
                        <thead class="thead-light">
                            <tr>
                                <th style="color:black">Description</th>
                                <th style="color:black">Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                              <tr>
                                <td>Discount Amount :</td>
                                <td><%# Eval("dis") %> Rs</td>
                            </tr>  <tr>
                                <td>GST(%) :</td>
                                <td><%# Eval("gst") %> %</td>
                            </tr>
                            
                            <tr>
                                <td>Paid Amount: </td>
                                <td><%# Eval("invpaid") %> Rs</td>
                            </tr>
                            <tr>
                                <td>Due Amount: </td>
                                <td><%# Eval("invrem") %> Rs</td>
                            </tr>
                             <tr>
                                <td>Payment Status: </td>
                                <td><%# Eval("status") %></td>
                            </tr>
                             <tr>
                                <th>Invoice Amount:</th>
                                <th><%# Eval("invamt") %> Rs</th>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- end table-responsive -->

            </div>
        </div>
            </div>
             <div class="mt-10 float-sm-right">      <p class="mb-0">
                          <p>__________________________________________</p>
                          <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sign and Stamp by Authority</h5>

    </div> <!-- end col -->
</div>
           </div>             <div class="d-print-none mt-4">
                   
                        <a href="javascript:window.print()" class="btn btn-primary"><i class="mdi mdi-printer"></i> Print</a>
                      
                         </div>   
       
                            </div></div>
       
                      </ItemTemplate>
                               </asp:Repeater>      
                    </asp:Panel>
  </div></div>
        
               
                   
   
</asp:Content>


   
<asp:Content ID="content2" ContentPlaceHolderID="footer" runat="server"> 
     
                           
                     <script type = "text/javascript">
        function PrintPanel() {
            var panel = document.getElementById("<%=panel1.ClientID %>");
            var printWindow = window.open('', '', 'height=400,width=700');
            printWindow.document.write('<html><head><title>Invoice</title>');
            printWindow.document.write('</head><h3>Waheguru Creations</h3><hr/><body >');
            printWindow.document.write(panel.innerHTML);
            printWindow.document.write('</body></html>');
            printWindow.document.close();
            setTimeout(function () {
                printWindow.print();
            }, 500);
            return false;
        }
    </script>
                    
              </asp:Content>

