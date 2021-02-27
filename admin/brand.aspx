<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false"  MasterPageFile="~/adminmaster.Master"  CodeFile="brand.aspx.cs" Inherits="wholesale.brand" %>


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
                    <li class="breadcrumb-item active">Brand</li>
                </ol>
            </div>
            <h4 class="page-title">Brand</h4>
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
               
                     <div class="col-sm-6">
                        <div class="text-sm-right">
                           <asp:Button Id="excel" class="btn btn-dark mb-2" runat="server" Text="Export to Excel" OnClick="excel_Click"></asp:Button>

                            <asp:Button Id="print" class="btn btn-secondary mb-2" runat="server" Text="Export to Word" OnClick="print_Click"></asp:Button>
                        </div>
                    </div></div>
                           <div class="row mb-2">
                    <div class="col-sm-12">
                        <div class="form-row">
                       <div class="form-group col-md-4">
                        <label for="brand">Brand Name</label>
                        <asp:Textbox  ID="txtbrand" runat="server" class="form-control" type="text" name="brand"  placeholder="Brand">
                            </asp:Textbox>
                                                   
                                   </div>
                             <div class="form-group col-md-3">
                        <label for="example-select">Status</label>
                        <asp:DropDownList runat="server" ID="status" class="form-control">
                           <asp:ListItem>Active</asp:ListItem>
                           <asp:ListItem>Disable</asp:ListItem>
                        </asp:DropDownList>
                    </div>  
                       <div class="form-group col-md-4">
          <label for="brand">Upload Brand Image</label>
              <asp:FileUpload ID="fuImg01" runat="server" /> 
              </div>

                    

                 
                    <div class="mt-3 form-group col-md-4">

                             <asp:Button runat="server" class="btn btn-outline-primary"   Text="Add Brand" ID="addbrand" OnClick="addbrand_Click"></asp:Button>
                    </div>
                   </div>
                   
                     <hr/>
                    <div class="table-responsive">
                 
                                    <asp:Panel runat="server" ID="panel11">

                            <asp:GridView ID="gvbrand" runat="server" ShowHeaderWhenEmpty="true"
                                AllowPaging="false" AutoGenerateColumns="False" class="table table-bordered table-centered  table-hover mb-0" OnRowCancelingEdit="gvbrand_RowCancelingEdit" OnRowDeleting="gvbrand_RowDeleting"
                                OnRowEditing="gvbrand_RowEditing" OnRowUpdating="gvbrand_RowUpdating" DataKeyNames="ID" CellPadding="4" ForeColor="#333333" GridLines="None">

                                <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                                <Columns>
                                    <asp:TemplateField HeaderText="Sr.No" ItemStyle-Width="100">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                        <ItemStyle Width="2%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Image">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpimgname" runat="server"></asp:Label>
                                            <img height="80px" width="80px" src="/Brands/<%# Eval("imageurl") %>" alt="<%# Eval("brand") %>" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <img height="80px" width="80px" src="/Brands/<%# Eval("imageurl") %>" alt="<%# Eval("brand") %>" />
                                            <asp:FileUpload ID="fuimg02" runat="server" />




                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Brand">
                                        <ItemTemplate>
                                            <asp:Label ID="lblName" runat="server" Text='<%# Bind("Brand") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtbrand1" CssClass="form-control" runat="server" Text='<%# Bind("Brand") %>'></asp:TextBox>
                                        </EditItemTemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                                                                 <span class="badge badge-success float-centre">

                                            <asp:Label ID="lblValue" runat="server" Text='<%# Bind("status") %>'></asp:Label>
                                                                                     </span>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtstatus1" CssClass="form-control" runat="server" Text='<%# Bind("status") %>'></asp:TextBox>
                                        </EditItemTemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText=""  ItemStyle-Width="30">
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
            </div> 
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

<script>
    $(document).ready(function () {
        $('#<%= gvbrand.ClientID%>').prepend($("<thead></thead>").append($("#<%= gvbrand.ClientID%>").find("tr:first"))).DataTable({
            stateSave: true,
            
               
        });

    });
</script>
    </asp:Content>