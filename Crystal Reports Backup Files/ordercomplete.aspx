<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeFile="ordercomplete.aspx.cs" Inherits="wholesale.ordercomplete" %>
 
<asp:Content ID="conten1" ContentPlaceHolderID="Maincontent" runat="server">  

       

<section class="py-12">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-md-10 col-lg-8 col-xl-6 text-center">
               
                <div class="mb-7 font-size-h1">❤️</div>
               
                <h2 class="mb-5">Your Order is Completed!</h2>
                
                <p class="mb-7 text-gray-500">
                    Your order <span class="text-body text-decoration-underline"><asp:Label runat="server" ID="label1"></asp:Label></span> has been completed. Your order details
                    are shown for your personal accont.
                </p>
               
                <a class="btn btn-dark" href="cart.aspx">
                    View My Orders
                </a>
            </div>
        </div>
    </div>
</section>



    </asp:Content>