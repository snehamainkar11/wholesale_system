
<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false"  MasterPageFile="~/adminmaster.Master"  CodeBehind="material.aspx.cs" Inherits="wholesale.material" %>


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
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Inventory</a></li>
                    <li class="breadcrumb-item active">Material</li>
                </ol>
            </div>
            <h4 class="page-title">Material Used for Manufucturing</h4>
        </div>
    </div>
</div>
<!-- end page title -->

<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <a data-toggle="modal" data-target="#full-width-modal" class="btn btn-dark mb-2"  style="color:white"><i class="mdi mdi-plus-circle mr-2" ></i> Add Material</a>
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
  
                                                 <asp:GridView ID="gvmaterial" runat="server" ShowHeaderWhenEmpty="true" DataKeyNames="mid" PageSize="8" AutoGenerateColumns="False" class="table table-bordered table-centered table-hover mb-0" OnRowDataBound="gvmaterial_RowDataBound" OnRowCancelingEdit="gvmaterial_RowCancelingEdit" OnRowDeleting="gvmaterial_RowDeleting" OnRowEditing="gvmaterial_RowEditing" OnRowUpdating="gvmaterial_RowUpdating" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                     <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                                                     <Columns>
                                                           <asp:TemplateField HeaderText = "Sr.No" ItemStyle-Width="100">
                                        <ItemTemplate>
                                                   <%# Container.DataItemIndex + 1 %>

                                        </ItemTemplate>
                                       <ItemStyle Width="2%" />
                                    </asp:TemplateField>

                                                         <asp:TemplateField HeaderText="Material Code">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblbrd" runat="server" Text='<%# Bind("mcode") %>'></asp:Label>
                                                             </ItemTemplate>
                                                             <EditItemTemplate>
                                                                 <asp:TextBox ID="txtcode" CssClass="form-control" runat="server" Text='<%# Bind("mcode") %>' Width="100px"></asp:TextBox>
                                                             </EditItemTemplate>


                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Material Name">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblbrd2" runat="server" Text='<%# Bind("mname") %>'></asp:Label>
                                                             </ItemTemplate>
                                                             <EditItemTemplate>
                                                                 <asp:TextBox ID="mname" CssClass="form-control" runat="server" Text='<%# Bind("mname") %>' Width="100px"></asp:TextBox>
                                                             </EditItemTemplate>

                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Category">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblsize" runat="server" Text='<%# Bind("mcategory") %>'></asp:Label>
                                                             </ItemTemplate>
                                                             <EditItemTemplate>
                                                                 <asp:DropDownList ID="mcategory" CssClass="form-control" runat="server" Width="100px">
                                                                     <asp:ListItem>Denim Fabrics</asp:ListItem>
                                                                     <asp:ListItem>Polyster Blead</asp:ListItem>
                                                                     <asp:ListItem>Yarns</asp:ListItem>
                                                                     <asp:ListItem>Washing Equipment</asp:ListItem>
                                                                     <asp:ListItem>Metal Zip</asp:ListItem>
                                                                     <asp:ListItem>Buttons</asp:ListItem>
                                                                     <asp:ListItem>Chemicals</asp:ListItem>
                                                                     <asp:ListItem>Stitching Thread</asp:ListItem>
                                                                     <asp:ListItem>Other</asp:ListItem>
                                                                 </asp:DropDownList>
                                                             </EditItemTemplate>
                                                         </asp:TemplateField>

                                                           <asp:TemplateField HeaderText="Supplier">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblsm" runat="server" Text='<%# Bind("company") %>'></asp:Label>
                                                             </ItemTemplate>

                                                             <EditItemTemplate>
                                                                 <asp:DropDownList ID="company" CssClass="form-control" runat="server" Width="100px"></asp:DropDownList>
                                                             </EditItemTemplate>
                                                         </asp:TemplateField>

                                                         <asp:TemplateField HeaderText="Quantity in hand">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblup" runat="server" Text= '<%# string.Concat(Eval("qty"), " ", Eval("unit"))%>'></asp:Label>
                                                             </ItemTemplate>
                                                             <EditItemTemplate>
                                                                 <asp:TextBox ID="qty" CssClass="form-control" runat="server" Text='<%# Bind("qty") %>' Width="100px"></asp:TextBox>
                                                             </EditItemTemplate>

                                                         </asp:TemplateField>

                                                     
                                                         <asp:TemplateField HeaderText="Min Stock Level">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="lblclr1" runat="server" Text='<%# Bind("minstock") %>'></asp:Label>
                                                             </ItemTemplate>
                                                             <EditItemTemplate>
                                                                 <asp:TextBox ID="minstock" CssClass="form-control" runat="server" Text='<%# Bind("minstock") %>' Width="100px"></asp:TextBox>
                                                             </EditItemTemplate>

                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Price">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="city" runat="server" Text='<%# Bind("price") %> '></asp:Label>
                                                             </ItemTemplate>
                                                             <EditItemTemplate>
                                                                 <asp:TextBox ID="price" CssClass="form-control" runat="server" Text='<%# Bind("price") %> ' Width="100px"></asp:TextBox>
                                                             </EditItemTemplate>

                                                         </asp:TemplateField>
                                                      


                                                         <asp:TemplateField HeaderText="">
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

                                                     <HeaderStyle Width="100px" BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />







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
                <h4 class="modal-title" id="fullWidthModalLabel">Add Material</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
                <div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
             
                <div class="form-row">
    <div class="form-group col-md-4">
        <label for="validationCustom01">Material Code</label>
        <asp:TextBox runat ="server"  class="form-control" id="mcode"
            placeholder="Material Code"  ></asp:TextBox>
        <div class="valid-feedback">
            Looks good!
        </div>
    </div>
    <div class="form-group col-md-8">
        <label for="validationCustom02">Material Name</label>
        <asp:TextBox runat ="server" type="text" class="form-control" id="mname"
            placeholder="Material Name"  ></asp:TextBox>
        <div class="valid-feedback">
            Looks good!
        </div>
    </div>
                    </div>
                                <div class="form-row">

                       <div class="form-group col-md-8">
                        <label for="Category"> Select Category</label>
                            <asp:DropDownList runat="server"   ID="mcategory" class="form-control">

                                <asp:ListItem>Denim Fabrics</asp:ListItem>
                                  <asp:ListItem>Polyster Blead</asp:ListItem>
                                  <asp:ListItem>Yarns</asp:ListItem>
                                   <asp:ListItem>Washing Equipment</asp:ListItem>
                                   <asp:ListItem>Metal Zip</asp:ListItem>
                                   <asp:ListItem>Buttons</asp:ListItem>
                                   <asp:ListItem>Chemicals</asp:ListItem>
                                   <asp:ListItem>Stitching Thread</asp:ListItem>
                                   <asp:ListItem>Other</asp:ListItem>

                      </asp:DropDownList>
                        </div>
                    
     <div class="form-group col-md-4">
        <label for="validationCustom02">Reorder level</label>
        <asp:TextBox runat ="server" type="number" class="form-control" id="minstock"
            placeholder="Min Stock"  ></asp:TextBox>
      
    </div>
                   
                    </div>
               
      
                <div class="form-row">
                         <div class="form-group col-md-8">
                        <label for="Category"> Select Supplier</label>
                            <asp:DropDownList runat="server" ID="sname" class="form-control" >
                      </asp:DropDownList>
                        </div>
                       <div class="form-group col-md-4">
        <label for="validationCustom06"> Price in Rs</label>
        <asp:TextBox runat ="server" type="number" class="form-control" id="price"
            placeholder="Price"  ></asp:TextBox>
        <div class="valid-feedback">
            Looks good!
        </div>
    </div>
              </div>
                <div class="form-row">

    <div class="form-group col-md-4">
        <label for="validationCustom06">Quantity in Stock</label>
        <asp:TextBox runat ="server" type="text" class="form-control" id="qty"
            placeholder="200"  ></asp:TextBox>
       
    </div>

    <div class="form-group col-md-3">
        <label for="validationCustom02">Unit</label>
        <asp:TextBox runat ="server" type="text" class="form-control" id="unit"
            placeholder="m/ltr"  ></asp:TextBox>
       
    </div>

        
       
   </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-dismiss="modal">Close</button>
                <Asp:Button runat="server" class="btn btn-primary" Text="Save"  ID="btnmaterial"  OnClick="btnmaterial_Click"/>

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</div>
            </div> <!-- end card-body-->
        </div> <!-- end card-->
    </div> <!-- end col -->
</div>
</div>
      </div>
    </div>
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
        $('#<%= gvmaterial.ClientID%>').prepend($("<thead></thead>").append($("#<%= gvmaterial.ClientID%>").find("tr:first"))).DataTable({
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
            columnDefs: [{ targets: -1, visible: false}]
        });

    });
</script>
     
    </asp:Content>
