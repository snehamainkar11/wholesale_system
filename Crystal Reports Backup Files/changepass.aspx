<%@ Page Language="C#" AutoEventWireup="true"MasterPageFile="~/adminmaster.Master" CodeFile="changepass.aspx.cs" Inherits="wholesale.admin.changepass" %>

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
                    <li class="breadcrumb-item"><a href="javascript: void(0);">My Account</a></li>
                </ol>
            </div>
            <h4 class="page-title">Change Password</h4>
        </div>
    </div>
</div>
<!-- end page title -->
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                                        <asp:Label ID="lblErrorMessage" Text="" runat="server" Visible="true" role="alert" ForeColor="Red" />
                                                        <asp:Label ID="lbl" Text="" runat="server" Visible="true" role="alert" ForeColor="Green" />

          <div class="form-group col-md-4" >
        <label for="validationCustom01">Username</label>
        <asp:TextBox runat ="server"  class="form-control" id="uname"
            placeholder="username"  required=""></asp:TextBox>
        <div class="valid-feedback">
            Looks good!
        </div>
    </div>
     <div class="form-group col-md-4" >
        <label for="validationCustom01">Old Password</label>
        <asp:TextBox runat ="server"  class="form-control" id="pass" TextMode="Password"
            placeholder="*********"  required=""></asp:TextBox>
        <div class="valid-feedback">
            Looks good!
        </div>
    </div>
          <div class="form-group col-md-4" >
        <label for="validationCustom06">New Password</label>
        <asp:TextBox runat ="server" TextMode="password" class="form-control" id="npass"
            placeholder="********"  required=""></asp:TextBox>
            <span id="password_strength"></span>

    </div>
          <div class="form-group col-md-4" >
        <label for="validationCustom06">Confirm Password</label>
        <asp:TextBox runat ="server" TextMode="password" class="form-control" id="cpass"
            placeholder="********"  required=""></asp:TextBox>
          <asp:CompareValidator ID="reqcompre_adminpassrepeat" runat="server" ErrorMessage="Password doesn't match" ControlToValidate="cpass" ControlToCompare="npass" ForeColor="Red" Display="Dynamic" ></asp:CompareValidator>

    </div>
        
      <div class="form-group col-md-10">

    <asp:Button runat="server" class="btn btn-primary" type="submit" text="Change Password"  Id= "save"  OnClick="save_Click" />
</div>
                        
             </div>
</div></div>
          
</div>


                </div> 
    </asp:Content>

<asp:Content ID="content2" ContentPlaceHolderID="footer" runat="server">  
   <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#<%=npass.ClientID %>").bind("keyup", function () {
            if ($(this).val().length == 0) {
                $("#password_strength").html("");
                return;
            }

            var regex = new Array();
            regex.push("[A-Z]"); 
            regex.push("[a-z]"); 
            regex.push("[0-9]"); 
            regex.push("[$@$!%*#?&]");

            var passed = 0;

            for (var i = 0; i < regex.length; i++) {
                if (new RegExp(regex[i]).test($(this).val())) {
                    passed++;
                }
            }


            if (passed > 2 && $(this).val().length > 8) {
                passed++;
            }

            var color = "";
            var strength = "";
            switch (passed) {
                case 0:
                case 1:
                    strength = "Weak";
                    color = "red";
                    break;
                case 2:
                    strength = "Good";
                    color = "darkorange";
                    break;
                case 3:
                case 4:
                    strength = "Strong";
                    color = "green";
                    break;
                case 5:
                    strength = "Very Strong";
                    color = "darkgreen";
                    break;
            }
            $("#password_strength").html(strength);
            $("#password_strength").css("color", color);
        });
    });
</script>

    </asp:Content>