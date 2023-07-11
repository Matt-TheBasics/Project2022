<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="CodingPackFrontRevised.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- About Start -->
    <div class="container py-5">
        <div class="row py-5">
            <div class="col-lg-7 pb-5 pb-lg-0 px-3 px-lg-5">
                <h4 class="text-secondary mb-3">About Us</h4>
                <h1 class="display-4 mb-4"><span class="text-primary">Mission</span> & <span class="text-secondary">Vision</span></h1>
                <h5 class="text-muted mb-3">FORA is a shelter for unwanted dogs and cats, situated in Krugersdorp (Mogale City) Gauteng. </h5>
                <p class="mb-4">We adhere to a pro quality of life policy and operate on the three R's principal - Rescue, Rehabilitate and Rehome.</p>
                <ul class="list-inline">
                    <li><h5><i class="fa fa-check-double text-secondary mr-3"></i>Best Quality Care</h5></li>
                    <li><h5><i class="fa fa-check-double text-secondary mr-3"></i>Daily Exercise</h5></li>
                    <li><h5><i class="fa fa-check-double text-secondary mr-3"></i>Health Requirements</h5></li>
                </ul>
                <a href="contact.aspx" class="btn btn-lg btn-primary mt-3 px-4">Learn More</a>
            </div>
            <div class="col-lg-5">
                <div class="row px-3">
                    <div class="col-12 p-0">
                        <img class="img-fluid w-100" src="img/about-1.jpg" alt="">
                    </div>
                    <div class="col-6 p-0">
                        <img class="img-fluid w-100" src="img/about-2.jpg" alt="">
                    </div>
                    <div class="col-6 p-0">
                        <img class="img-fluid w-100" src="img/about-3.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- About End -->


    <!-- Features Start -->
    <div class="container-fluid bg-light">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-5">
                    <img class="img-fluid w-100" src="img/feature.jpg" alt="">
                </div>
                <div class="col-lg-7 py-5 py-lg-0 px-3 px-lg-5">
                    <h4 class="text-secondary mb-3">What we do:</h4>
                    <h1 class="display-4 mb-4"><span class="text-primary">We take special care of our</span> furry friends </h1>
                    <p class="mb-4">FORA is a quality of life shelter for 350 unwanted dogs and 150 cats. In our care they will be dewormed, vaccinated and sterilised; given any veterinary care needed; given a warm bed and good food.</p>                   
                </div>
            </div>
        </div>
    </div>
    <!-- Features End -->

</asp:Content>
