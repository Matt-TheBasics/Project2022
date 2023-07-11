<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="contact2.aspx.cs" Inherits="CodingPackFrontRevised.contact2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

   <form runat="server">
       <div class="container-fluid pt-5">
        <div class="d-flex flex-column text-center mb-5 pt-5">
            <h4 class="text-secondary mb-3">Contact Us</h4>
            <h1 class="display-4 m-0">Contact For <span class="text-primary">Any Query</span></h1>

            <input type="text" class="form-control p-4" runat="server" id="name" placeholder="Your Name" required="required" data-validation-required-message="Please enter your name" /><br /><br />
            <input type="email" class="form-control p-4" runat="server" id="email" placeholder="Your Email" required="required" data-validation-required-message="Please enter your email" /><br /><br />
            <input type="text" class="form-control p-4" runat="server" id="subject" placeholder="Subject" required="required" data-validation-required-message="Please enter a subject" /><br /><br />
            <input class="form-control p-4" rows="6" type="text" runat="server" id="message" placeholder="Message" required="required" data-validation-required-message="Please enter your message" /><br /><br />
            <asp:Button ID="regsubmit" runat="server" Text="Send Message" class="btn btn-primary py-3 px-5" OnClick="contac_Click" />

        </div>
    </div>
</form>

</asp:Content>
