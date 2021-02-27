<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" MasterPageFile="~/adminmaster.Master" CodeFile="purchaselist.aspx.cs" Inherits="wholesale.admin.purchaselist" %>

<asp:Content ID="content1" ContentPlaceHolderID="admincontent" runat="server">  
    <div class="content-page">
                <div class="content">
                <div class="content">
                    
<!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box">
            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Order</a></li>
                    <li class="breadcrumb-item active"><a href="javascript: void(0);">Purchase</a></li>
                </ol>
            </div>
            <h4 class="page-title"> Purchase Order</h4>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <a href="purchaseorder.aspx" class="btn btn-light mb-2" ><i class="mdi mdi-plus-circle mr-2" ></i> Add Order</a>
                    </div>
                   
                         <div class="col-sm-6">
                        <div class="text-sm-right">
                           <asp:Button Id="excel" class="btn btn-dark mb-2" runat="server" Text="Export to Excel" OnClick="excel_Click"></asp:Button>

                            <asp:Button Id="print" class="btn btn-secondary mb-2" runat="server" Text="Export to Word" OnClick="print_Click"></asp:Button>
                        </div>
                    </div><!-- end col-->
                </div>
                  <div class="row mb-2">
                    <div class="col-sm-8">
                        <div class="text-sm-left">
                           <asp:Panel runat="server" ID="panel" Visible="false">
<div class="alert alert-info alert-dismissible fade show" role="alert">
                         <i class="dripicons-checkmark mr-2"></i> 
                             <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
                          <asp:Label ID="lblSuccessMessage"  data-dismiss="alert" aria-label="Close" Text="" runat="server" ForeColor="Green" />
                            </div>
            <br />
                   </asp:Panel>   
                          <asp:Panel runat="server" ID="panel1" Visible="false">
                        <asp:Label ID="lblErrorMessage" Text="" runat="server" Visible="true"  role="alert" ForeColor="Red" />
                              </asp:Panel>
                        </div>
                    </div>
                </div>

                

                <div class="table-responsive">
                    <asp:GridView ID="gvpo" runat="server" ShowFooter="False" ShowHeaderWhenEmpty="true" DataKeyNames="po" 
                        AllowPaging="false"  AutoGenerateColumns="False" class="table table-bordered table-centered table-hover mb-0"  CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                        <HeaderStyle Width="100px" />
                        <Columns>

                              <asp:TemplateField HeaderText="Sr.No" ItemStyle-Width="100">
                                                                               <ItemTemplate>
                                                                                   <%# Container.DataItemIndex + 1 %>
                                                                               </ItemTemplate>
                                                                               <ItemStyle Width="1%" />
                                                                           </asp:TemplateField>
                            <asp:TemplateField HeaderText="Purchase Order No">
                                <ItemTemplate>
                                    <asp:Label ID="vwprod" Text='<%# Bind("po") %>'
                                        runat="server">
                                    </asp:Label>
                                </ItemTemplate>



                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Supplier Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblbrd2" runat="server" Text='<%# Bind("sname") %>'></asp:Label>
                                </ItemTemplate>


                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="Date">
                                <ItemTemplate>
                                    <asp:Label ID="lblclr" runat="server" Text='<%# Bind("odate") %>' Width="100px"></asp:Label>
                                </ItemTemplate>
                             

                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Total Amount">
                                <ItemTemplate>
                                    <asp:Label ID="lblsm" runat="server" Text='<%# Bind("total") %>'></asp:Label>
                                </ItemTemplate>

                            
                            </asp:TemplateField>

                          

                            <asp:TemplateField HeaderText="View" ItemStyle-Width="20">
                                <ItemTemplate>
                                    <asp:HyperLink ID="vwdet" 
                                        runat="server" NavigateUrl='<%# "~/admin/printpurchase.aspx?po=" + Eval("po") %>'>
                                        <i class="mdi mdi-eye"></i>
                                    </asp:HyperLink>
                                </ItemTemplate>
                              

                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#999999"></EditRowStyle>

                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>

                        <HeaderStyle Width="100px" BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>

                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                        <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

                        <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

                        <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

                        <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
                    </asp:GridView>
                    
                </div>

            </div> <!-- end card-body-->
        </div> <!-- end card-->
    </div> <!-- end col -->
</div>
<!-- end row -->

                    </div>
                    </asp:Content>

<asp:Content ID="content2" ContentPlaceHolderID="footer" runat="server">  
 <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>

<!-- Popper.JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>

<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

<!-- jQuery Data Tables CDN -->
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js" type="text/javascript" charset="utf8"></script>

<!-- Bootstrap Data Tables JS -->
<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js" type="text/javascript" charset="utf8"></script>

<script>
    $(document).ready(function () {
        $('#<%= gvpo.ClientID%>').prepend($("<thead></thead>").append($("#<%= gvpo.ClientID%>").find("tr:first"))).DataTable({
            stateSave: true,
            
               
        });

    });
</script>
     
    </asp:Content>