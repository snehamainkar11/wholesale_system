<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/adminmaster.Master"  EnableEventValidation="false" CodeFile="productlist.aspx.cs" Inherits="wholesale.productlist" %>
<asp:Content ID="content1" ContentPlaceHolderID="admincontent" runat="server">  
    <div class="content-page">
                <div class="content">
                <div class="content">
</div>

  <div class="row">
    <div class="col-12">
        <div class="page-title-box">
             <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Inventory</a></li>
                    <li class="breadcrumb-item active">Product Details</li>
                        </ol>
            </div>
            <h4 class="page-title">Product Details</h4>
        </div>
           <h1>  <asp:HyperLink  runat="server" href="product.aspx"  style="float:right; color:black;" class="mdi mdi-view-comfy"></asp:HyperLink></h1>

        </div>
     </div>
   
     
                  

                      
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <a href="addproduct.aspx" class="btn btn-dark mb-2"><i class="mdi mdi-plus-circle mr-2"></i> Add Product</a>
                    </div>
                  
                     <div class="col-sm-6">
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
                        <asp:Label ID="lblErrorMessage" Text="" runat="server" Visible="true" role="alert" ForeColor="Red" />
                             </asp:Panel>
            </div>
                   </div>
                   
                <div class="table-responsive">
               
               

                                                              <asp:Panel runat="server" ID="panel11">

                                                                   <asp:GridView ID="gvproduct" runat="server"  ShowHeaderWhenEmpty="true" DataKeyNames="PID" OnRowDataBound="gvproduct_RowDataBound" 
                                                                       AllowPaging="False" AutoGenerateColumns="False"  class="table table-bordered table-centered table-hover mb-0" OnRowDeleting="gvproduct_RowDeleting1" OnRowEditing="gvproduct_RowEditing" OnRowCancelingEdit="gvproduct_RowCancelingEdit" OnRowUpdating="gvproduct_RowUpdating" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                       <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
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
                                                                       <Columns>
                            <asp:TemplateField HeaderText = "Sr.No" ItemStyle-Width="100">
                                        <ItemTemplate>
                                                   <%# Container.DataItemIndex + 1 %>

                                        </ItemTemplate>
                                       <ItemStyle Width="2%" />
                                    </asp:TemplateField>
        <asp:TemplateField HeaderText="Code">
            <ItemTemplate>
                <asp:Label ID="lblid" runat="server" Text='<%# Bind("pcode")  %>'  Width="100px"></asp:Label>
            </ItemTemplate>           
            <EditItemTemplate>
                <asp:TextBox ID="txtpcode" runat="server" CssClass="form-control" Text='<%# Bind("Pcode") %>' Width="100px"></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField  HeaderText="Image" >
            <ItemTemplate>
                <asp:Label ID="lblpimgname" runat="server" ></asp:Label>
             <img  Height="60px" width="60px" src="/Products/<%# Eval("ProID") %>/<%# Eval("Name") %><%# Eval("Extension") %>" alt="<%# Eval("Name") %>"/>
                 
                
            </ItemTemplate>        
       <EditItemTemplate>
             <img  Height="60px" width="60px" src="/Products/<%# Eval("ProID") %>/<%# Eval("Name") %><%# Eval("Extension") %>" alt="<%# Eval("Name") %>"/>
                       <asp:FileUpload ID="fuimg01" runat="server" /> 
            



       </EditItemTemplate>
        </asp:TemplateField>
           <asp:TemplateField HeaderText="Name">
            <ItemTemplate>
                 <asp:HyperLink ID="vwprod"  Text= '<%# Bind("pname") %>'
                     runat="server"   NavigateUrl='<%# "~/admin/proddetails.aspx?pid=" + Eval("PID") %>'  Width="100px">
                                            </asp:HyperLink>
            </ItemTemplate>
           
             <EditItemTemplate>
                <asp:TextBox ID="txtpname" CssClass="form-control" runat="server" Text='<%# Bind("Pname") %>'  Width="100px"></asp:TextBox>
            </EditItemTemplate>
      
            </asp:TemplateField>
 <asp:TemplateField HeaderText="Brand">
            <ItemTemplate>
                <asp:Label ID="lblbrd" runat="server" Text='<%# Bind("brand") %>'  Width="100px"></asp:Label>
            </ItemTemplate>
      <EditItemTemplate>
      <asp:DropDownList ID="ddlbrd" CssClass="form-control" runat="server"   Width="100px"></asp:DropDownList>
         </EditItemTemplate>
 </asp:TemplateField>
        <asp:TemplateField HeaderText="Category">
            <ItemTemplate>
                <asp:Label ID="lblcat" runat="server" Text='<%# Bind("category") %>'  Width="100px"></asp:Label>
            </ItemTemplate>
           
             <EditItemTemplate>
      <asp:DropDownList ID="catddl" CssClass="form-control" runat="server"   Width="100px"></asp:DropDownList>
         </EditItemTemplate>
        </asp:TemplateField>
          <asp:TemplateField HeaderText="Size">
            <ItemTemplate>
                <asp:Label ID="lblsize" runat="server" Text='<%# Bind("size") %>' ></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtsize" CssClass="form-control" runat="server" Text='<%# Bind("size") %>'  Width="100px"></asp:TextBox>
            </EditItemTemplate>
            
        </asp:TemplateField>
                <asp:TemplateField HeaderText="Color">
            <ItemTemplate>
                <asp:Label ID="lblclr" runat="server" Text='<%# Bind("color") %>' ></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="color" CssClass="form-control" runat="server" Text='<%# Bind("color") %>'  Width="100px"></asp:TextBox>
            </EditItemTemplate>
            
        </asp:TemplateField>
  <asp:TemplateField HeaderText="Quantity">
            <ItemTemplate>
                <asp:Label ID="lblqty" runat="server" Text='<%# Bind("quantity") %>' ></asp:Label>
            </ItemTemplate>
           
             <EditItemTemplate>
                <asp:TextBox ID="txtqty" CssClass="form-control" runat="server" Text='<%# Bind("quantity") %>'  Width="100px"></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>
 <asp:TemplateField HeaderText="Min Stock Level">
            <ItemTemplate>
                <asp:Label ID="level" runat="server" Text='<%# Bind("minlevel") %>' ></asp:Label>
            </ItemTemplate>
           
             <EditItemTemplate>
                <asp:TextBox ID="minlevel" CssClass="form-control" runat="server" Text='<%# Bind("minlevel") %>'  Width="100px"></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Unit Price">
            <ItemTemplate>
                <asp:Label ID="lblup" runat="server" Text='<%# Bind("unitprice") %>'  Width="60px"></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtup" CssClass="form-control" runat="server" Text='<%# Bind("unitprice") %>'  Width="100px"></asp:TextBox>
            </EditItemTemplate>
            
        </asp:TemplateField>
             <asp:TemplateField HeaderText="Selling Prc">
            <ItemTemplate>
                <asp:Label ID="lblsp" runat="server" Text='<%# Bind("sellingprice") %>'  Width="60px"></asp:Label>
            </ItemTemplate>
          <EditItemTemplate>
                <asp:TextBox ID="txtsp" CssClass="form-control" runat="server" Text='<%# Bind("sellingprice") %>'  Width="100px"></asp:TextBox>
            </EditItemTemplate>
            
        </asp:TemplateField>
           <asp:TemplateField HeaderText="Discount(in Rs)">
            <ItemTemplate>
                <asp:Label ID="lbldis" runat="server" Text='<%# Bind("discount") %>'  Width="60px"></asp:Label>
            </ItemTemplate>
                <EditItemTemplate>
                <asp:TextBox ID="txtdis" CssClass="form-control" runat="server" Text='<%# Bind("discount") %>'  Width="100px"></asp:TextBox>
            </EditItemTemplate>
           </asp:TemplateField>
        <asp:TemplateField HeaderText="Status">
            <ItemTemplate>
                <asp:Label ID="lblstatus" runat="server" Text='<%# Bind("status") %>'  Width="100px"></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="status" CssClass="form-control" runat="server" Text='<%# Bind("status") %>'  Width="100px"></asp:TextBox>
            </EditItemTemplate>
            
        </asp:TemplateField>
 
   
        <asp:TemplateField HeaderText="">
                       <ItemTemplate>
                            <asp:ImageButton ImageUrl="~/Images/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="~/Images/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px"/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton ImageUrl="~/Images/save.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="~/Images/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px"/>
                        </EditItemTemplate>
                      
                    </asp:TemplateField>
    </Columns>
          
                          
                                                  
                                                       
                            
                            
                            
                            </asp:GridView>
                        </asp:Panel>
               </div>
            </div> <!-- end card-body-->
        </div> <!-- end card-->
    </div> <!-- end col -->
</div>



             
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



<!-- Bootstrap Data Tables JS -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" />
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.4.2/css/buttons.dataTables.min.css" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.4.2/js/dataTables.buttons.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.4.2/js/buttons.print.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
<script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.colVis.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/fixedcolumns/3.2.6/js/dataTables.fixedColumns.min.js"></script>
<script>
    $(document).ready(function () {
        $('#<%= gvproduct.ClientID%>').prepend($("<thead></thead>").append($("#<%= gvproduct.ClientID%>").find("tr:first"))).DataTable({
            stateSave: true,
           dom: 'Bfrtip',
            'aoColumnDefs': [{ 'bSortable': false, 'aTargets': [0]}],
            'iDisplayLength': 4,
select:true,
            buttons: [
            { extend: 'print', text: 'Print', exportOptions: { columns: ':visible'},className: ' uil-print', },
            { extend: 'copy', text: 'Copy', className: ' uil-copy-landscape', exportOptions: { modifier: { page: 'all'}} },
            { extend: 'excel', text: 'Excel ', className: '  uil-file-times', filename: 'products', exportOptions: { modifier: { page: 'all'}} },
            { extend: 'pdf', text: 'PDF', className: ' mdi mdi-file-outline', filename: 'products', orientation: 'Portrait', pageSize: 'LEGAL', exportOptions: { modifier: { page: 'all' }, columns: [0, 1, 2,3,4,5,6,7,8,9,10,11,12,13]} },
            'colvis'
            ],
            columnDefs: [{ targets: -1, visible: false}],

        });

    });
</script>
   
    </asp:Content>