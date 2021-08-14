<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/adminmaster.Master" CodeBehind="stockmaster.aspx.cs" Inherits="wholesale.admin.stockmaster" %>

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
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Master</a></li>
                    <li class="breadcrumb-item active">Stock</li>
                        </ol>
            </div>
            <h4 class="page-title">Product Stock</h4>
        </div>

        </div>
     </div>
              

                      
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <div class="row mb-2">
                   
                  
                     <div class="col-sm-8">
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

                <div class="row mb-2">
                <div class="form-group col-md-3" >
        <label for="validationCustom04"> Select Type</label>
        <asp:DropDownList runat="server" ID="ddltype" class="form-control">
                           <asp:ListItem>MEN</asp:ListItem>
                           <asp:ListItem>WOMEN</asp:ListItem>
                           <asp:ListItem>KIDS</asp:ListItem>

                        </asp:DropDownList>
       </div>
                 <div class="form-group col-md-3" >
        <label for="validationCustom04">Select Category</label>
                     <asp:DropDownList runat="server" ID="ddlcat" class="form-control" DataSourceID="SqlDataSource1" DataTextField="category" DataValueField="category">
                     </asp:DropDownList>
                     <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:wholesaleConnectionString %>' SelectCommand="SELECT DISTINCT Category.category FROM Category INNER JOIN product ON Category.Id = product.category"></asp:SqlDataSource>
                 </div>
                                 <div class="form-group col-md-3" >
        <label for="validationCustom04">Select Color</label>
                                     <asp:DropDownList runat="server" ID="ddlcolor" class="form-control" DataSourceID="SqlDataSource2" DataTextField="color" DataValueField="color">
                                     </asp:DropDownList>
                                     <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:wholesaleConnectionString %>' SelectCommand="SELECT DISTINCT prodstock.color FROM prodstock INNER JOIN product ON prodstock.PID = product.Pid"></asp:SqlDataSource>
                                 </div>
                     <div class="form-group col-md-3" >
        <label for="validationCustom04">Select Size</label>
                         <asp:DropDownList runat="server" ID="ddlsize" class="form-control" DataSourceID="SqlDataSource3" DataTextField="size" DataValueField="size">
                         </asp:DropDownList>
                         <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:wholesaleConnectionString %>' SelectCommand="SELECT DISTINCT prodstock.size FROM prodstock INNER JOIN product ON prodstock.PID = product.Pid"></asp:SqlDataSource>
                     </div>
                                                        <div class="form-group col-md-4" >

      <asp:Button runat="server" class="btn btn-success" type="submit" text="Search" OnClick="btnsearch_Click" ID="btnsearch"></asp:Button>

                                </div>
</div>
                <hr />
             <h4>  <asp:Label Text="Available Stock" ID="label1" runat="server" Style="color:green;"></asp:Label>
              <div class="mt-0" style="float: right;background-color:white" >
                  <asp:HyperLink runat="server" ID="go" NavigateUrl="~/admin/lowstock.aspx"  Font-Size="14" Text="View Low Stock" ForeColor="BlueViolet"></asp:HyperLink>
                  <asp:Button runat="server" Text="View All Records" ID="btnvw" OnClick="btnvw_Click"  class="btn btn-dark"></asp:Button></div>
                        </h4><br />  <div class="table-responsive">
                               <asp:Panel runat="server" ID="panel11">
                                <asp:GridView ID="gvproduct" runat="server" OnRowDataBound="gvproduct_RowDataBound" ShowHeaderWhenEmpty="true" DataKeyNames="PID" ShowFooter="true" OnRowCancelingEdit="gvproduct_RowCancelingEdit" OnRowEditing="gvproduct_RowEditing" OnRowUpdating="gvproduct_RowUpdating" OnRowDeleting="gvproduct_RowDeleting"

                                                                       AllowPaging="False" AutoGenerateColumns="False"  class="table table-bordered table-centered table-hover mb-0"  CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                       <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                                                                       <EditRowStyle BackColor="#999999"></EditRowStyle>

                                                                       <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Width="100%"></FooterStyle>

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
          
        </asp:TemplateField>
      
           <asp:TemplateField HeaderText="Item">
            <ItemTemplate>
                 <asp:Label ID="vwprod"  Text= '<%# Bind("pname") %>'
                     runat="server"  Width="100px">
                                            </asp:Label>
            </ItemTemplate>
           
          
            </asp:TemplateField>
       
                <asp:TemplateField HeaderText="Min Stock Level">
            <ItemTemplate>
                <asp:Label ID="level" runat="server" Text='<%# Bind("minlevel") %>'  ></asp:Label>
            </ItemTemplate>
           
             <EditItemTemplate>
                <asp:TextBox ID="minlevel" CssClass="form-control" runat="server" Text='<%# Bind("minlevel") %>'  Width="100px"></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>
  <asp:TemplateField HeaderText="Available Stock">
            <ItemTemplate>
                <asp:Label ID="lblqty" runat="server" Text='<%# Bind("quantity") %>' ></asp:Label>
            </ItemTemplate>
           
             <EditItemTemplate>
                <asp:TextBox ID="txtqty" CssClass="form-control" runat="server" Text='<%# Bind("quantity") %>'  Width="100px"></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>


     
             <asp:TemplateField HeaderText="Price">
            <ItemTemplate>
                <asp:Label ID="lblsp" runat="server" Text='<%# Bind("sellingprice") %>'  Width="60px"></asp:Label>
            </ItemTemplate>
          <EditItemTemplate>
                <asp:TextBox ID="txtsp" CssClass="form-control" runat="server" Text='<%# Bind("sellingprice") %>'  Width="100px"></asp:TextBox>
            </EditItemTemplate>
            
        </asp:TemplateField>
              <asp:TemplateField HeaderText="Total Stock Price">
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Convert.ToInt32(Eval("Quantity"))* Convert.ToDouble(Eval("sellingprice")) %>'  Width="100px"></asp:Label>
            </ItemTemplate>
       
        </asp:TemplateField>
           <asp:TemplateField HeaderText="Status">
            <ItemTemplate>
                <asp:Label ID="lblstatus" runat="server" Text='<%# Bind("status") %>'  ></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="status" CssClass="form-control" runat="server" Text='<%# Bind("status") %>'  Width="100px"></asp:TextBox>
            </EditItemTemplate>
            
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Action">
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
                                     <h4 style="text-align:center">  <asp:Label Text="Available Stock" ID="label2" runat="server" Style="color:red;" Visible=false></asp:Label>
                                         </h4>
                               </asp:Panel>
               </div>
            </div> <!-- end card-body-->
        </div> <!-- end card-->
    </div> <!-- end col -->
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
            { extend: 'excel', text: 'Excel ', className: '  uil-file-times', filename: 'productstock', exportOptions: { modifier: { page: 'all'}} },
            { extend: 'pdf', text: 'PDF', className: ' mdi mdi-file-outline', filename: 'productstock', orientation: 'Portrait', pageSize: 'LEGAL', exportOptions: { modifier: { page: 'all' }, columns: [0, 1, 2,3,4,5,6,7,8]} },
            'colvis'
            ],
            columnDefs: [{ targets: -1, visible: false}]
        });

    });
</script>
     
    </asp:Content>
                  
