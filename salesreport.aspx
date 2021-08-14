<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="salesreport.aspx.cs" Inherits="wholesale.salesreport" %>



<%@ Register assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>


<!DOCTYPE html>

<html>
<head >
    
    <meta charset="utf-8" />
    <title> Sales Report |Wholesale </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
    <!-- App favicon -->
    <link rel="shortcut icon" href="admin/admin-assets/images/favicon.ico">
    <!-- third party css -->
    <!-- Datatables css -->
<link href="admin/admin-assets/css/vendor/dataTables.bootstrap4.css" rel="stylesheet" type="text/css" />
<link href="admin/admin-assets/css/vendor/responsive.bootstrap4.css" rel="stylesheet" type="text/css" />
    <link href="admin/admin-assets/css/vendor/dataTables.bootstrap4.css" rel="stylesheet" type="text/css" />
    <link href="admin/admin-assets/css/vendor/responsive.bootstrap4.css" rel="stylesheet" type="text/css" />
    <link href="admin/admin-assets/css/vendor/buttons.bootstrap4.css" rel="stylesheet" type="text/css" />
    <link href="admin/admin-assets/css/vendor/select.bootstrap4.css" rel="stylesheet" type="text/css" />
    <link href="admin/admin-assets/css/vendor/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
    <!-- third party css end -->
    <!-- App css -->
    <link href="admin/admin-assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <link href="admin/admin-assets/css/app-modern.min.css" rel="stylesheet" type="text/css" id="light-style" />
    <link href="admin/admin-assets/css/app-modern-dark.min.css" rel="stylesheet" type="text/css" id="dark-style" />
    <!--fontawesome-->
    <link rel="stylesheet" href="lib/font-awesome/css/font-awesome.min.css" />

    <!-- Ladda style -->
    <link rel="stylesheet" href="lib/ladda/ladda-themeless.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="lib/Ionicons/css/ionicons.min.css">
    <!-- Summernote css -->
    <link href="admin/admin-assets/css/vendor/summernote-bs4.css" rel="stylesheet" type="text/css" />
    <!-- SimpleMDE css -->
    <link href="admin/admin-assets/css/vendor/simplemde.min.css" rel="stylesheet" type="text/css" />

    <!--blueimp file upload-->
    <link rel="stylesheet" href="lib/jQuery-File-Upload-9.21.0/css/jquery.fileupload.css" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- Google Font -->

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    
 <script type="text/javascript" src="/crystalreportviewers/js/crviewer/crv.js">
      </script> 
</head>
<body class="loading" data-layout="detached" data-layout-config='{"leftSidebarCondensed":false,"darkMode":false, "showRightSidebarOnStart": false}'>
    <form id="form1" runat="server">


               

         <div class="navbar-custom topnav-navbar topnav-navbar-dark">
    <div class="container-fluid">
        <!-- LOGO -->
        <a href="dashboard.aspx" class="topnav-logo">
    <span class="topnav-logo-lg">
      
    </span>  <h1 style="color:white">Waheguru Creation</h1>
    <span class="topnav-logo-sm">
        
    </span>
</a>
        <ul class="list-unstyled topbar-right-menu float-right mb-0">
            <li class="dropdown notification-list">
                <a class="nav-link" target="_blank" href="dashboard.aspx">
                    <i class="dripicons-home noti-icon"></i>
                </a>
            </li>
            <li class="dropdown notification-list">
                <a class="nav-link right-bar-toggle" href="javascript: void(0);">
                    <i class="dripicons-gear noti-icon"></i>
                </a>
            </li>
          
            
    <li class="dropdown notification-list">
        <a class="nav-link dropdown-toggle nav-user arrow-none mr-0" data-toggle="dropdown" id="topbar-userdrop"
           href="#" role="button" aria-haspopup="true" aria-expanded="false">
            <span class="account-user-avatar">
                <img src="admin/admin-assets/images/users/avatar-1.jpg" alt="user-image" class="rounded-circle">
            </span>
            <span>
                <span class="account-user-name"> <asp:Label ID="Label2" runat="server"></asp:Label>  </span>
             
                    <span class="account-position"></span>               
            </span>
        </a>
        <div class="dropdown-menu dropdown-menu-right dropdown-menu-animated topbar-dropdown-menu profile-dropdown"
             aria-labelledby="topbar-userdrop">
            <!-- item-->
            <div class=" dropdown-header noti-title">
                <h6 class="text-overflow m-0">Welcome ! </h6>
            </div>
            <!-- item-->
            <a class="dropdown-item notify-item"  href="changepass.aspx">
                <i class="mdi mdi-account-circle mr-1"></i>
                <span>My Account</span>
            </a>

            <!-- item-->
          
            <!-- item-->
            <a class="dropdown-item notify-item" href="login.aspx">
             <asp:LinkButton ID="link_loginout" runat="server" class="dropdown-item notify-item" OnClick="link_loginout_Click">  <i class="mdi mdi-logout mr-1"></i><span>Log Out</span></asp:LinkButton>
       
        </a>       
             </div>
    </li>




        </ul>
        <a class="button-menu-mobile disable-btn">
            <div class="lines">
                <span></span>
                <span></span>
                <span></span>
            </div>
        </a>
       
    </div>
</div>

    <!-- end Topbar -->
    <!-- Start Content-->
    <div class="container-fluid">
        <!-- Begin page -->
        <div class="wrapper">
            <!-- ========== Left Sidebar Start ========== -->
            <div class="left-side-menu left-side-menu-detached">
                <div class="leftbar-user">
    <a href="javascript: void(0);">
        <img src="admin/admin-assets/images/users/avatar-1.jpg" alt="user-image" height="42" class="rounded-circle shadow-sm">
        <span class="leftbar-user-name">  <asp:Label ID="Label1" runat="server" Text="superadmin"></asp:Label>  
</span>       
            <i class="fa fa-circle text-success"></i>           
                <span> Online as Admin</span>           
       
    </a>
    </div>
                <!--- Sidemenu -->
                <ul class="metismenu side-nav">

   
    <li class="side-nav-title side-nav-item">Home</li>
    <li class="side-nav-item">
        <a href="admin/dashboard.aspx" class="side-nav-link">
            <i class="uil-home-alt"></i>
            <span> Dashboard </span>
        </a>
    </li>
 <li class="side-nav-title side-nav-item">Master</li>
    <li class="side-nav-item mm-">
        <a href="admin/customer.aspx" class="side-nav-link">
            <i class=" uil-users-alt"></i>
            <span> Customers </span>
                       

        </a>
    </li>
    <li class="side-nav-item mm-">
        <a href="admin/supplierlist.aspx" class="side-nav-link">
            <i class=" uil-truck"></i>
            <span> Suppliers </span>
            

        </a>
         
    </li>
    <li class="side-nav-item mm-">
        <a href="admin/employeelist.aspx" class="side-nav-link">
            <i class=" mdi mdi-account-group"></i>
            <span> Employees </span>
            </a>          
    </li>
 
  <li class="side-nav-item mm-">
        <a href="#" class="side-nav-link">
            <i class=" dripicons-checklist"></i>
            <span> Inventory </span>
                        <span class="menu-arrow"></span>

        </a>
         <ul class="side-nav-second-level" aria-expanded="false">
            <li>
                <a href="admin/brand.aspx">Brand</a>
            </li>
            <li>
                <a href="admin/category.aspx">Category</a>
            </li>
              <li>
                <a href="admin/subcategory.aspx"> Sub Category</a>
            </li>
            <li>
                <a href="admin/productlist.aspx">Product</a>
            </li>
             <li>
                <a href="admin/material.aspx">Material</a>
            </li>
            </ul>
    </li>
    <li class="side-nav-item mm-">
        <a href="#" class="side-nav-link">
            <i class=" dripicons-basket"></i>
            <span> Stock </span>
                        <span class="menu-arrow"></span>

        </a>
         <ul class="side-nav-second-level" aria-expanded="false">
            <li>
                <a href="admin/stockmaster.aspx">Product Stock</a>
            </li>
            <li>
                <a href="admin/materialstock.aspx">Material Stock</a>
            </li>
             
            </ul>
    </li>
       <li class="side-nav-title side-nav-item">Order</li>

        <li class="side-nav-item">
        <a href="#" class="side-nav-link">
            <i class="uil-store"></i>
            <span> Sales </span>
             <span class="menu-arrow"></span> 
        </a>
        <ul class="side-nav-second-level" aria-expanded="false">
            <li>
                <a href="admin/addsales.aspx">Add Order</a>
            </li>
           <li>
                <a href="admin/salesorder.aspx">Generate Invoice</a>
            </li>
            </ul>
    </li>
  
        <li class="side-nav-item">
        <a href="admin/onlineorder.aspx" class="side-nav-link">
            <i class="  uil-cart"></i>
            <span> Online Orders </span>
            
        </a>
        
    </li>
    <li class="side-nav-item">
        <a href="javascript: void(0);" class="side-nav-link">
            <i class="mdi mdi-cart-arrow-right"></i>
            <span> Purchase </span>
            <span class="menu-arrow"></span> 
        </a>
       <ul class="side-nav-second-level" aria-expanded="false">
            <li>
                <a href="admin/addpurchase.aspx">Add Purchase Bill</a>
            </li>
           <li>
                <a href="admin/ReceivedOrder.aspx">Purchase Invoice</a>
            </li>
            <li>
                <a href="admin/purchaselist.aspx"> Generate Purchase Order</a>
            </li>
           
            
            </ul>
    </li>
                   
                     <li class="side-nav-title side-nav-item">Others</li>
                       <li class="side-nav-item">
        <a href="javascript: void(0);" class="side-nav-link">
            <i class="dripicons-wallet"></i>
            <span> Expense </span>
            <span class="menu-arrow"></span>
        </a>
       <ul class="side-nav-second-level" aria-expanded="false">
            <li>
                <a href="admin/addexpense.aspx">Add Expense</a>
            </li>
            <li>
                <a href="admin/expense.aspx">Manage Expense</a>
            </li>
            </ul>
    </li>
      
        <li class="side-nav-item">
        <a href="javascript: void(0);" class="side-nav-link">
            <i class=" dripicons-graph-bar"></i>
            <span> Reports </span>
            <span class="menu-arrow"></span>
        </a>
        <ul class="side-nav-second-level" aria-expanded="false">
            <li>
                <a href="salesreport.aspx">Sales</a>
            </li>
            <li>
                <a href="purchaseReport.aspx">Purchase </a>
            </li>
            <li>
                <a href="manfproducts.aspx">Inventory Report</a>
            </li>
              <li>
                <a href="productreview.aspx">Product Review Report</a>
            </li>
            <li>
                <a href="expensereport.aspx">Expense</a>
            </li>
           
            </ul>
    </li>
  
  
      
  
    </ul>
                 <div class="clearfix"></div>
                <!-- Sidebar -left -->
            </div>
   
<div class="content-page">
                <div class="content">
                <div class="content">
</div>

  <div class="row">
    <div class="col-12">
        <div class="page-title-box">
             <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Other</a></li>
                    <li class="breadcrumb-item active">Reports</li>
                        </ol>
            </div>
            <h4 class="page-title"> Sales Report</h4>
        </div>
          
        </div>
     </div>
   
     
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                
             





        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div style="text-align:center;text-size-adjust:auto;font-size:16px">
                        Start Date: <asp:TextBox runat="server" TextMode="Date" ID="to" ></asp:TextBox> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              End Date: <asp:TextBox runat="server" TextMode="Date" ID="from" ></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Button runat="server" ID="Load" Text="Load" OnClick="Load_Click" BackColor="Black" ForeColor="White" Font-Size="Large"/>
        <hr/>
        
    
          <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" ReportSourceID="CrystalReportSource1" HasRefreshButton="True" PageZoomFactor="80"  ToolPanelView="GroupTree" HasCrystalLogo="False" GroupTreeStyle-ForeColor="#000066" GroupTreeStyle-BorderWidth="0" />
        <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
            <Report FileName="CrystalReport1.rpt">
            </Report>
        </CR:CrystalReportSource>
       
         </div>
   </div>
                  </div>
        </div></div>
       <footer class="footer">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">
                2020 - 2021 © Waheguru Creation
            </div>
         
            </div>
     
    </div>
</footer>
               

             </div></div>
    <div class="right-bar">
    <div class="rightbar-title">
        <a href="javascript:void(0);" class="right-bar-toggle float-right">
            <i class="dripicons-cross noti-icon"></i>
        </a>
        <h5 class="m-0">Settings</h5>
    </div>
    <div class="rightbar-content h-100" data-simplebar>
        <div class="p-3">
            <div class="alert alert-warning" role="alert">
                <strong>Customize </strong> the overall color scheme, sidebar menu, etc.
            </div>
            <!-- Settings -->
            <h5 class="mt-3">Color Scheme</h5>
            <hr class="mt-1" />
            <div class="custom-control custom-switch mb-1">
                <input type="radio" class="custom-control-input" name="color-scheme-mode" value="light"
                       id="light-mode-check" checked />
                <label class="custom-control-label" for="light-mode-check">Light Mode</label>
            </div>
            <div class="custom-control custom-switch mb-1">
                <input type="radio" class="custom-control-input" name="color-scheme-mode" value="dark"
                       id="dark-mode-check" />
                <label class="custom-control-label" for="dark-mode-check">Dark Mode</label>
            </div>
            <!-- Left Sidebar-->
            <h5 class="mt-4">Left Sidebar</h5>
            <hr class="mt-1" />
            <div class="custom-control custom-switch mb-1">
                <input type="radio" class="custom-control-input" name="compact" value="fixed" id="fixed-check"
                       checked />
                <label class="custom-control-label" for="fixed-check">Scrollable</label>
            </div>
            <div class="custom-control custom-switch mb-1">
                <input type="radio" class="custom-control-input" name="compact" value="condensed"
                       id="condensed-check" />
                <label class="custom-control-label" for="condensed-check">Condensed</label>
            </div>
            <button class="btn btn-primary btn-block mt-4" id="resetBtn">Reset to Default</button>
           
        </div> <!-- end padding-->
    </div>
</div>

<div class="rightbar-overlay"></div>
         </form>
    <!-- /Right-bar -->
    <!-- bundle -->
    <script src="admin/admin-assets/js/vendor.min.js"></script>
    <script src="admin/admin-assets/js/app.min.js"></script>
    <!-- third party js -->

    <script src="admin/admin-assets/js/vendor/jquery.dataTables.min.js"></script>
    <script src="admin/admin-assets/js/vendor/dataTables.bootstrap4.js"></script>
    <script src="admin/admin-assets/js/vendor/dataTables.responsive.min.js"></script>
    <script src="admin/admin-assets/js/vendor/responsive.bootstrap4.min.js"></script>
    <script src="admin/admin-assets/js/vendor/dataTables.buttons.min.js"></script>
    <script src="admin/admin-assets/js/vendor/buttons.bootstrap4.min.js"></script>
    <script src="admin/admin-assets/js/vendor/buttons.html5.min.js"></script>
    <script src="admin/admin-assets/js/vendor/buttons.flash.min.js"></script>
    <script src="admin/admin-assets/js/vendor/buttons.print.min.js"></script>
    <script src="admin/admin-assets/js/vendor/dataTables.keyTable.min.js"></script>
    <script src="admin/admin-assets/js/vendor/dataTables.select.min.js"></script>

    <script src="admin/admin-assets/js/vendor/apexcharts.min.js"></script>
    <script src="admin/admin-assets/js/vendor/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="admin/admin-assets/js/vendor/jquery-jvectormap-world-mill-en.js"></script>


    <!-- Ladda -->
    <script src="lib/ladda/spin.min.js"></script>
    <script src="lib/ladda/ladda.min.js"></script>
    <script src="lib/ladda/ladda.jquery.min.js"></script>
    <!-- SlimScroll -->
    <script src="lib/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="lib/fastclick/lib/fastclick.js"></script>


    <!-- Plgins rating  only -->
    <script src="admin/admin-assets/js/vendor/jquery.rateit.min.js"></script>
    <script src="admin/admin-assets/js/ui/component.rating.js"></script>
    <!-- Plgins rangeSlider only -->
    <script src="admin/admin-assets/js/vendor/ion.rangeSlider.min.js"></script>
    <script src="admin/admin-assets/js/ui/component.range-slider.js"></script>


    <!-- dragula js-->
    <script src="admin/admin-assets/js/vendor/dragula.min.js"></script>
    <script src="admin/admin-assets/js/ui/component.dragula.js"></script>


    <!-- demo app for databate -->
    <script src="admin/admin-assets/js/pages/demo.datatable-init.js"></script>
    <!-- end demo js-->
    <!-- google maps api -->
    <script src="https://maps.google.com/maps/api/js"></script>
    <script src="admin/admin-assets/js/vendor/gmaps.min.js"></script>
    <!-- third party js ends -->
    <!-- demo google-maps app -->
    <script src="admin/admin-assets/js/pages/demo.google-maps.js"></script>
    <!-- end demo js-->
    <!-- demo vector-maps app -->
    <!-- third party js -->
    <script src="admin/admin-assets/js/vendor/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="admin/admin-assets/js/vendor/jquery-jvectormap-world-mill-en.js"></script>
    <script src="admin/admin-assets/js/vendor/jquery-jvectormap-us-merc-en.js"></script>
    <script src="admin/admin-assets/js/vendor/jquery-jvectormap-in-mill-en.js"></script>
    <script src="admin/admin-assets/js/vendor/jquery-jvectormap-au-mill-en.js"></script>
    <script src="admin/admin-assets/js/vendor/jquery-jvectormap-us-il-chicago-mill-en.js"></script>
    <script src="admin/admin-assets/js/vendor/jquery-jvectormap-uk-mill-en.js"></script>
    <script src="admin/admin-assets/js/vendor/jquery-jvectormap-ca-lcc-en.js"></script>
    <script src="admin/admin-assets/js/vendor/jquery-jvectormap-europe-mill-en.js"></script>
    <script src="admin/admin-assets/js/vendor/jquery-jvectormap-fr-merc-en.js"></script>
    <script src="admin/admin-assets/js/vendor/jquery-jvectormap-es-merc.js"></script>
    <script src="admin/admin-assets/js/vendor/jquery-jvectormap-es-mill.js"></script>

    <script src="admin/admin-assets/js/pages/demo.vector-maps.js"></script>
    <!-- end demo js-->
    <!-- Dropzone js -->
    <script src="admin/admin-assets/js/vendor/dropzone.min.js"></script>
    <!-- File upload js -->
    <script src="admin/admin-assets/js/ui/component.fileupload.js"></script>

    <!-- Summernote js -->
    <script src="admin/admin-assets/js/vendor/summernote-bs4.min.js"></script>
    <!-- SimpleMDE js -->
    <script src="admin/admin-assets/js/vendor/simplemde.min.js"></script>
    <!-- Summernote demo -->
    <script src="admin/admin-assets/js/pages/demo.summernote.js"></script>
    <!-- SimpleMDE demo -->
    <script src="admin/admin-assets/js/pages/demo.simplemde.js"></script>

    <!-- demo app -->
    <script src="admin/admin-assets/js/pages/demo.form-wizard.js"></script>
    <!-- third party js ends -->
    <!-- demo app -->
    <script src="admin/admin-assets/js/pages/demo.dashboard.js"></script>
    <!-- end demo js-->
    <!-- third party js ends -->
    <script src="js/site89a2.js?v=Y6O1nvXDRn_QkK9fiY2kwGeRnrQE-hNcg-n2f6OJhDo"></script>
    <script type='text/javascript'>

        function OpenModal() {
            $('[id*=myModal]').modal('show');
        }
    </script>
 
</body>


</html>


    
  
