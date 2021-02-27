<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/adminmaster.Master"CodeFile="addproduct.aspx.cs" Inherits="wholesale.addproduct" %>
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
                    <li class="breadcrumb-item active">Product</li>
                <%--</ol>--%>
            </div>
            <h4 class="page-title">Add Product</h4>
        </div>
    </div>
</div>
<!-- end page title -->
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
             
   <asp:Label ID="lblSuccessMessage" Text="" runat="server" ForeColor="Green" />
            <br />
            <asp:Label ID="lblErrorMessage" Text="" runat="server" ForeColor="Red" />

   
      <div class="form-row">

    <div class="form-group col-md-4">
        <label for="validationCustom01">Product Code</label>
        <asp:TextBox runat ="server"  class="form-control" id="prodcode"
            placeholder="XXX0399"  required=""></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Code" ControlToValidate="prodcode" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                                
    </div>
    <div class="form-group col-md-4">
        <label for="validationCustom02">Product Name</label>
        <asp:TextBox runat ="server" type="text" class="form-control" id="prodname"
            placeholder="Product Name"  required=""></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Name" ControlToValidate="prodname" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                                
    </div>
     <div class="form-group col-md-4" >
        <label for="validationCustom04">Type</label>
        <asp:DropDownList runat="server" ID="ddltype" class="form-control">
                           <asp:ListItem>MEN</asp:ListItem>
                           <asp:ListItem>WOMEN</asp:ListItem>
                           <asp:ListItem>KIDS</asp:ListItem>

                        </asp:DropDownList>
       </div>
           <div class="form-group col-md-4" >
        <label for="validationCustom04">Brand</label>
        <asp:DropDownList runat="server" class="form-control" ID="ddlbrand">
                        </asp:DropDownList>
       
    </div>  
     <div class="form-group col-md-4" >
        <label for="validationCustom04">Category</label>
         <asp:DropDownList runat="server" AutoPostBack="true" class="form-control" ID="ddlcategory" OnSelectedIndexChanged="ddlcategory_SelectedIndexChanged">    
                        </asp:DropDownList>
         </div>
        <div class="form-group col-md-4" >
        <label for="validationCustom04">Sub Category</label>
         <asp:DropDownList runat="server" class="form-control" ID="ddlsubcat" OnSelectedIndexChanged="ddlsubcat_SelectedIndexChanged">    
                        </asp:DropDownList>
       </div>
 
               
    <div class="form-group col-md-4" >
        <label for="validationCustom04">Size</label>
        <asp:TextBox runat ="server" type="number" class="form-control" id="size"
            placeholder="in CM"  required=""></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Size" ControlToValidate="size" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
        
    </div> 
    <div class="form-group col-md-4" >
        <label for="validationCustom04">Color</label>
        <asp:DropDownList runat="server" ID="ddlcolor" class="form-control">
                           <asp:ListItem>Black</asp:ListItem>
                           <asp:ListItem>Blue</asp:ListItem>
                           <asp:ListItem>Sky Blue</asp:ListItem>
                           <asp:ListItem>Gray</asp:ListItem>

                        </asp:DropDownList>
       
    </div>  
 <div class="form-group col-md-4" >
        <label for="validationCustom04">Length</label>
        <asp:DropDownList runat="server" ID="ddllength" class="form-control">
                           <asp:ListItem>Crop</asp:ListItem>
                           <asp:ListItem>Full Length</asp:ListItem>
                           <asp:ListItem>Ankle Length</asp:ListItem>

                        </asp:DropDownList>
     </div>
         <div class="form-group col-md-4">
        <label for="validationCustom06"> Unit Price</label>
        <asp:TextBox runat ="server" type="number" class="form-control" id="unitprc"
            placeholder="in Rs"  required=""></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Price" ControlToValidate="unitprc" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
        
    </div>
   <div class="form-group col-md-4">
        <label for="validationCustom05">Quantity</label>
      <asp:TextBox  runat ="server" type="number" class="form-control" ID="quantity"
            placeholder="Quantity" required=""></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Quantity" ControlToValidate="quantity" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
        
    </div>
      <div class="form-group col-md-4">
        <label for="validationCustom06">Discount %</label>
        <asp:TextBox runat ="server" type="number" class="form-control" id="discount"
            placeholder="%"  required=""></asp:TextBox>
        
    </div>
  
          
            <div class="form-group col-md-3">
        <label for="validationCustom05">Selling Price</label>
      <asp:TextBox runat ="server" type="number" class="form-control" id="sellingprc"
            placeholder="Selling price" required=""></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter Price" ControlToValidate="sellingprc" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
        
    </div>
           <div class="form-group col-md-3">
        <label for="validationCustom05">MFG date</label>
      <asp:TextBox runat ="server" type="date" class="form-control" id="ddt"
            placeholder="dd/mm/yyyy" required=""></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Enter Date" ControlToValidate="ddt" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
        
    </div>
          <div class="form-group col-md-3" >
        <label for="validationCustom04">Status</label>
        <asp:DropDownList runat="server" ID="ddlstatus" class="form-control">
                           <asp:ListItem>In Stock</asp:ListItem>
                           <asp:ListItem>Out Of Stock</asp:ListItem>
                        </asp:DropDownList>
       
    </div> 
            <div class="form-group col-md-3">
        <label for="validationCustom05">Reorder Level</label>
      <asp:TextBox runat ="server" type="number" class="form-control" id="minlevel"
            placeholder="Min Stock level" required=""></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Enter Level" ControlToValidate="minlevel" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
        
    </div>
    <div class="form-group col-md-8">
        <label for="validationCustom03">Product Details</label>
      <asp:TextBox runat ="server"  TextMode="MultiLine" type="text" class="form-control" ID="desc"
            placeholder="Description" ></asp:TextBox>
       
    </div>
           <div class="form-group col-md-8">
        <label for="validationCustom03">Material and Care</label>
      <asp:TextBox runat ="server"  TextMode="MultiLine" type="text" class="form-control" ID="materialcare"
            placeholder="Description" ></asp:TextBox>
       
    </div>
        </div></div>
       </div>    

    
    
        <span class="fa-header" style="color:black"><b>Add Product Images</b></span>
      <hr>
    <div class="row">
        <div class="col-md-12">
        <div class="card">
            <div class="card-body">
          <div class="form-group col-md-4">
        
              <asp:FileUpload ID="fuImg01" runat="server" /> 
              </div>
                  <div class="form-group col-md-4">
                <asp:FileUpload ID="fuImg02" runat="server" /> 
                      </div>
                  <div class="form-group col-md-4">
                <asp:FileUpload ID="fuImg03" runat="server" /> 
                      </div>
                  <div class="form-group col-md-4">

                <asp:FileUpload ID="fuImg04" runat="server" /> 
         
                  </div>
                    <asp:Button runat="server" class="btn btn-primary" type="submit" text="Submit" OnClick="btnadd_Click" ID="btnadd"></asp:Button>

                </div>
            </div>
            </div>
    </div>
   </div>


   
    </div>
</asp:Content>