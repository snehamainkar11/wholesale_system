<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/adminmaster.Master" CodeFile="addexpense.aspx.cs" Inherits="wholesale.addexpense" %>

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
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Order</a></li>
                    <li class="breadcrumb-item active">Expense</li>
                <%--</ol>--%>
            </div>
            <h4 class="page-title">Add Expense</h4>
        </div>
    </div>
</div>
<!-- end page title -->
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                                        <asp:Label ID="lblErrorMessage" Text="" runat="server" Visible="true" role="alert" ForeColor="Red" />

     <div class="form-row" >
          <div class="form-group col-md-4" >
        <label for="validationCustom01">Code/Bill No</label>
        <asp:TextBox runat ="server"  class="form-control" id="code"
            placeholder="XX345626"  required></asp:TextBox>
        <div class="valid-feedback">
            Looks good!
        </div>
    </div>
     <div class="form-group col-md-4" >
        <label for="validationCustom01">Expense Name</label>
        <asp:TextBox runat ="server"  class="form-control" id="name"
            placeholder="Expense Name"  required></asp:TextBox>
        <div class="valid-feedback">
            Looks good!
        </div>
    </div>
          <div class="form-group col-md-4" >
        <label for="validationCustom06">Date</label>
        <asp:TextBox runat ="server" type="date" class="form-control" id="edate"
            placeholder="dd-mm-yyyy"  required></asp:TextBox>
        <div class="valid-feedback">
            Looks good!
        </div>
    </div>
         </div>
    
         <div class="form-row" >

     <div class="form-group col-md-8" >
        <label for="validationCustom06">External Company Name</label>
        <asp:TextBox runat ="server" type="text" class="form-control" id="company"
            placeholder="Comapny Name"  required></asp:TextBox>
        <div class="valid-feedback">
            Looks good!
        </div>
    </div>
         </div>
        <div class="form-row" >

     <div class="form-group col-md-4" >
                        <label for="example-select">Category</label>
                        <asp:DropDownList runat="server" class="form-control" ID="ecategory" OnSelectedIndexChanged="ecategory_SelectedIndexChanged" AutoPostBack="true">
                           <asp:ListItem>Light Bill</asp:ListItem>
                           <asp:ListItem>Rent</asp:ListItem>
                           <asp:ListItem>Maintenance</asp:ListItem>
                            <asp:ListItem>Food</asp:ListItem>
                            <asp:ListItem>Employee Salary</asp:ListItem>

                        </asp:DropDownList>
                    </div>  
     <div class="form-group col-md-4" >
        <label for="validationCustom06">Amount</label>
        <asp:TextBox runat ="server" type="number" class="form-control" id="amt"
            placeholder="Amount"  required></asp:TextBox>
        <div class="valid-feedback">
            Looks good!
        </div>
    </div>
     <div class="form-group col-md-4" >
        <label for="validationCustom06">VAT %</label>
        <asp:TextBox runat ="server" type="number" class="form-control" id="vat"
            placeholder="%"  required></asp:TextBox>
        <div class="valid-feedback">
            Looks good!
        </div>
    </div>

                 
     
     <div class="form-group col-md-4" >
                        <label for="example-select">Billable</label>
                        <asp:DropDownList runat="server" class="form-control" ID="billable">
                           <asp:ListItem>Yes</asp:ListItem>
                           <asp:ListItem>No</asp:ListItem>
     
                        </asp:DropDownList>
                    </div>  
 
     <div class="form-group col-md-4" >
                        <label for="example-select">Payment Status</label>
                        <asp:DropDownList runat="server" class="form-control" ID="status">
                           <asp:ListItem>Pending</asp:ListItem>
                           <asp:ListItem>Completed</asp:ListItem>
                        </asp:DropDownList>
                    </div>  

      </div>
                           <hr />                                  <div class="form-row">
   
                <div class="form-group col-md-2">

    <asp:Button runat="server" class="btn btn-primary" type="submit" text="Save" width="120px" Id= "save" OnClick="save_Click" />
</div>
                     <div class="form-group col-md-2">
            <asp:Button runat="server"  Id="clear" class="btn btn-danger" type="clear" Width="120px" text="Cancel" OnClick="clear_Click" />
                        
              </div> </div>
</div></div>
          
</div>


                </div> 
    </asp:Content>
