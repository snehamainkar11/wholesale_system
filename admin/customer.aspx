<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false"  MasterPageFile="~/adminmaster.Master" CodeBehind="customer.aspx.cs"  Inherits="wholesale.admin.customer" %>

<asp:Content ID="content1" ContentPlaceHolderID="admincontent" runat="server">  
    <div class="content-page">
                <div class="content">
                <div class="content">
</div>
                    
<!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box">
            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Master</a></li>
                    <li class="breadcrumb-item active">Customer</li>
                </ol>
            </div>
            <h4 class="page-title">Customer</h4>
        </div>
    </div>
</div>
<!-- end page title -->








    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <div class="row mb-2">
                      <div class="col-sm-8">
                          <asp:Panel runat="server" ID="panel1" Visible="false">
<div class="alert alert-info alert-dismissible fade show" role="alert">
                         <i class="dripicons-checkmark mr-2"></i> 
                             <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
                          <asp:Label ID="lblSuccessMessage"  data-dismiss="alert" aria-label="Close" Text="" runat="server" ForeColor="Green" />
                            </div>
            <br />
                   </asp:Panel> 
                         <asp:Panel runat="server" ID="panel" Visible="false">
                        <asp:Label ID="lblErrorMessage" Text="" runat="server" Visible="true" role="alert" ForeColor="Red" />
                             </asp:Panel>
            </div>
                 
                   </div>
                
                    
                  <div class="table-responsive">
                                     <asp:Panel runat="server" ID="panel12">

                            <asp:GridView ID="gvcust" runat="server" ShowFooter="True" ShowHeaderWhenEmpty="true" OnRowCommand="gvcust_RowCommand"
                                AllowPaging="False" AutoGenerateColumns="False" class="table table-bordered table-centered  table-hover mb-0" OnRowCancelingEdit="gvcust_RowCancelingEdit" OnRowDeleting="gvcust_RowDeleting"
                                OnRowEditing="gvcust_RowEditing" OnRowUpdating="gvcust_RowUpdating" DataKeyNames="CID" CellPadding="4" ForeColor="#333333" GridLines="None">

                                <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                                <Columns>
                                     <asp:TemplateField HeaderText = "Sr.No" ItemStyle-Width="10">
                                        <ItemTemplate>
                                                   <%# Container.DataItemIndex + 1 %>

                                        </ItemTemplate>
                                           <ItemStyle Width="1%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Customer">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpimgname" runat="server" Text='<%# Bind("cname") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>

                                            <asp:TextBox ID="txtname" CssClass="form-control" runat="server" Text='<%# Bind("cname") %>'></asp:TextBox>
                                        <asp:RegularExpressionValidator runat="server" ID="rcwm" ErrorMessage="Invalid Name" ForeColor="red"   ControlToValidate="txtname" ValidationExpression="^[a-zA-Z'.\s]{1,50}"></asp:RegularExpressionValidator>

                                        </EditItemTemplate>

                                        <FooterTemplate>
                                            <asp:TextBox ID="txtname1" runat="server"  />
                                            <asp:RegularExpressionValidator runat="server" ID="rcm" ErrorMessage="Invalid Name" ForeColor="Pink"   ControlToValidate="txtname1" ValidationExpression="^[a-zA-Z'.\s]{1,50}"></asp:RegularExpressionValidator>

                                        </FooterTemplate>


                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Contact">
                                        <ItemTemplate>
                                            <asp:Label ID="lblName" runat="server" Text='<%# Bind("contact") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtcontact" CssClass="form-control" TextMode="Number" MaxLength="10" runat="server" Text='<%# Bind("contact") %>'></asp:TextBox>
                                            <asp:RegularExpressionValidator runat="server" ID="rccc" ErrorMessage="Invalid Contact Number" ForeColor="red"   ControlToValidate="txtcontact" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>

                                            </EditItemTemplate>

                                        <FooterTemplate>
                                            <asp:TextBox ID="txtcontact1" runat="server"  TextMode="Number" MaxLength="10" ViewStateMode="Enabled" />
                                            <asp:RegularExpressionValidator runat="server" ID="rc" ErrorMessage="Invalid Contact Number" ForeColor="Pink"   ControlToValidate="txtcontact1" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="GST No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblValue" runat="server" Text='<%# Bind("gstno") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtgst" CssClass="form-control"  runat="server" Text='<%# Bind("gstno") %>'></asp:TextBox>
                                         <asp:RegularExpressionValidator ValidationExpression="^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$" runat="server" ID="eucgst" ControlToValidate="txtgst" ErrorMessage="Invalid GST No" ForeColor="red"></asp:RegularExpressionValidator>

                                        </EditItemTemplate>

                                        <FooterTemplate>
                                            <asp:TextBox ID="txtgst1" runat="server"  />
                                            <asp:RegularExpressionValidator ValidationExpression="^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$" runat="server" ID="ecgst" ControlToValidate="txtgst1" ErrorMessage="Invalid GST No" ForeColor="Pink"></asp:RegularExpressionValidator>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Address">
                                        <ItemTemplate>
                                            <asp:Label ID="lblValue2" runat="server" Text='<%# Bind("address") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtaddress" CssClass="form-control"  TextMode="MultiLine"  runat="server" Text='<%# Bind("address") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtaddress1" runat="server" Columns="24"  Rows="3" TextMode="MultiLine"/>
                                        </FooterTemplate>
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
                                        <FooterTemplate>
                                            <asp:ImageButton ImageUrl="~/Images/addnew.png" runat="server" CommandName="AddNew" ToolTip="Add New" Width="20px" Height="20px" />
                                        </FooterTemplate>
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
                </div></div>
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
        $('#<%= gvcust.ClientID%>').prepend($("<thead></thead>").append($("#<%= gvcust.ClientID%>").find("tr:first"))).DataTable({
            stateSave: true,
           dom: 'Bfrtip',
            'aoColumnDefs': [{ 'bSortable': false, 'aTargets': [5]}],
            'iDisplayLength': 8,
select:true,
            buttons: [
            { extend: 'print', text: 'Print', exportOptions: { columns: ':visible'},className: ' uil-print', },
            { extend: 'copy', text: 'Copy', className: ' uil-copy-landscape', exportOptions: { modifier: { page: 'all'}} },
            { extend: 'excel', text: 'Excel ', className: '  uil-file-times', filename: 'customer', exportOptions: { modifier: { page: 'all'}} },
            { extend: 'pdf', text: 'PDF', className: ' mdi mdi-file-outline', filename: 'customer', orientation: 'Portrait', pageSize: 'LEGAL', exportOptions: { modifier: { page: 'all' }, columns: [0, 1, 2,3,4]} },
            'colvis'
            ],
            columnDefs: [{ targets: -1, visible: false}]
        });

    });
</script>
     
    </asp:Content>