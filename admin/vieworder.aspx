<%@ Page Language="C#" AutoEventWireup="true"   MasterPageFile="~/adminmaster.Master" CodeFile="vieworder.aspx.cs" Inherits="wholesale.admin.vieworder" %>


<asp:Content ID="content1" ContentPlaceHolderID="admincontent" runat="server"> 

    <div class="content-page">
                <div class="content">
                <div class="content">

                    
           
  <div class="row">
    <div class="col-12">
        <div class="page-title-box">
             <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Sales</a></li>
                    <li class="breadcrumb-item active">View Order</li>
                        </ol>
            </div>
            <h4 class="page-title">View Order</h4>
        </div>
         
        </div>
     </div>
         
           <asp:Panel ID="panel1" runat="server" >          
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">

                
                       
                    <div class="float-left">
                                            <h3>Invoice</h3>

                    </div>
                          <br />     
                 
                   <hr />
                      <asp:Repeater runat="server" ID="rptr">
                    <ItemTemplate>
                    
                         <div class="row">
                              <div class="col-sm-6">
                        <div class="float-left">
                             <h4>Billing From</h4>
                            <h4><b style= "color:black">Waheguru Creations</b></h4>

                            
                     <div style="color:black">
                      <h5>abc road,opp to dominoz piazza,</h5>
                           
                          <h5>Pin :487570</h5>
                       <h5> Contact:9484949990</h5>
                                            <h5> Email:abc@gmail.com</h5>

                         </div></div>
                    <!-- end col-->

                   

                  
               
                       </div>
                             
                              <div class="col-sm-6">
                        <div class="float-right">
                             <h4>Billing To</h4>
                            <h4><b style= "color:black"><%# Eval("cname") %></b></h4>

                            
                     <div style="color:black">
                      <h5>   <%# Eval("address") %> </h5>
                           
                       <h5>Contact: <%# Eval("contact") %></h5>
                                            <h5> Invoice No: <%# Eval("orderno") %></h5>
                        Date: <%# Eval("pdate") %>
                         </div></div>
                    <!-- end col-->

                    </div>
                                  </div>
                          <div class="row">
                    <div class="col-10">
                        <div class="table-responsive">
                            <table class="table mt-4">
                                <asp:GridView runat="server" ID="gv" class="table table-bordered table-centered table-hover mb-0"
                                    AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">

                                    <AlternatingRowStyle BackColor="#CCCCCC"></AlternatingRowStyle>
                                    <Columns>
                                        <asp:BoundField DataField="sno" HeaderText="Sno" SortExpression="Sno"></asp:BoundField>
                                        <asp:BoundField DataField="pname" HeaderText="Jeans" SortExpression="pname"></asp:BoundField>

                                        <asp:BoundField DataField="price" HeaderText="Price" SortExpression="Price"></asp:BoundField>
                                        <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="Quantity"></asp:BoundField>

                                        <asp:BoundField DataField="total" HeaderText="Total" SortExpression="Total"></asp:BoundField>

                                    </Columns>
                                    <FooterStyle BackColor="#CCCCCC"></FooterStyle>

                                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White"></HeaderStyle>

                                    <PagerStyle HorizontalAlign="Center" BackColor="#999999" ForeColor="Black"></PagerStyle>

                                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                                    <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>

                                    <SortedAscendingHeaderStyle BackColor="#808080"></SortedAscendingHeaderStyle>

                                    <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>

                                    <SortedDescendingHeaderStyle BackColor="#383838"></SortedDescendingHeaderStyle>
                                </asp:GridView>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:wholesaleConnectionString %>' SelectCommand="SELECT SaleDet.sno, SaleDet.price, SaleDet.quantity,SaleDet.total, product.pname FROM product INNER JOIN SaleDet ON product.pname = SaleDet.productid WHERE (SaleDet.orderno = @orderno)">
                                    <SelectParameters>
                                        <asp:QueryStringParameter QueryStringField="orderno" Name="orderno"></asp:QueryStringParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </table>
                        </div>    </div>        
            <div class="col-sm-10">
                        <div class="float-right mt-4 mt-sm-2">
                     <table border="0" class="table table-sm   table-centered mb-0">   <tr>  <td> <p><b>Sub-total : </b> </td><td> <span class="float-center">  
                            <%# Eval("total") %> Rs</span></p></td></tr>
                          <tr>  <td><p><b>GST(%) :</b> </td><td> +  <span class="float-center"><%# Eval("gst") %></span> %</p></td></tr>
                           <tr>  <td>  <p><b>Discount :</b> </td><td>- <span class="float-center"><%# Eval("discount") %> Rs</span></p></td></tr>

                           <tr>  <td>  <h4> Grand Total :  </td><td><%# Eval("grand") %> Rs</h4></td></tr>
                           <tr>  <td>  <p class="font-18"><strong>Payment Status: </strong> </td><td> <span class="badge badge-success float-centre"><asp:Label Text='<%# Eval("status") %>' runat="server" ID="statusLabel"  />  </span></p></td></tr>
                 </table> 
                        </div>
                        
                     
                  
               
                   </div>
                          
                          
       </div>
                            
     
                      </ItemTemplate>
                               </asp:Repeater>      
                    
  </div></div>
        </div></div>
                    </asp:Panel>
                     <div class="d-print-none mt-4">
                   
                        <a href="javascript:window.print()" class="btn btn-primary"><i class="mdi mdi-printer"></i> Print</a>
                      
                         </div>
</asp:Content>


   
<asp:Content ID="content2" ContentPlaceHolderID="footer" runat="server"> 
     
                           
                     <script type = "text/javascript">
        function PrintPanel() {
            var panel = document.getElementById("<%=panel1.ClientID %>");
            var printWindow = window.open('', '', 'height=400,width=700');
            printWindow.document.write('<html><head><title>Invoice</title>');
            printWindow.document.write('</head><h3>Waheguru Creations</h3><body >');
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