<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="donor_image.aspx.cs" Inherits="CodingPackFrontRevised.donor_image" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <form id="form1" runat="server">

        <asp:Image ID="Image1" runat="server" Style="width: 450px; width: 450px; margin:10px 100px 10px 10px" />

        <br />
        <asp:Button ID="back" runat="server" Text="Back" class="btn btn-lg btn-primary mt-3 px-4" OnClick="back_Click" Style="height: 40px; margin-left: 13px; width: 200px" />
        <br />

    </form>



</asp:Content>
