<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/adminmaster.Master" CodeFile="proddetails.aspx.cs" Inherits="wholesale.proddetails" %>

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
                    <li class="breadcrumb-item"><a href="/admin/product.apsx">Product</a></li>
                    <li class="breadcrumb-item active">View Product</li>
                </ol>
            </div>
            <h4 class="page-title">Product Details</h4>
                    
        </div>
    </div>
</div>
<!-- end page title -->

<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-lg-5">
                        <!-- Product image -->
                       
                        
                <asp:Repeater ID="rptrImage" runat="server">
          <ItemTemplate>         
    <div class="d-lg-flex d-none justify-content-center">
       
          
           
      <img   class="card-img-top card-img-front" height="250px" width="100px" src="/Products/<%# Eval("ProID") %>/<%# Eval("Name")%><%# Eval("Extension") %>" alt="<%# Eval("Name") %>" >
        
           
    </div>     
   </ItemTemplate>
</asp:Repeater>
           
                       
                    </div> <!-- end col -->
                    <div class="col-lg-7">
                      <asp:Repeater ID="rptrProductDetails" runat="server">
                <ItemTemplate>                          <h4> <a  href="productlist.aspx"  ><i class="uil-arrow-left"></i>Back</a> </h4>

                            <!-- Product title -->
                            <h3 class="mt-0"><%# Eval("PName") %>
                         </h3>
                            <p class="mb-1"></p>
                           
                     <h4 class="mt-0">Product Code : <%# Eval("pcode") %></h4>
                    <div class="mb-7">
                    <span style="font-size:large;font-weight:bold; color:lightblue; text-decoration:line-through;"><%#Eval("unitprice")%> Rs</span>&nbsp;
                    <span  class="col-md-3" style="font-size:x-large;font-weight:bold;color:salmon"><%#Eval("sellingprice")%> Rs</span>
                        <span  style="font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif font-weight:bold;color:gray">(<%#Eval("discount")%> % Off)</span>
                        </div>
                            <div class="mt-3">
                                <h4><span class="badge badge-success-lighten"><%#Eval("status")%></span></h4>
                            </div>
                    <div class="row">
                            <div class="col-md-4" style="background-color:lavender" >
                                <h6 class="font-14">Brand:</h6>
                                
                                 <p class="text-sm lh-150"><%#Eval("brand")%></p>
                           </div>
                          <div class="col-md-4" style="border:solid;border-color:lavender">
                                <h4 class="font-14">Category:</h4>
                                <p class="text-sm lh-150"><%#Eval("category")%></p>
                            </div>
                      
                      <div class="col-md-4 " style="background-color:lavender">
                                <h4 class="font-14">Subcategory:</h4>
                                <p class="text-sm lh-150"><%#Eval("subcatname")%></p>
                            </div>
                        </div>
                     
                         
                                <h6 class="font-14">Quantity</h6>
                                <div class="d-flex">
                                    <asp:TextBox runat="server" min="1" ID="qty" TextMode="Number"  Text='<%#Eval("quantity")%>' class="form-control" style="width: 90px;"/>
                                    <asp:Button runat="server" class="btn btn-danger ml-2" text="Update"  ID="btnadd" OnClick="btnadd_Click" />
                                </div>
                           
                    <h2 class="font-14">Specifications :</h2>
                                <div class="row">
                                    
                                    <div class="col-md-4" style=" border :solid;border-color:lavender">
                                        <h4 class="font-14">Size:</h4>
                                        <p class="text-sm lh-150"><%#Eval("size")%></p>
                                    </div>
                                    <div  class="col-md-4"  style=" border :solid;border-color:lavender">
                                        <h4 class="font-14">Color:</h4>
                                        <p class="text-sm lh-150"><%#Eval("color")%> </p>
                                    </div>
                                     <div  class="col-md-4" style="border:solid; border-color:lavender">
                                        <h4 class="font-14">Length:</h4>
                                        <p class="text-sm lh-150"><%#Eval("length")%> </p>
                                    </div>
                          
                            
                         </div>
                   
                   <hr />    
                     
                    <ul class="nav nav-tabs nav-justified nav-bordered mb-3">
    <li class="nav-item">
        <a href="#home-b2" data-toggle="tab" aria-expanded="false" class="nav-link">
            <i class="mdi mdi-home-variant d-md-none d-block"></i>
            <span class="d-none d-md-block">Product Description</span>
        </a>
    </li>
    <li class="nav-item">
        <a href="#profile-b2" data-toggle="tab" aria-expanded="true" class="nav-link active">
            <i class="mdi mdi-account-circle d-md-none d-block"></i>
            <span class="d-none d-md-block">Material And Care</span>
        </a>
    </li>
                        </ul>
                  <div class="tab-content">
    <div class="tab-pane" id="home-b2">
        <p> <%#Eval("pdesc")%></p>
    </div>
    <div class="tab-pane show active" id="profile-b2">
      <p> <%#Eval("materialcare")%></p>
    </div>
   
</div>         </div>   
                         
                         
                           

                             </ItemTemplate>
                      </asp:Repeater>
                        <div class="container">
       
    <div class="col-md-12">
        <div class="bg-dragula p-2 p-lg-4">
           <div class="row">
            <div class="col-12">
                 <h4 class="mb-10 text-center">Customer Reviews</h4>
                </div></div>
            <div id="handle-dragula-right" class="py-2">
                  <div class="col-6 col-md-auto">
             
                                                                     <div style="float:left;color:green;font-weight:bold;font-size:18px"><asp:Label runat="server" ID="lblrvw"></asp:Label></div>

                        </div>
                                  <div class="col-12 col-md-auto">
 <asp:Repeater ID="rptr1" runat="server">
                <ItemTemplate>
                 <p class="font-22" style="float:right">
                              <div class="rateit rateit-mdi" data-rateit-mode="font" data-rateit-icon=""  data-rateit-value= <%#Eval("AverageRating")%>   data-rateit-ispreset="true" data-rateit-readonly="true">
</div>
                            </p>
                           </ItemTemplate>    </asp:Repeater>       </div>
                    </div>
                 <asp:Repeater ID="rptr" runat="server">
                <ItemTemplate>
                <div class="card mb-0 mt-2">
                
                    <div class="card-body p-3">

                        <div class="media">

                            <div class="media-body">

                              <h4 class="mb-0" style="color:black">  <%#Eval("title")%> </h4>
                             <p class="mb-1 mt-1"> By <%#Eval("username")%></p>

                                <p class="mb-0">  <%#Eval("feedback")%> </p>
                                                              <div class="rateit rateit-mdi" data-rateit-mode="font" data-rateit-icon=""  data-rateit-value= <%#Eval("ratings")%>   data-rateit-ispreset="true" data-rateit-readonly="true">

                            </div> <!-- end media-body -->
                            
                        </div> <!-- end media -->
                    </div> <!-- end card-body -->
                </div>
                    </div><!-- end col -->
                    </ItemTemplate>
              </asp:Repeater>  
               
            </div> <!-- end company-list-2-->
        </div> <!-- end div.bg-light-->
    </div> <!-- end col -->
         </div>
                    </div>
</div> <!-- end row -->
                       
  
             </div> <!-- end card-->
    </div> <!-- end col-->
</div>



</div>
                   
       
    </asp:Content>