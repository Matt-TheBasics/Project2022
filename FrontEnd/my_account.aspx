<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="my_account.aspx.cs" Inherits="CodingPackFrontRevised.my_account" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Account</title>

    <link href="css/style2.css" rel="stylesheet" />


    <meta charset="utf-8">
    <meta name="viewport" content="width-device-width, initial-scale-1.0">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places&key=AIzaSyBKGXrysrc_X7eF583icnWEH0VvbV-Gwy8"></script>


    <style>
        .container1 {
            text-align: center;
            border: 7px solid black;
            width: 600px;
            height: 500px;
            padding-top: 0px;
            margin: 30px 350px 20px 330px;
            background-color: rgb(255,99,71);
        }

        btn {
            font-size: 25px;
            color: tomato;
            background-color: tomato;
        }
    </style>

</head>
<body>


    <div class="container-fluid p-0">
        <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-lg-5">
            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-between px-3" id="navbarCollapse">
                <div class="navbar-nav mr-auto py-0">

                    <a href="manager.aspx" class="nav-item nav-link" id="manager1" runat="server" visible="false">Dashboard</a>
                    <a href="manage_donations.aspx" class="nav-item nav-link" id="manager2" runat="server" visible="false">Donations</a>
                    <a href="manage_users.aspx" class="nav-item nav-link" id="manager3" runat="server" visible="false">Users</a>
                    <%--                    <a href="manage_campaigns.aspx" class="nav-item nav-link" id="manager4" runat="server" visible="false">Campaigns</a>--%>

                    <a href="driverr.aspx" class="nav-item nav-link" id="driver" runat="server" visible="false">Driver</a>

                    <a href="donor.aspx" class="nav-item nav-link" id="donor1" runat="server" visible="false">Donor</a>
                    <a href="distance.aspx" class="nav-item nav-link" id="dona1" runat="server" visible="false">Distance</a>

                    <%--                    <a href="Invites.aspx" class="nav-item nav-link" id="invite1" runat="server" visible="false">Invites</a>--%>

                    <a href="my_account.aspx" class="nav-item nav-link">Account</a>

                    <a href="logout.aspx" class="nav-item nav-link" id="loggedin" style="margin-left: 1100px;">Logout</a>

                </div>
            </div>
        </nav>
    </div>


    <form id="form1" runat="server">
        <div class="container1" style="padding-top: 1">


            <br />
            <h2 style="color: white">Update Your Information </h2>

            <br />
            <input id="name" type="text" runat="server" placeholder="Name" required="required" style="width: 200px;" />

            <input id="surname" type="text" runat="server" placeholder="Surname" required="required" style="width: 200px;" />
            <br />
            <br />

            <input id="email" type="Email" runat="server" placeholder="Email" required="required" style="width: 405px;" title="email@****.***" pattern="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" />
            <br />
            <br />

            <input id="password" type="Password" runat="server" placeholder="Password" style="width: 200px;" required="required" />

            <input id="confirmpassword" type="Password" runat="server" placeholder="Confirm Password" required="required" style="width: 200px;" />
            <br />
            <br />

            <input id="contact" type="text" runat="server" placeholder="Contact" style="width: 405px;" title="Phone Number : 0**********" required="required" pattern="^[0]\d{9}$" />
            <br />
            <br />
            <input id="address" type="text" runat="server" placeholder="Home Address" required="required" style="width: 400px;" />

            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="submit" runat="server" Text="Update" class="btn" OnClick="Register_Click" Height="40px" Style="width: 400px; background-color: black; color: white;" />

        </div>
    </form>

    <script>
        var searchInput = 'address';
        $(document).ready(function () {
            var autocomplete;
            autocomplete = new google.maps.places.Autocomplete((document.getElementById(searchInput)), {
                types: ['geocode'],
                /*componentRestrictions: {
                  country: "ZA"
                }*/

            });

            google.maps.event.addListener(autocomplete, 'place_changed', function () {
                var near_place = autocomplete.getPlace();

            });
        });
    </script>

</body>
</html>
