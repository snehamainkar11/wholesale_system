<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/adminmaster.Master"  CodeBehind="editsales.aspx.cs" Inherits="wholesale.admin.editsales" %>

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
                    <li class="breadcrumb-item active">Sales</li>
                        </ol>
            </div>
            <h4 class="page-title"> Edit Order</h4>
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
                          <asp:Panel runat="server" ID="panel1" Visible="false">
                        <asp:Label ID="lblErrorMessage" Text="" runat="server" Visible="true"  role="alert" ForeColor="Red" />
                              </asp:Panel>       </div>
                          
</div>
               
                 <div class="row mb-2">
                    <div class="col-sm-12">
                        <div class="form-row">
                       <div class="form-group col-md-3">
                        <label for="brand">Customer Name</label>
                           <asp:DropDownList runat="server" ID="ddlcust" class="form-control" DataSourceID="SqlDataSource2" DataTextField="cname" DataValueField="cid">
                           </asp:DropDownList>
                           <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:wholesaleConnectionString %>' SelectCommand="SELECT [cname],[cid] FROM [Customer]"></asp:SqlDataSource>
                       </div>
 <asp:Repeater ID="rptr" runat="server">
                    <ItemTemplate>
                       <div class="form-group col-md-3">
                        <label for="brand">Invoice Number </label>
                        <asp:Textbox  ID="txtinv" runat="server" class="form-control" type="text" name="brand"  Text='<%# Eval("orderno") %>' placeholder="Inv Number">
                            </asp:Textbox>

                    </div>
                           </ItemTemplate></asp:Repeater> 
                              <div class="form-group col-md-3">
                        <label for="brand">Order Date </label>
                        <asp:Textbox  ID="odate" runat="server" class="form-control" TextMode="date" name="brand"  value="dd-mm-yyyy">
                            
                            </asp:Textbox>
                    </div>
                             <div class="form-group col-md-3">
                        <label for="brand">Due Date </label>
                        <asp:Textbox  ID="txtdue" runat="server" class="form-control" TextMode="date" name="brand"  value="dd-mm-yyyy">
                            
                            </asp:Textbox>
                    </div>
                              
</div>
</div></div>

               
                         
                        
                <asp:GridView ID="Gridview1" OnRowDataBound="Gridview1_RowDataBound" OnRowCommand="Gridview1_RowCommand"  OnRowDeleting="GridView1_RowDeleting" runat="server"  DataKeyNames="orderno" ShowFooter="true" AutoGenerateColumns="False" class="table table-bordered table-centered table-hover mb-0">



                <Columns>
    <asp:TemplateField HeaderText="Sr.No" >
                                <ItemTemplate>
                                    <asp:Label ID="sno" Text='<%# Bind("sno") %>'
                                        runat="server"  Width="30px">
                                    </asp:Label>
                                </ItemTemplate>

        <FooterTemplate>
                                                            
                                            <asp:TextBox ID="txtsno"  CssClass="form-control" runat="server"  Width="80px" />
                                        </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Items">
                                <ItemTemplate>
                                    <asp:Label ID="lblp" runat="server" Text='<%# Bind("productid") %>'  Width="200px"></asp:Label>
                                </ItemTemplate>
                                  <EditItemTemplate>
                                    <asp:TextBox ID="product" CssClass="form-control" runat="server" Text='<%# Bind("productid") %>' Width="200px"></asp:TextBox>
                                </EditItemTemplate>
                                
                                        <FooterTemplate>
                                              <asp:DropDownList   Width="240px" runat="server" OnSelectedIndexChanged="txtproductid_SelectedIndexChanged" AutoPostBack="true" class="form-control" ID="txtproductid"  AppendDataBoundItems="true" DataSourceID="SqlDataSource3" DataTextField="pname" DataValueField="PID">

                                     <asp:ListItem Value="-1">Select</asp:ListItem>

                                 </asp:DropDownList>
                      
                                 <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:wholesaleConnectionString %>' SelectCommand="SELECT [pname],[pid] FROM [product]"></asp:SqlDataSource>
          
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
                                            <asp:TextBox ID="txtquantity"  CssClass="form-control" runat="server" Width="94px"  />
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
                                            <asp:TextBox ID="txtprice" runat="server"  CssClass="form-control" Width="94px" />
                                        </FooterTemplate>

                            </asp:TemplateField>
                            
                               <asp:TemplateField HeaderText="Total" >
                                <ItemTemplate>
                                    <asp:Label ID="lbltot" runat="server" Text='<%# Bind("total") %>' Width="60px"></asp:Label>
                                </ItemTemplate>

                              
                                   </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action" ItemStyle-Width="10%">
                                <ItemTemplate >
                                     
                                    <asp:ImageButton ImageUrl="~/Images/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px" />
                            
                                </ItemTemplate>
                               
                            <FooterTemplate>
                                 <asp:ImageButton ImageUrl="~/Images/addnew.png" runat="server" CommandName="AddNew" ToolTip="Add New" Width="20px" Height="20px" />
                             </FooterTemplate>
                            </asp:TemplateField>
                </Columns>
                    <FooterStyle ForeColor="#000066" />
</asp:GridView>
                    


                <br />
                  <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                 <div class="col-sm-12">
                        <div class="float-right mt-0 mt-sm-0">
                <p> <b>Sub-Total : </b>  <div class="input-group"> <asp:TextBox ID="txttot"  CssClass="tot"  Enabled="false" runat="server"  ReadOnly="true"></asp:TextBox>
                    <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroupPrepend">Rs</span>
            </div></div></p>
                 
                                 <p> <b>Discount(in Rs)  :  </b>                                      <div class="input-group">

                                     <asp:TextBox ID="discounts"  Text='<%# Bind("discount") %>' CssClass="dis" runat="server"   ></asp:TextBox> <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroupPrepend">Rs</span>
            </div></div></p>
                                   <p> <b> GST:</b> <asp:TextBox ID="txtgst" CssClass="txtgst" Width="60"  Text='<%# Bind("gst") %>'   runat="server" ></asp:TextBox>%</p>
                            
                              <h4>  Grand Total :  <asp:Label ID="grand" Text='<%# Bind("grand") %>' CssClass="grand"  runat="server"></asp:Label>Rs</h4>

              </div> 
</div>
                 <div class="row mb-2">
                    <div class="col-sm-12">
                        <div class="form-row">
                             <div class="form-group col-md-4">
                                  
                                   
                        <label for="brand">Paid Amount</label>
                                     <div class="input-group">
                     <asp:TextBox runat="server"  ID="Txtpaid"  class="form-control"  Text='<%# Bind("paid") %>'></asp:TextBox>
                    <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroupPrepend">Rs</span>
            </div>
                                      </div>
                                 </div>
                              </ItemTemplate></asp:Repeater>
                    
                       <div class="form-group col-md-4">
                        <label for="brand">Payment Mode</label>
                      <asp:DropDownList runat="server" ID="ddlpay" class="form-control">
                                                    <asp:ListItem>NA</asp:ListItem>
                                                    <asp:ListItem>By Cash</asp:ListItem>
                             <asp:ListItem>By Debit card</asp:ListItem>
                           <asp:ListItem>Online Payment</asp:ListItem>

                        </asp:DropDownList>
                    </div>
                           
                             <div class="form-group col-md-4">
                        <label for="brand">Payment Status</label>
                      <asp:DropDownList runat="server" ID="ddlstatus" class="form-control">
                          <asp:ListItem>Pending</asp:ListItem>
                          <asp:ListItem>Paid</asp:ListItem>

                        </asp:DropDownList>
                    </div>
                      </div>
                            
                          </div>  
  
                      <div class="form-group col-md-3">
            <asp:Button runat="server"  Id="save" class="btn btn-primary" type="submit" text="Update Order" Width="150px" Onclick="save_Click"/>
                        
</div>
                     <div class="form-group col-md-2">
                        
</div>
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
   $(function () {

       $('.txtgst').blur(function () {
           var txttot = parseFloat($('.tot').val())

           var disCount = parseFloat($('.dis').val())
           var gst = parseFloat($('.txtgst').val())

           var x = parseFloat(txttot + parseFloat((txttot * gst) / 100))
           if (!isNaN(disCount)) {

               $('.grand').text(parseFloat(x) - parseFloat(disCount));

           }

       })
            $('.dis').blur(function () {
                 var txttot = parseFloat($('.tot').val())

                var disCount = parseFloat($('.dis').val())
                var gst = parseFloat($('.txtgst').val())

                 var x= parseFloat(txttot + parseFloat((txttot*gst)/100))
                if (!isNaN(disCount)) {
                  
                    $('.grand').text(parseFloat(x) - parseFloat(disCount));
                
}

            })


        })
</script>

    </asp:Content>

           
