<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/adminmaster.Master"  CodeBehind="editorder.aspx.cs" Inherits="wholesale.admin.editorder" %>

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
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Order</a></li>
                    <li class="breadcrumb-item active">Purchase</li>
                        </ol>
            </div>
            <h4 class="page-title"> Edit Purchase Order</h4>
        </div>
          
        </div>
     </div>
   
     
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                
             
       
                <div class="row mb-2">
                    <div class="col-sm-7">
                        
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
                          <asp:Panel runat="server" ID="panel1" Visible="true">
                        <asp:Label ID="lblErrorMessage" Text="" runat="server" Visible="true"  role="alert" ForeColor="Red" />
                              </asp:Panel>       </div>
                          
</div>
               
            <div class="row mb-2">
                    <div class="col-sm-12">
                        <div class="form-row">
                       <div class="form-group col-md-4">
                        <label for="brand">Supplier Name</label>
                           <asp:DropDownList runat="server" ID="ddlsup" class="form-control" DataSourceID="SqlDataSource1" DataTextField="company" DataValueField="supid">
                           </asp:DropDownList>
                           <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:wholesaleConnectionString %>' SelectCommand="SELECT [supid], [company] FROM [Supplier]"></asp:SqlDataSource>
                       </div>
 <asp:Repeater ID="rptr" runat="server">
                    <ItemTemplate>
                       <div class="form-group col-md-4">
                        <label for="brand">Purchase Order Number </label>
                        <asp:Textbox  ID="txtpo" runat="server" class="form-control" type="text" Text='<%# Bind("po") %>' name="brand"  placeholder="PO Number">
                            </asp:Textbox>
                    </div>
                       </ItemTemplate></asp:Repeater>        
                            <div class="form-group col-md-4">
                        <label for="brand">Order Date  </label>
                        <asp:Textbox  ID="odate" runat="server" class="form-control" type="date" >
                            </asp:Textbox>
                    </div>   
                                
                            
</div>
</div></div>
              

                <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
       
                <asp:GridView ID="Gridview1"  EnableModelValidation="true" runat="server" OnRowDataBound="Gridview1_RowDataBound" OnRowCommand="Gridview1_RowCommand1" OnRowDeleting="Gridview1_RowDeleting"  DataKeyNames="po" ShowFooter="true" AutoGenerateColumns="False" class="table table-bordered table-centered table-hover mb-0">



                <Columns>
    <asp:TemplateField HeaderText="Sr.No" >
                                <ItemTemplate>
                                    <asp:Label ID="sno" Text='<%# Bind("sno") %>'
                                        runat="server"  Width="30px">
                                    </asp:Label>
                                </ItemTemplate>

        <FooterTemplate>
                                                            
                                            <asp:TextBox ID="txtsno"   runat="server"  Width="80px" />
                                        </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Items">
                                <ItemTemplate>
                                    <asp:Label ID="lblp" runat="server" Text='<%# Bind("material") %>'  Width="200px"></asp:Label>
                                </ItemTemplate>
                                  <EditItemTemplate>
                                    <asp:TextBox ID="product" CssClass="form-control" runat="server" Text='<%# Bind("material") %>' Width="200px"></asp:TextBox>
                                </EditItemTemplate>
                                
                                        <FooterTemplate>
                                            <asp:DropDownList Width="240px" runat="server"  ID="txtproductid" AppendDataBoundItems="true" DataSourceID="SqlDataSource2" DataTextField="mname" DataValueField="mname">

                                                <asp:ListItem Value="-1">Select</asp:ListItem>

                                            </asp:DropDownList>


                                            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:wholesaleConnectionString %>' SelectCommand="SELECT [mname] FROM [Material]"></asp:SqlDataSource>
                                        </FooterTemplate>
                            </asp:TemplateField>

                    <asp:TemplateField HeaderText="Quantity">
                                <ItemTemplate>
                                    <asp:Label ID="lblsm" runat="server" Text='<%# Bind("quantity") %>'></asp:Label>
                                </ItemTemplate>

                                <EditItemTemplate>
                                    <asp:TextBox ID="quantity" CssClass="form-control" runat="server" Text='<%# Bind("quantity") %>' Width="90px"></asp:TextBox>

                                </EditItemTemplate>
                        
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtquantity"   runat="server" Width="94px"  />
                                        </FooterTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Price">
                                <ItemTemplate>
                                    <asp:Label ID="lblclr" runat="server" Text='<%# Bind("price") %>' Width="50px"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="price"  CssClass="form-control" runat="server" Text='<%# Bind("price") %>' Width="50px"></asp:TextBox>
                                </EditItemTemplate>
                                
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtprice" runat="server"  CssClass="calculate" Width="94px" />
                                        </FooterTemplate>

                            </asp:TemplateField>
                            
                               <asp:TemplateField HeaderText="Total" >
                                <ItemTemplate>
                                    <asp:Label ID="lbltot" runat="server" Text='<%# Bind("total") %>' Width="60px"></asp:Label>
                                </ItemTemplate>
                                     <FooterTemplate>
                                            <asp:TextBox ID="txttotal" runat="server"  Width="94px" />
                                        </FooterTemplate>

                              
                                   </asp:TemplateField>
                    
                        <asp:TemplateField HeaderText="Action" ItemStyle-Width="10%">
                            
                                <ItemTemplate >
                                      <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
                                    <asp:ImageButton  Id="Delete" ImageUrl="~/Images/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px" />
                              </ContentTemplate>
            </asp:UpdatePanel>
                                </ItemTemplate>
                               
                            <FooterTemplate>

                                 <asp:ImageButton   Id="add" ImageUrl="~/Images/addnew.png" runat="server" CommandName="AddNew" ToolTip="Add New" Width="20px" Height="20px" />
                             </FooterTemplate>
         
                            </asp:TemplateField>
             
                </Columns>
                    <FooterStyle ForeColor="#000066" />
</asp:GridView>
                </ContentTemplate>
        
</asp:UpdatePanel>     
                  <div class="col-sm-11">
                        <div class="float-right mt-0 mt-sm-0">
                            
                              <h4>Total :  <asp:Label ID="grand" Text='0.0' CssClass="grand"    runat="server"></asp:Label> Rs</h4>
                        
                            </div></div>

  
                      <div class="form-group col-md-3">
            <asp:Button runat="server"  Id="save" class="btn btn-primary" type="submit" text="Update Order" Width="150px" OnClick="save_Click"/>
                        
</div>
                    
</div>
                </div>
</div>

            </div>

    </div>
 
</asp:Content>   

   
<asp:Content ID="content2" ContentPlaceHolderID="footer" runat="server"> 
                <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

     <script type="text/javascript">
        $(document).ready(function () {
            $(".calculate").keyup(function () {
                Calculate();
            });
            function Calculate() {
                $('[id*=Gridview1] tr').each(function () {
                    var row = $(this);
                    var qty = $('[id*=txtquantity]', row).val();
                    var price = $('[id*=txtprice]', row).val();
                    var total;
                    var perc;
                    if (qty != '' && !isNaN(qty) && price != '' && !isNaN(price)) {
                        total = parseFloat(qty) * parseFloat(price);
                         $('[id*=txttotal]', row).val(total);

                    }
                    
                })
               
            }
           
        });

    </script>

    </asp:Content>

           
