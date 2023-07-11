<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="single_campaign.aspx.cs" Inherits="CodingPackFrontRevised.single_campaign" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

        <link href="css/style2.css" rel="stylesheet" />

    <meta charset="utf-8">
    <meta name="viewport" content="width-device-width, initial-scale-1.0">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places&key=AIzaSyBKGXrysrc_X7eF583icnWEH0VvbV-Gwy8"></script>

    <title>Edit Campaign</title>

    <style>
        .container1 {
            text-align: center;
            border: 7px solid black;
            width: 600px;
            height: 520px;
            padding-top: 0px;
            margin: 70px 350px 200px 330px;
            background-color: rgb(255,99,71);
        }

        btn {
            font-size: 25px;
            color: tomato;
            background-color: tomato;
        }

        header .header {
            background-color: #fff;
            /*background-color: tomato;*/
            height: 45px;
        }

        header a img {
            width: 134px;
            margin-top: 4px;
        }

        .login-page {
            width: 360px;
            padding: 8% 0 0;
            margin: auto;
        }

            .login-page .form .login {
                margin-top: -31px;
                margin-bottom: 26px;
            }

        .form {
            position: relative;
            z-index: 1;
            /* background: #FFFFFF;*/
            /* background: tomato;*/
            max-width: 360px;
            margin: 0 auto 100px;
            padding: 45px;
            text-align: center;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }

            .form input {
                font-family: "Roboto", sans-serif;
                outline: 0;
                background: #f2f2f2;
                width: 100%;
                border: 0;
                margin: 0 0 15px;
                padding: 15px;
                box-sizing: border-box;
                font-size: 14px;
            }

            .form button {
                font-family: "Roboto", sans-serif;
                text-transform: uppercase;
                outline: 0;
                /*background-color: #328f8a;*/
                background-color: #ffff;
                background-image: linear-gradient(45deg,#328f8a,#08ac4b);
                width: 100%;
                border: 0;
                padding: 15px;
                color: #FFFFFF;
                font-size: 14px;
                -webkit-transition: all 0.3 ease;
                transition: all 0.3 ease;
                cursor: pointer;
            }

            .form .message {
                margin: 15px 0 0;
                color: #b3b3b3;
                font-size: 12px;
            }

                .form .message a {
                    color: #4CAF50;
                    text-decoration: none;
                }

        .container {
            position: relative;
            z-index: 1;
            max-width: 300px;
            margin: 0 auto;
        }

        body {
            /*background-color: #328f8a;*/
            /*background-color: tomato;*/
            background-color: #FFFFFF;
            background-image: linear-gradient(45deg,#ff6347,#ff367);
            font-family: "Roboto", sans-serif;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
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

                    <a href="manager.aspx" class="nav-item nav-link">Dashboard</a>
                    <a href="manage_donations.aspx" class="nav-item nav-link">Donations</a>
                    <a href="manage_users.aspx" class="nav-item nav-link">Users</a>
                    <a href="manage_campaigns.aspx" class="nav-item nav-link">Campaigns</a>
                    <a href="my_account.aspx" class="nav-item nav-link">Account</a>

                    <a href="logout.aspx" class="nav-item nav-link" id="loggedin">Logout</a>

                </div>
            </div>
        </nav>
    </div>

    <form id="form1" runat="server">
        <div class="container1">

            <div id="capturedetails" runat="server" visible="true">
                <br />
                <br />
                <h2>Campaign  Details</h2>
                <br />
                <br />
                <input id="name" type="text" runat="server" placeholder="Campaign Name" required="required" style="width: 400px;" />
                <br />
                <br />
                <input id="description" type="text" runat="server" placeholder="Description" required="required" style="width: 400px; height: 50px;" />
                <br />
                <br />
                <input id="location" type="text" runat="server" placeholder="Location" required="required" style="width: 400px;" />
                <br />
                <br />
                <label height="200px" style="width: 200px; color: black">Date From </label>
                <input id="datefrom" type="date" runat="server" required="required" style="width: 200px;" />
                <br />
                <br />
                <label height="200px" style="width: 200px; color: black">Date   To </label>
                <input id="dateto" type="date" runat="server" required="required" style="width: 200px;" />
                <br />
                <br />
                <label height="40px" style="width: 200px; color: black">Fundraiser </label>
                <asp:DropDownList ID="campaigntype" runat="server" Style="width: 200px;">
                    <asp:ListItem Selected="True" Value="YES"> YES  </asp:ListItem>
                    <asp:ListItem Value="NO"> NO </asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <asp:Button ID="regsubmit" runat="server" Text="Update" class="btn" OnClick="add_Click" Style="width: 400px; background-color: black; color: white;" />
            </div>
        </div>
    </form>
    <script>
        var searchInput = 'location';
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
