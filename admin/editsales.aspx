<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/adminmaster.Master"  CodeFile="editsales.aspx.cs" Inherits="wholesale.admin.editsales" %>

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
                <asp:Repeater ID="rptr" runat="server">
                    <ItemTemplate>
                 <div class="row mb-2">
                    <div class="col-sm-12">
                        <div class="form-row">
                       <div class="form-group col-md-3">
                        <label for="brand">Customer Name</label>
                           <asp:DropDownList runat="server" ID="ddlcust" class="form-control" DataSourceID="SqlDataSource2" DataTextField="cname" DataValueField="cid">
                           </asp:DropDownList>
                           <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:wholesaleConnectionString %>' SelectCommand="SELECT [cname],[cid] FROM [Customer]"></asp:SqlDataSource>
                       </div>

                       <div class="form-group col-md-3">
                        <label for="brand">Invoice Number </label>
                        <asp:Textbox  ID="txtinv" runat="server" class="form-control" type="text" name="brand"  Text='<%# Eval("orderno") %>' placeholder="Inv Number">
                            </asp:Textbox>

                    </div>
                            
                             <div class="form-group col-md-3">
                        <label for="brand">Due Date </label>
                        <asp:Textbox  ID="txtdue" runat="server" class="form-control" TextMode="date" name="brand"  value="dd-mm-yyyy">
                            
                            </asp:Textbox>
                    </div>
                              
</div>
</div></div></ItemTemplate></asp:Repeater>

               
                         
                        
                <asp:GridView ID="Gridview1" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" runat="server"  DataKeyNames="orderno" ShowFooter="false" AutoGenerateColumns="False" class="table table-bordered table-centered table-hover mb-0">



                <Columns>
    <asp:TemplateField HeaderText="Sr.No" >
                                <ItemTemplate>
                                    <asp:Label ID="sno" Text='<%# Bind("sno") %>'
                                        runat="server" >
                                    </asp:Label>
                                </ItemTemplate>



                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Items">
                                <ItemTemplate>
                                    <asp:Label ID="lblbrd2" runat="server" Text='<%# Bind("productid") %>'></asp:Label>
                                </ItemTemplate>
                                  <EditItemTemplate>
                                    <asp:TextBox ID="product" CssClass="form-control" runat="server" Text='<%# Bind("productid") %>' Width="100px"></asp:TextBox>
                                </EditItemTemplate>

                            </asp:TemplateField>

                    <asp:TemplateField HeaderText="Quantity">
                                <ItemTemplate>
                                    <asp:Label ID="lblsm" runat="server" Text='<%# Bind("quantity") %>'></asp:Label>
                                </ItemTemplate>

                                <EditItemTemplate>
                                    <asp:TextBox ID="quantity" CssClass="form-control" runat="server" Text='<%# Bind("quantity") %>' Width="100px"></asp:TextBox>

                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Price">
                                <ItemTemplate>
                                    <asp:Label ID="lblclr" runat="server" Text='<%# Bind("price") %>' Width="100px"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="price"  CssClass="form-control" runat="server" Text='<%# Bind("price") %>' Width="100px"></asp:TextBox>
                                </EditItemTemplate>


                            </asp:TemplateField>
                            
                               <asp:TemplateField HeaderText="Total">
                                <ItemTemplate>
                                    <asp:Label ID="lbltot" runat="server" Text='<%# Bind("total") %>'></asp:Label>
                                </ItemTemplate>

                              
                                   </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action" ItemStyle-Width="20">
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
                    <FooterStyle ForeColor="#000066" />
</asp:GridView>
                    


                <br />
                  <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                 <div class="col-sm-12">
                        <div class="float-right mt-0 mt-sm-0">
                <p> <b>Sub-Total : </b>  <div class="input-group"> <asp:TextBox ID="txttot"  class="form-control"  runat="server"  ReadOnly="true"></asp:TextBox>
                    <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroupPrepend">Rs</span>
            </div></div></p>
                 
                                 <p> <b>Discount(in Rs)  :  </b>                                      <div class="input-group">

                                     <asp:TextBox ID="discounts" OnTextChanged="discounts_TextChanged1" AutoPostBack="true" Text='<%# Bind("discount") %>' class="form-control" runat="server"   ></asp:TextBox> <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroupPrepend">Rs</span>
            </div></div></p>
                                   <p> <b> GST:</b> <asp:Label ID="txtgst"    Text="5 %"   runat="server" ></asp:Label></p>
                            
                              <h4>  Grand Total :  <asp:Label ID="grand" Text='<%# Bind("grand") %>'  runat="server"></asp:Label>Rs</h4>

              </div> 
</div>
                 <div class="row mb-2">
                    <div class="col-sm-12">
                        <div class="form-row">
                             <div class="form-group col-md-3">
                                  
                                   
                        <label for="brand">Paid Amount</label>
                                     <div class="input-group">
                     <asp:TextBox runat="server"  ID="Txtpaid"  class="form-control" OnTextChanged="Txtpaid_TextChanged" AutoPostBack="true" Text='<%# Bind("paid") %>'></asp:TextBox>
                    <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroupPrepend">Rs</span>
            </div>
                                      </div>
                                 </div>
                             <div class="form-group col-md-3">
                        <label for="brand">Due Amount</label>
                     <div class="input-group">
                     <asp:TextBox runat="server"  ID="note"  class="form-control" ReadOnly="true" Text='<%# Bind("due") %>'></asp:TextBox>
                          <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroupPrepend">Rs</span>
            </div></div> </ItemTemplate></asp:Repeater>
                    </div>
                       <div class="form-group col-md-3">
                        <label for="brand">Payment Mode</label>
                      <asp:DropDownList runat="server" ID="ddlpay" class="form-control">
                                                    <asp:ListItem>NA</asp:ListItem>
                                                    <asp:ListItem>By Cash</asp:ListItem>
                             <asp:ListItem>By Debit card</asp:ListItem>
                           <asp:ListItem>Online Payment</asp:ListItem>

                        </asp:DropDownList>
                    </div>
                           
                             <div class="form-group col-md-3">
                        <label for="brand">Payment Status</label>
                      <asp:DropDownList runat="server" ID="ddlstatus" class="form-control">
                          <asp:ListItem>Pending</asp:ListItem>
                          <asp:ListItem>Paid</asp:ListItem>

                        </asp:DropDownList>
                    </div>
                      </div>
                            
                          </div>  
  
                      <div class="form-group col-md-3">
            <asp:Button runat="server"  Id="save" class="btn btn-primary" type="submit" text="Update Order" Width="150px" />
                        
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
     
    </asp:Content>

