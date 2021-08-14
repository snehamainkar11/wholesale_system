<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signup.aspx.cs" Inherits="wholesale.signup" %>


<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Waheguru Creation|Sign Up</title>

    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css"/>

    <link rel="stylesheet" href="css/style.css"/>
    <style>
        .role {
  border: 0 none;
  font-size: 14px;
  font-weight: normal;
  padding: 2px 10px;
  width: 378px;
  *width: 350px;
  *background: #58B14C;
}

        #mainselection {
            overflow: hidden;
            width: 350px;
            -moz-border-radius: 9px 9px 9px 9px;
            -webkit-border-radius: 9px 9px 9px 9px;
            border-radius: 9px 9px 9px 9px;
            box-shadow: 1px 1px 11px #330033;
        }
        .auto-style1 {
            height: 38px;
        }
        </style>
</head>
<body>

  
        <section class="signup">
            <div class="container" style="height:600px">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign up</h2>
                        <form  runat="server" style="height: 600px; width: 610px;">
                           
                               <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <asp:TextBox ID="txtname" runat="server" ToolTip="Enter Name" Placeholder="Name" Width="345px"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Name" ControlToValidate="txtname" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                                   </div>

                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <asp:TextBox ID="txtemail"  runat="server"  ToolTip="Enter Username"  Placeholder="Username" Width="342px"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Username" ControlToValidate="txtemail" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>

                            </div>
                                       
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>         
                     <asp:TextBox ID="txtpass"  runat="server" TextMode="Password" ToolTip="Enter Password"
                             Placeholder="Password" Width="351px"></asp:TextBox>
                                                       <span id="password_strength"></span>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Password" ControlToValidate="txtpass" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>

                            </div>
                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                               <asp:TextBox ID="txtconfirm"  runat="server"  TextMode="Password" ToolTip="Confirm Password"  Placeholder="Confirm Password" Width="360px"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Re-peat Password" ControlToValidate="txtconfirm" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                        <asp:CompareValidator ID="reqcompre_adminpassrepeat" runat="server" ErrorMessage="Password doesn't match" ControlToValidate="txtconfirm" ControlToCompare="txtpass" ForeColor="Red" Display="Dynamic" ></asp:CompareValidator>

                            </div>
                            
                    
                            <div class="form-group form-button" id="signup_btn">
                                
                                <asp:Button ID="signup1" runat="server" OnClick="signup1_click" class="form-submit" Text="Register"  />
                                                   
                                   </div>
                                                  

                           
                        </form>
                    </div>
                    <div class="signup-image"> <h3><span style="font-weight:700;font-size:xx-large;color:navy">W</span>aheguru Creation</h3>
                        <figure><img src="/images/signupimg.jpg" alt="sing up image">
                                   <a href="login.aspx" class="signup-image-link">I am already member</a>

                        </figure>    
                        
                    </div>

                </div>
            </div>
          
        </section>

    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#<%=txtpass.ClientID %>").bind("keyup", function () {
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


</body>
    </html>


