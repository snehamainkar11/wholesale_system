<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/adminmaster.Master" CodeBehind="addmaterial.aspx.cs" Inherits="wholesale.addmaterial" %>

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
                    <li class="breadcrumb-item active">Material</li>
                <%--</ol>--%>
            </div>
            <h4 class="page-title">Add Material</h4>
        </div>
    </div>
</div>
<!-- end page title -->
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
              <div class="form-row">

    <div class="form-group col-md-4">
        <label for="validationCustom01">Material Code</label>
        <asp:TextBox runat ="server"  class="form-control" id="validationCustom01"
            placeholder="Material Code"  required></asp:TextBox>
        <div class="valid-feedback">
            Looks good!
        </div>
    </div>
    <div class="form-group col-md-4">
        <label for="validationCustom02">Material Name</label>
        <asp:TextBox runat ="server" type="text" class="form-control" id="validationCustom02"
            placeholder="Material Name"  required></asp:TextBox>
        <div class="valid-feedback">
            Looks good!
        </div>
    </div>
    <div class="form-group col-md-4">
        <label for="validationCustom06">Price</label>
        <asp:TextBox runat ="server" type="number" class="form-control" id="validationCustom06"
            placeholder="Price"  required></asp:TextBox>
        <div class="valid-feedback">
            Looks good!
        </div>
    </div>
                  
       
    <div class="form-group col-md-8">
        <label for="validationCustom03">Description</label>
      <asp:TextBox runat ="server"  TextMode="MultiLine" type="text" class="form-control" id="validationCustom03"
            placeholder="Description" required></asp:TextBox>
        <div class="invalid-feedback">
            Please provide a valid Address.
        </div>
    </div>
    </div>
 <div class="form-row">

    <div class="form-group col-md-4">
        <label for="validationCustom06">Discount %</label>
        <asp:TextBox runat ="server" type="number" class="form-control" id="TextBox1"
            placeholder="%"  required></asp:TextBox>
        <div class="valid-feedback">
            Looks good!
        </div>
    </div>
    <div class="form-group col-md-4">
        <label for="validationCustom05">Available Stock</label>
      <asp:TextBox runat ="server" type="text" class="form-control" id="validationCustom07"
            placeholder="Material In Stock" required></asp:TextBox>
        <div class="invalid-feedback">
            Please provide a valid Data.
        </div>
    </div>
    <div class="form-group col-md-4">
        <label for="validationCustom04">Total Stock Amount</label>
        <asp:TextBox runat ="server"  type="text" class="form-control" 
            placeholder="Amount in Rs." required></asp:TextBox>
        <div class="invalid-feedback">
            Please provide a valid Amt.
        </div>
    </div>
    <div class="form-group col-md-4">
        <label for="validationCustom04">Total Amount Paid</label>
        <asp:TextBox runat ="server"  type="text" class="form-control" 
            placeholder="Amount in Rs." required></asp:TextBox>
        <div class="invalid-feedback">
            Please provide a valid Amt.
        </div>
    </div>   
   </div>
    <asp:Button runat="server" class="btn btn-primary" type="submit" text="Submit"></asp:Button>
</form>
</div></div>
          
</div>


                </div> 
    </asp:Content>
