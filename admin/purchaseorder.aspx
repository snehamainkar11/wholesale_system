<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/adminmaster.Master" CodeFile="purchaseorder.aspx.cs" Inherits="wholesale.admin.purchaseorder" %>

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
            <h4 class="page-title"> Purchase Order</h4>
        </div>
          
        </div>
     </div>
   
     
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                                  <asp:Panel ID="panel1" runat="server" >

             
       
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
                       <div class="form-group col-md-4">
                        <label for="brand">Supplier Name</label>
                      <asp:DropDownList runat="server" ID="ddlsup" class="form-control">
                          
                        </asp:DropDownList>
                    </div>

                       <div class="form-group col-md-4">
                        <label for="brand">Purchase Order Number </label>
                        <asp:Textbox  ID="txtpo" runat="server" class="form-control" type="text" name="brand"  placeholder="PO Number">
                            </asp:Textbox>
                    </div>
                            
                             
                            
</div>
</div></div>
                 
                  <div class="table-responsive">
                     <table style="width: 100%"  class="table table-bordered table-centered table-hover mb-0">
                         <tr style="background-color:lavender;color:black">
                             <td>Sr.No</td>
                             <td>Material</td>
                             <td>Quantity</td>
                             <td>Price</td>
                         </tr>
                         <tr>
                             <td> <asp:Textbox  ID="txtsrno" runat="server" class="form-control" type="number" Width="60%"></asp:Textbox>
                        </td>
                             <td> <asp:DropDownList runat="server" class="form-control" ID="ddlmaterial1" AutoPostBack="true" OnSelectedIndexChanged="ddlmaterial1_SelectedIndexChanged" AppendDataBoundItems="true" DataSourceID="SqlDataSource1" DataTextField="mname" DataValueField="mid">

                    <asp:ListItem Value="-1">Select</asp:ListItem>

                </asp:DropDownList>

                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:wholesaleConnectionString %>' SelectCommand="SELECT [mname] ,[mid]  FROM [Material]"></asp:SqlDataSource>
          
</td>
                              <td> <asp:Textbox  ID="txtqty" runat="server" class="form-control" type="number"></asp:Textbox>
</td>
 <td> <asp:Textbox  ID="txtprc" runat="server" class="form-control" type="number"></asp:Textbox>
</td>
                             <td style="border:none">
                                 <asp:Button runat="server"  Id="additem" class="btn btn-outline-primary" type="submit" text="Add Item" OnClick="additem_Click"/>
                             </td>
                            
                         </tr>
                     </table>
                  </div>
                                      <table  style="width: 100%" ><tr>
<td>
                <asp:GridView ID="GridView1" runat="server"  ShowFooter="false" AutoGenerateColumns="false" class="table table-bordered table-centered table-hover mb-0">



                <Columns>
<asp:BoundField DataField="sno" HeaderText="Sr. No">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
</asp:BoundField>
<asp:BoundField DataField="material" HeaderText="Item"><HeaderStyle HorizontalAlign="Center"></HeaderStyle>
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

                         </td>       &nbsp;       <td style="border:none">
                           <asp:Button runat="server"  Id="Button1" class="btn btn-outline-danger" type="clear" Visible="false" text="Clear" OnClick="Button1_Click" />

                             </td>
                                </tr>      </table>
                <asp:Label runat="server" ID="Label3" Font-Bold="True" ForeColor="black" ></asp:Label>

                                      <div class="col-sm-11">
                        <div class="float-right mt-0 mt-sm-0">

                              <h4>  Grand Total :  <asp:Label ID="grand" Text="0.0"    runat="server"></asp:Label> Rs</h4>
                            </div></div>
</asp:Panel>
                <br />
                  <div class="row mb-2">

                <div class="form-group col-md-3">
            <asp:Button runat="server"  Id="save" class="btn btn-primary" type="submit" text="Generate Order"  Width="150px" OnClick="save_Click"/>
                        
</div>
                    
</div>

            </div>

    </div>
      </div>
</asp:Content>            


   
<asp:Content ID="content2" ContentPlaceHolderID="footer" runat="server"> 
     
               
                    
              </asp:Content>