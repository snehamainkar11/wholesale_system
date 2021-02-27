<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/adminmaster.Master" CodeFile="addpurchase.aspx.cs" Inherits="wholesale.admin.addpurchase" %>

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
            <h4 class="page-title">Add Received Order</h4>
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
                   </asp:Panel>     <asp:Label ID="lblErrorMessage" Text="" runat="server" Visible="true"  ForeColor="Red" />
            </div>
                           </div>
                 <div class="row mb-2">
                    <div class="col-sm-12">
                        <div class="form-row">
                       <div class="form-group col-md-3">
                        <label for="brand">Supplier </label>
                      <asp:DropDownList runat="server" ID="ddlsup" class="form-control">
                          
                        </asp:DropDownList>
                    </div>

                       <div class="form-group col-md-3">
                        <label for="brand">Invoice Number </label>
                        <asp:Textbox  ID="txtnum" runat="server" class="form-control" type="text"   placeholder="Invoice Number">
                            </asp:Textbox>
                    </div>
                             <div class="form-group col-md-3">
                        <label for="brand">Invoice Amount </label>
                        <asp:Textbox  ID="txtinv" runat="server" class="form-control" type="number"  placeholder=" Amount in RS">
                            
                            </asp:Textbox>
                    </div>
           
                     
                  <div class="form-group col-md-3">
                        <label for="brand">Due Amount </label>
                        <asp:Textbox  ID="txtrem" runat="server" class="form-control" value="0.0" type="number"  placeholder=" Amount Pending in RS">
                            
                            </asp:Textbox>
                                    
                  
</div>
                    </div>
                    <div class="table-responsive">
                     <table style="width: 80%"  class="table table-bordered table-centered table-hover mb-0">
                         <tr>
                             <td style="width: 20%">Sr.No</td>
                             <td  style="width: 40%">Material</td>
                             <td>Quantity</td>
                                 
                         </tr>
                         <tr>
                             <td style="width: 20%"> <asp:Textbox  ID="txtsrno" runat="server" class="form-control" type="number" Width="60%"></asp:Textbox>
                        </td>
                             <td  style="width: 40%"> <asp:DropDownList runat="server" class="form-control" ID="ddlmaterial1"  AppendDataBoundItems="true" DataSourceID="SqlDataSource1" DataTextField="mname" DataValueField="mid">

                    <asp:ListItem Value="-1">Select</asp:ListItem>

                </asp:DropDownList>

                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:wholesaleConnectionString %>' SelectCommand="SELECT [mname] ,[mid]  FROM [Material]"></asp:SqlDataSource>
          
</td>
                              <td> <asp:Textbox  ID="txtqty" runat="server" class="form-control" type="number"></asp:Textbox>
</td>
                              <td style="border:none">    
                                  <asp:Button runat="server"  Id="additem" class="btn btn-outline-primary" type="submit" text="Add Item" OnClick="additem_Click" />
</td>
                  </tr>
                        
                        </table>      
                          
                   
                  </div>
                    <asp:GridView ID="GridView1" runat="server"  ShowFooter="false" AutoGenerateColumns="False" class="table table-bordered table-centered table-hover mb-0">



                <Columns>
<asp:BoundField DataField="sno" HeaderText="Sr. No">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
</asp:BoundField>
<asp:BoundField DataField="material" HeaderText="Item"><HeaderStyle HorizontalAlign="Center"></HeaderStyle>
</asp:BoundField>
<asp:BoundField DataField="quantity" HeaderText="Quantity"><HeaderStyle HorizontalAlign="Center"></HeaderStyle>
</asp:BoundField>

</Columns>
                    <FooterStyle ForeColor="#000066" />
</asp:GridView>
                  
                  <div class="form-group col-md-3 mt-3">
                                          <asp:Button runat="server" class="btn btn-outline-primary" type="submit" text="Save" ID="save" OnClick="save_Click"/>
                              </div>
            </div></div></div></div></div></div>
      </div>
</asp:Content>            

