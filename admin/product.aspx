<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/adminmaster.Master"CodeBehind="product.aspx.cs" Inherits="wholesale.product" %>
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
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Inventory</a></li>
                    <li class="breadcrumb-item active">Product Details</li>
                        <%--</ol>--%>
            </div>
            <h4 class="page-title">Product Details</h4>
        </div>
         <h1>  <asp:HyperLink  runat="server" href="productlist.aspx"  style=" float:right;color:black;" class=" mdi mdi-format-list-bulleted-square"></asp:HyperLink></h1>
    </div>
</div>
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <div class="row mb-2">
                    <div class="col-sm-7">
                        <a href="addproduct.aspx" class="btn btn-light mb-2"><i class="mdi mdi-plus-circle mr-2"></i> Add Product</a>
                    </div>
                      

                  
                    <div class="col-sm-8">
                        <div class="text-sm-left">
                           <asp:Label ID="lblSuccessMessage" Text="" runat="server" ForeColor="Green" />
                            <br />
                            <asp:Label ID="lblErrorMessage" Text="" runat="server" ForeColor="Red" />

                        </div>
                    </div>
                </div>
                 <div class="row">
                <asp:Repeater ID="rptrProducts" runat="server">

           <ItemTemplate>
              
               <div class="col-4 col-md-4">
                 <div class="card mb-4">
            <div class="card-img">
                   
              <img  class="card-img-top card-img-front" height="200px" width="200px" src="/Products/<%# Eval("PID") %>/<%# Eval("ImageName") %><%# Eval("Extension") %>"/>
                </div>
              <div class="card-body px-10">
                              
                                <div class="font-size-xs"><%# Eval ("BrandName") %>  </div>
                   <div class="font-weight-bold"> 
                       <asp:HyperLink ID="vwprod"  Text= '<%# Bind("pname") %>'
                     runat="server"   NavigateUrl='<%# "~/admin/proddetails.aspx?pid=" + Eval("PID") %>'>
                                            </asp:HyperLink> </div>
                   <div class="badge badge-success"> <%# Eval ("status") %></div> 
                   
                 </div>
        </div>
                  
          </div>
              
               </ItemTemplate>
       </asp:repeater>
                </div></div>
            
     
                              
            </div> <!-- end card-body-->
        </div> <!-- end card-->
    </div> <!-- end col -->
</div>

     

          

   
          

    </asp:Content>