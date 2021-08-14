<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/adminmaster.Master" MaintainScrollPositionOnPostBack="true" CodeBehind="addsales.aspx.cs" Inherits="wholesale.admin.addsales" %>
 
<asp:Content ID="content1" ContentPlaceHolderID="admincontent" runat="server">  
       <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
                       <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                       <ContentTemplate>
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
            <h4 class="page-title"> Add Order</h4>
        </div>
          
        </div>
     </div>
   
     
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                
             
       
                <div class="row mb-2">
                    <div class="col-sm-7">
                        
                          <asp:Label ID="lblSuccessMessage"  data-dismiss="alert" aria-label="Close" Text="" Visible="True" runat="server" ForeColor="Green" />
                             
                        <asp:Label ID="lblErrorMessage" Text="" runat="server" Visible="true" ForeColor="Red" />
            </div>
                          
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

                       <div class="form-group col-md-3">
                        <label for="brand">Invoice Number </label>
                        <asp:Textbox  ID="txtinv" runat="server" class="form-control" type="text" name="brand"  placeholder="Inv Number">
                            </asp:Textbox>

                    </div>
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

               
                  <div class="table-responsive">
                   

                     <table style="width: 100%"  class="table table-bordered table-centered table-hover mb-0">
                         <tr>
                             <td>Sr.No</td>
                             <td>Products</td>
                             <td>Quantity</td>
                             <td>Unit Price</td>
                         
                         </tr>
                         <tr>
                             <td> <asp:Textbox  ID="txtsrno" runat="server" class="form-control" type="number" Width="60%"></asp:Textbox>
                        </td>
                             <td> 
                                
                                   <asp:DropDownList runat="server"  class="form-control" ID="ddlproduct"  AutoPostBack="true" OnSelectedIndexChanged="ddlproduct_SelectedIndexChanged" AppendDataBoundItems="true" DataSourceID="SqlDataSource3" DataTextField="pname" DataValueField="PID">

                                     <asp:ListItem Value="-1">Select</asp:ListItem>

                                 </asp:DropDownList>
                      
                                 <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:wholesaleConnectionString %>' SelectCommand="SELECT [pname],[pid] FROM [product]"></asp:SqlDataSource>
          
</td>
                              <td> <asp:Textbox  ID="txtqty" runat="server" class="form-control" type="number"></asp:Textbox>
</td>
 <td> <asp:Textbox  ID="txtprc" runat="server" class="form-control" type="number"></asp:Textbox>
</td> 
                       
                             <td style="border:none">    
                                 

                                 <asp:Button runat="server"    Id="additem" class="btn btn-outline-primary" type="submit" text="Add Item" OnClick="additem_Click"/>
                           
                           </td>
                         </tr>
                     </table>
                       

                  </div>  
              
                         
                 <table style="width: 100%"  class="table table-bordered table-centered table-hover mb-0">
                         <tr>
                             <td width="90%">
             
                        
                <asp:GridView ID="GridView1" runat="server"  ShowFooter="false" AutoGenerateColumns="False" class="table table-bordered table-centered table-hover mb-0">



                <Columns>
<asp:BoundField DataField="sno" HeaderText="Sr. No">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
</asp:BoundField>
<asp:BoundField DataField="product" HeaderText="Item"><HeaderStyle HorizontalAlign="Center"></HeaderStyle>
</asp:BoundField>
<asp:BoundField DataField="quantity" HeaderText="Quantity"><HeaderStyle HorizontalAlign="Center"></HeaderStyle>
</asp:BoundField>
<asp:BoundField DataField="Price" HeaderText="Price">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
</asp:BoundField>
         
<asp:BoundField DataField="total" HeaderText="Total">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
</asp:BoundField>
                   
                </Columns>
                    <FooterStyle ForeColor="#000066" />
</asp:GridView>
                    
</td><td>
      
                  
                    <asp:Button runat="server"  Id="Button1" class="btn btn-outline-danger" type="clear" text="Clear" OnClick="Button1_Click" Visible="false"/>
 
                  
                           </td></tr></table>
                <br />
                
                 <div class="col-sm-12">
                        <div class="float-right mt-0 mt-sm-0">
                <p> <b>Sub-Total : </b>  <div class="input-group"> <asp:TextBox ID="txttot"  class="form-control" Value="0.0"   runat="server"  ReadOnly="true"></asp:TextBox>
                    <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroupPrepend">Rs</span>
            </div></div></p>
                 
                                 <p> <b>Discount(in Rs)  :  </b>                                      <div class="input-group">

                                     <asp:TextBox ID="discounts"  Value="0.0" class="form-control" runat="server"   ></asp:TextBox> <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroupPrepend">Rs</span>
            </div></div></p>
                                   <p>  <b> GST : </b>
 <asp:TextBox ID="txtgst" Text="5" runat="server"  Width="60"></asp:TextBox>             %</p>
                            
                              <h4>  Grand Total :  <asp:Label ID="grand" Text="0.0"  runat="server"></asp:Label>Rs</h4>

              </div> 
</div>
                 <div class="row mb-2">
                    <div class="col-sm-12">
                        <div class="form-row">
                             <div class="form-group col-md-4">
                                  
                                   
                        <label for="brand">Paid Amount</label>
                                     <div class="input-group">
                     <asp:TextBox runat="server"  ID="Txtpaid"  class="form-control" Value="0.0"></asp:TextBox>
                    <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroupPrepend">Rs</span>
            </div>
                                      </div>
                                 </div>
                            
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
            <asp:Button runat="server"  Id="save" class="btn btn-primary" type="submit" text="Create Order" Width="150px" OnClick="save_Click"/>
                        
</div>
                  
</div>
                </div>
</div>

            </div>

 
                           </ContentTemplate>
                    <Triggers>
 <asp:AsyncPostBackTrigger ControlID="Button1"  EventName="Click" />
                         <asp:AsyncPostBackTrigger ControlID="additem"  EventName="Click" />

 </Triggers>
 </asp:UpdatePanel>   
           </div>   
</asp:Content>   

   
<asp:Content ID="content2" ContentPlaceHolderID="footer" runat="server"> 
     
            <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
   $(function () {

           
            $('#<%=discounts.ClientID %>').blur(function () {
                 var txttot = parseFloat($('#<%=txttot.ClientID %>').val())

                var disCount = parseFloat($('#<%=discounts.ClientID %>').val())
                var gst = parseFloat($('#<%=txtgst.ClientID %>').val())

                 var x= parseFloat(txttot + parseFloat((txttot*gst)/100))
                if (!isNaN(disCount)) {
                  
                    $('#<%=grand.ClientID %>').text(parseFloat(x) - parseFloat(disCount));
                
}

            })
       $('#<%=txtgst.ClientID %>').blur(function () {
           var txttot = parseFloat($('#<%=txttot.ClientID %>').val())

                var disCount = parseFloat($('#<%=discounts.ClientID %>').val())
             var gst = parseFloat($('#<%=txtgst.ClientID %>').val())

             var x = parseFloat(txttot + parseFloat((txttot * gst) / 100))
             if (!isNaN(disCount)) {

                 $('#<%=grand.ClientID %>').text(parseFloat(x) - parseFloat(disCount));

             }

         })


        })
</script>

    </asp:Content>

