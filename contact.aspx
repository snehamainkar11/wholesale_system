<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="contact.aspx.cs" Inherits="wholesale.contact" %>

	<asp:Content ID="conten1" ContentPlaceHolderID="Maincontent" runat="server">  
		

<!-- BREADCRUMB -->
<nav class="py-5">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <!-- Breadcrumb -->
                <ol class="breadcrumb mb-0 font-size-xs text-gray-400">
                    <li class="breadcrumb-item">
                        <a class="text-gray-400" href="index.aspx">Home</a>
                    </li>
                    <li class="breadcrumb-item active">
                        Contact Us
                    </li>
                </ol>
            </div>
        </div>
    </div>
</nav>
<!-- CONTENT -->
<section class="pt-7 pb-12">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <!-- Heading -->
                <h3 class="mb-10 text-center">Contact Us</h3>
            </div>
        </div>
        <div class="row justify-content-between">
            <div class="col-12 col-md-4 col-xl-3">
                <aside class="mb-9 mb-md-0">
                    <!-- Heading -->
                    <h6 class="mb-6">
                        <i class="fe fe-phone text-primary mr-4"></i> Call to Us:
                    </h6>
                    <!-- Text -->
                    <p class="text-gray-500">
                        We're available from 10 am - 10 pm EST,
                        7 days a week.
                    </p>
                    <p>
                        <strong>Customer Service:</strong><br>
                        <a class="text-gray-500" href="tel:60146-389-574">6-146-389-574</a>
                    </p>
                    <p class="mb-0">
                        <strong>Careers:</strong><br>
                        <a class="text-gray-500" href="tel:60146-389-574">6-146-389-574</a>
                    </p>
                    <!-- Divider -->
                    <hr>
                    <!-- Heading -->
                    <h6 class="mb-6">
                        <i class="fe fe-mail text-primary mr-4"></i> Write to Us:
                    </h6>
                    <!-- Text -->
                    <p class="text-gray-500">
                        Fill out our form and we will contact you
                        within 24 hours.
                    </p>
                    <p>
                        <strong>Customer Service:</strong><br>
                        <a class="text-gray-500" href="mailto:customer@example.com">customer@example.com</a>
                    </p>
                    <p class="mb-0">
                        <strong>Careers:</strong><br>
                        <a class="text-gray-500" href="mailto:careers@example.com">careers@example.com</a>
                    </p>
                  
                  
                </aside>
            </div>
            <div class="col-12 col-md-8">
                <!-- Form -->
                <form>
                    <!-- Email -->
                    <div class="form-group">
                        <label class="sr-only" for="contactName">
                            Your Name *
                        </label>
                        <input class="form-control form-control-sm" id="contactName" type="text" placeholder="Your Name *" required>
                    </div>
                    <!-- Email -->
                    <div class="form-group">
                        <label class="sr-only" for="contactEmail">
                            Your Email *
                        </label>
                        <input class="form-control form-control-sm" id="contactEmail" type="email" placeholder="Your Email *" required>
                    </div>
                    <!-- Email -->
                    <div class="form-group">
                        <label class="sr-only" for="contactTitle">
                            Title *
                        </label>
                        <input class="form-control form-control-sm" id="contactTitle" type="text" placeholder="Title *" required>
                    </div>
                    <!-- Email -->
                    <div class="form-group mb-7">
                        <label class="sr-only" for="contactMessage">
                            Message *
                        </label>
                        <textarea class="form-control form-control-sm" id="contactMessage" rows="5" placeholder="Message *" required></textarea>
                    </div>
                    <!-- Button -->
                    <button class="btn btn-dark">
                        Send Message
                    </button>
                </form>
            </div>
        </div>
    </div>
</section>

		</asp:Content>