<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false"  MasterPageFile="~/adminmaster.Master"  CodeFile="supplierlist.aspx.cs" Inherits="wholesale.supplierlist" %>
<asp:Content ID="content1" ContentPlaceHolderID="admincontent" runat="server">  

  <div class="content-page">
                <div class="content">
                <div class="content">

                                      

<div class="row">
    <div class="col-12">
        <div class="page-title-box">
            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Master</a></li>
                    <li class="breadcrumb-item active">Suppliers</li>
                </ol>
            </div>
            <h4 class="page-title">Suppliers Details</h4>
        </div>
    </div>
</div>



<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <a class="btn btn-dark mb-2" style="color:white"  data-toggle="modal" data-target="#full-width-modal"><i class="mdi mdi-plus-circle mr-2"></i> Add Supplier</a>
                    </div>
                                       
                  
                
                    <div class="col-sm-6">
                        <div class="text-sm-left">
                           <asp:Panel runat="server" ID="panel" Visible="false">
<div class="alert alert-info alert-dismissible fade show" role="alert">
                         <i class="dripicons-checkmark mr-2"></i> 
                             <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
                          <asp:Label ID="lblSuccessMessage"  data-dismiss="alert" aria-label="Close" Text="" runat="server" ForeColor="Green" />
                            </div>
            
                   </asp:Panel>   
                          <asp:Panel runat="server" ID="panel1" Visible="false">
                        <asp:Label ID="lblErrorMessage" Text="" runat="server" Visible="true"  role="alert" ForeColor="Red" />
                              </asp:Panel>
                        </div>
                    </div>
                </div>

                <div class="table-responsive">
                 
                                                               <asp:Panel runat="server" ID="panel12">
 
                                                                   <asp:GridView ID="gvsupplier" runat="server" ShowHeaderWhenEmpty="true" DataKeyNames="SupId"
                                                                       AllowPaging="false" AutoGenerateColumns="False" class="table table-bordered table-centered table-hover mb-0" OnRowCancelingEdit="gvsupplier_RowCancelingEdit" OnRowDeleting="gvsupplier_RowDeleting" OnRowEditing="gvsupplier_RowEditing" OnRowUpdating="gvsupplier_RowUpdating" CellPadding="4" ForeColor="#333333" GridLines="both">
                                                                       <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                                                                       <Columns>

                                                                           <asp:TemplateField HeaderText="Sr.No" ItemStyle-Width="100">
                                                                               <ItemTemplate>
                                                                                   <%# Container.DataItemIndex + 1 %>
                                                                               </ItemTemplate>
                                                                               <ItemStyle Width="1%" />
                                                                           </asp:TemplateField>
                                                                           <asp:TemplateField HeaderText="Supplier">
                                                                               <ItemTemplate>
                                                                                   <asp:Label ID="lblbrd" runat="server" Text='<%# Bind("sname") %>'></asp:Label>
                                                                               </ItemTemplate>
                                                                               <EditItemTemplate>
                                                                                   <asp:TextBox ID="txtsname" CssClass="form-control" runat="server" Text='<%# Bind("sname") %>'></asp:TextBox>
                                                                               </EditItemTemplate>


                                                                           </asp:TemplateField>
                                                                           <asp:TemplateField HeaderText="Company/Store">
                                                                               <ItemTemplate>
                                                                                   <asp:Label ID="lblsize" runat="server" Text='<%# Bind("company") %>'></asp:Label>
                                                                               </ItemTemplate>
                                                                               <EditItemTemplate>
                                                                                   <asp:TextBox ID="txtcompany" CssClass="form-control" runat="server" Text='<%# Bind("company") %>'></asp:TextBox>
                                                                               </EditItemTemplate>
                                                                           </asp:TemplateField>

                                                                           <asp:TemplateField HeaderText="GST No">
                                                                               <ItemTemplate>
                                                                                   <asp:Label ID="lblclr" runat="server" Text='<%# Bind("gstno") %>'></asp:Label>
                                                                               </ItemTemplate>
                                                                               <EditItemTemplate>
                                                                                   <asp:TextBox ID="gst" CssClass="form-control" runat="server" Text='<%# Bind("gstno") %>'></asp:TextBox>
                                                                               </EditItemTemplate>


                                                                           </asp:TemplateField>
                                                                           <asp:TemplateField HeaderText="Contact">
                                                                               <ItemTemplate>
                                                                                   <asp:Label ID="lblclr1" runat="server" Text='<%# Bind("contact") %>'></asp:Label>
                                                                               </ItemTemplate>
                                                                               <EditItemTemplate>
                                                                                   <asp:TextBox ID="contact" CssClass="form-control" runat="server" Text='<%# Bind("contact") %>'></asp:TextBox>
                                                                               </EditItemTemplate>

                                                                           </asp:TemplateField>
                                                                           <asp:TemplateField HeaderText="Email">
                                                                               <ItemTemplate>
                                                                                   <asp:Label ID="lblqty" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                                                                               </ItemTemplate>

                                                                               <EditItemTemplate>
                                                                                   <asp:TextBox ID="email" CssClass="form-control" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                                                                               </EditItemTemplate>
                                                                           </asp:TemplateField>

                                                                           <asp:TemplateField HeaderText="Address">
                                                                               <ItemTemplate>
                                                                                   <asp:Label ID="lblup" runat="server" Text='<%# Bind("address") %>'></asp:Label>
                                                                               </ItemTemplate>
                                                                               <EditItemTemplate>
                                                                                   <asp:TextBox ID="addr" CssClass="form-control" runat="server" Text='<%# Bind("address") %>'></asp:TextBox>
                                                                               </EditItemTemplate>

                                                                           </asp:TemplateField>
                                                                           <asp:TemplateField HeaderText="City">
                                                                               <ItemTemplate>
                                                                                   <asp:Label ID="city" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                                                                               </ItemTemplate>
                                                                               <EditItemTemplate>
                                                                                   <asp:TextBox ID="txtcity" CssClass="form-control" runat="server" Text='<%# Bind("city") %>'></asp:TextBox>
                                                                               </EditItemTemplate>

                                                                           </asp:TemplateField>
                                                                           <asp:TemplateField HeaderText="State">
                                                                               <ItemTemplate>
                                                                                   <asp:Label ID="lbldis" runat="server" Text='<%# Bind("state") %>'></asp:Label>
                                                                               </ItemTemplate>
                                                                               <EditItemTemplate>
                                                                                   <asp:TextBox ID="txtstate" CssClass="form-control" runat="server" Text='<%# Bind("state") %>'></asp:TextBox>
                                                                               </EditItemTemplate>
                                                                           </asp:TemplateField>
                                                                           <asp:TemplateField HeaderText="Zip">
                                                                               <ItemTemplate>
                                                                                   <asp:Label ID="lblstatus" runat="server" Text='<%# Bind("zip") %>'></asp:Label>
                                                                               </ItemTemplate>
                                                                               <EditItemTemplate>
                                                                                   <asp:TextBox ID="txtzip" CssClass="form-control" runat="server" Text='<%# Bind("zip") %>'></asp:TextBox>
                                                                               </EditItemTemplate>

                                                                           </asp:TemplateField>


                                                                           <asp:TemplateField HeaderText="Action">
                                                                               <ItemTemplate>
                                                                                   <asp:ImageButton ImageUrl="~/Images/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px" />
                                                                                   <asp:ImageButton ImageUrl="~/Images/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px" />
                                                                               </ItemTemplate>
                                                                               <EditItemTemplate>
                                                                                   <asp:ImageButton ImageUrl="~/Images/save.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px" />
                                                                                   <asp:ImageButton ImageUrl="~/Images/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px" />
                                                                               </EditItemTemplate>

                                                                           </asp:TemplateField>
                                                                       </Columns>







                                                                       <EditRowStyle BackColor="#999999"></EditRowStyle>

                                                                       <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>

                                                                       <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>

                                                                       <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>

                                                                       <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

                                                                       <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                                                                       <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

                                                                       <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

                                                                       <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

                                                                       <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
                                                                   </asp:GridView>
                       </asp:Panel>
                    </div>

                <div id="full-width-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="fullWidthModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-full-width" >
        <div class="modal-content" style="background-color:snow">
            <div class="modal-header" style="background-color:white; color:midnightblue">
                <h4 class="modal-title" id="fullWidthModalLabel">Add Supplier</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
                <div class="row">
    <div class="col-12">
        <div class="card"">
            <div class="card-body">
              
                      
    <div class="form-group mb-3 " >
        <label for="validationCustom01">Full name</label>
        <asp:TextBox runat ="server" class="form-control"  id="txtname"
            placeholder="Supplier name"  ></asp:TextBox>
      
    </div>
    <div class="form-group mb-3 ">
        <label for="validationCustom02">Company Name</label>
        <asp:TextBox runat ="server" type="text" class="form-control" id="txtstore"
            placeholder="Company"  ></asp:TextBox>
       
    </div>
                <div class="form-row">
        <div class="form-group mb-3 col-md-6 " >
        <label for="validationCustom04">GST Number</label>
        <asp:TextBox runat ="server"  type="text" class="form-control" ID="txtgst"
            placeholder="GST Number" ></asp:TextBox>
       
    </div>
   
                   
                  <div class="form-group mb-3">
        <label for="validationCustom06">Contact</label>
        <asp:TextBox runat ="server" type="text"  MaxLength="10" class="form-control" id="txtct"
            placeholder="Contact"  ></asp:TextBox>
        <div class="valid-feedback">
            Looks good!
        </div>
    </div>
                    </div>
                 <div class="form-group mb-3">
        <label for="validationCustom04">Email</label>
       <asp:TextBox runat ="server"  type="email" class="form-control" ID="txtemail"
            placeholder="Email" ></asp:TextBox>
     
    </div>
            
    <div class="form-group mb-3">
        <label for="validationCustom03">Address</label>
      <asp:TextBox runat ="server"  TextMode="MultiLine" type="text" class="form-control" id="txtaddr"
            placeholder="Address" ></asp:TextBox>
     
    </div>
     <div class="form-row">
        <div class="form-group mb-3 col-md-4 " >
        <label for="validationCustom04">City</label>
      <asp:TextBox runat ="server" type="text" class="form-control" ID="txtcity"
            placeholder="City" ></asp:TextBox>
      
    </div>
   <div class="form-group mb-3 col-md-4" >
        <label for="validationCustom04">State</label>
      <asp:TextBox runat ="server" type="text" class="form-control" ID="txtstate"
            placeholder="State" ></asp:TextBox>
       
    </div>
          <div class="form-group mb-3 col-md-4">
        <label for="validationCustom05">Zip</label>
      <asp:TextBox runat ="server" type="number" class="form-control" id="txtzip"
            placeholder="Zip" ></asp:TextBox>
        <div class="invalid-feedback">
            Please provide a valid zip.
        </div>
       
    </div>
         </div>
   
     
     

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-dismiss="modal">Close</button>
                <Asp:Button runat="server" class="btn btn-primary" Text="Save"  ID="btnaddsupplier" OnClick="btnaddsupplier_Click"/>

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
            </div> <!-- end card-body-->
        </div> <!-- end card-->
    </div> <!-- end col -->
</div>
</div></div></div></div>
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
        $('#<%= gvsupplier.ClientID%>').prepend($("<thead></thead>").append($("#<%= gvsupplier.ClientID%>").find("tr:first"))).DataTable({
            stateSave: true,
           dom: 'Bfrtip',
            'aoColumnDefs': [{ 'bSortable': true, 'aTargets': [0]}],
            'iDisplayLength': 8,
select:true,
            buttons: [
            { extend: 'print', text: 'Print', exportOptions: { columns: ':visible'},className: ' uil-print', },
            { extend: 'copy', text: 'Copy', className: ' uil-copy-landscape', exportOptions: { modifier: { page: 'all'}} },
            { extend: 'excel', text: 'Excel ', className: '  uil-file-times', filename: 'suppliers', exportOptions: { modifier: { page: 'all'}} },
            { extend: 'pdf', text: 'PDF', className: ' mdi mdi-file-outline', filename: 'suppliers', orientation: 'landscape', pageSize: 'LEGAL', exportOptions: { modifier: { page: 'all' }, columns: [0, 1, 2,3,4,5,6,7,8,9,10]} },
            'colvis'
            ],
            columnDefs: [{ targets: -1, visible: false}]
        });

    });
</script>
     
    </asp:Content>