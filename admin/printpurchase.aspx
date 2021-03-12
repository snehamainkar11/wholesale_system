<%@ Page Language="C#" AutoEventWireup="true"   MasterPageFile="~/adminmaster.Master" CodeFile="printpurchase.aspx.cs" Inherits="wholesale.printpurchase" %>


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
            <h4 class="page-title">View Order</h4>
        </div>
         
        </div>
     </div>
         
                   
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">

                  <asp:Panel ID="panel1" runat="server" >
                       
                             <div class="clearfix">
                   
                    <div style="text-align:center">
                                           
                           
                            <h3 style="color:darkblue">Waheguru Creations</h3>

                            
                     <div style="color:black">
                      <h5>abc road,opp to dominoz piazza,                        
                          Pin :487570</h5>
                       <h5> Contact:9484949990 , Email:abc@gmail.com</h5>

                        
                  
               
                   </div>
                </div>   </div>
                      <hr /><asp:Repeater runat="server" ID="rptr">
                    <ItemTemplate>
                    
                         <div class="row">
                    <div class="col-sm-6">
                        <div class="float-left mt-3">
                            <h3>To</h3>
                            <h4><b style= "color:black">
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
                            <p class="font-16"><strong>Date: </strong> &nbsp;&nbsp;&nbsp; <asp:Label Text=' <%# Eval("odate", "{0:dd/MM/yyyy}") %>' runat="server" ID="pdateLabel" /></p>
                  
                            <p class="font-16"><strong>Order No: </strong> <span class="float-center"><%# Eval("po") %></span></p>
                        </div>
                    </div><!-- end col -->
                </div>
                        <div class="row mb-4">
                    <div class="col-10">
                        <div class="table-responsive">
                            <table class="table mt-4">
                                <asp:GridView runat="server" ID="gv" class="table table-bordered table-centered table-hover mb-0"
                                    AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" DataKeyNames="mid">

                                    <Columns>
                                        <asp:BoundField DataField="sno" HeaderText="Sr.No" SortExpression="sno"></asp:BoundField>
                                        <asp:BoundField DataField="material" HeaderText="Items" SortExpression="material"></asp:BoundField>

                                        <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity"></asp:BoundField>
                                        <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price"></asp:BoundField>
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
                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:wholesaleConnectionString %>' SelectCommand="SELECT Material.mid, podet.sno,podet.total, podet.material, podet.quantity, podet.price FROM Material INNER JOIN podet ON Material.mname = podet.material  WHERE (Podet.po = @po)">
                                   <SelectParameters>
                                        <asp:QueryStringParameter QueryStringField="po" Name="po"></asp:QueryStringParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </table>
                        </div>            
            <div class="col-sm-10">
                        <div class="float-right mt-4 mt-sm-2">
                           
                            <h4>Grand Total : <%# Eval("total") %> Rs</h4>
                        </div>
                        </div>
                        </div>
                       
                          
                          
       </div>
                            </div>
        
                      </ItemTemplate>
                               </asp:Repeater>      
                    </asp:Panel>
  </div></div>
        </div></div>
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
