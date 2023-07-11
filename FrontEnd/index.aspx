<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CodingPackFrontRevised.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <div class="container-fluid p-0">
        <div id="header-carousel" class="carousel slide" data-ride="carousel">         
            <div class="carousel-inner">
                <div class="carousel-item active">
                   <img class="w-auto" src="img/Allfour.jpg" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 500px;">
                            <h3 class="text-white mb-3 d-none d-sm-block">Friends Of Rescued Animals</h3>
                            <h1 class="display-3 text-white mb-3">FORA</h1>
                            <h5 class="text-white mb-3 d-none d-sm-block">FORA is a shelter for unwanted dogs and cats, situated in Krugersdorp (Mogale City) Gauteng. 
                                We adhere to a pro quality of life policy and operate on the three R's principal - Rescue, Rehabilitate and Rehome.</h5>
                            <a href="registe.aspx" class="btn btn-lg btn-primary mt-3 mt-md-4 px-4">Register</a>
                            <a href="login.aspx" class="btn btn-lg btn-primary mt-3 mt-md-4 px-4">Login</a>
                        </div>
                    </div>
                </div>              
            </div>            
        </div>
    </div>
    <!-- Carousel End -->
    <style>
        body {background-color: black;
        }        
            img {
            height:auto;
        }
    </style>


</asp:Content>
