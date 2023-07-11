<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manage_users.aspx.cs" Inherits="CodingPackFrontRevised.manage_users" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Manage Users</title>

    <link href="css/style2.css" rel="stylesheet" />

    <style>
        div.dataTables_wrapper {
            width: 1300px;
            margin: 0 auto;
        }

        .btn {
            font-size: 25px;
            color: black;
            background-color: tomato;
        }

        .close {
            position: absolute;
            top: 0;
            right: 30px;
            font-size: 40px;
            transform: rotate(45deg);
            cursor: pointer;
        }

        .popup {
            background: rgba(0,0,0,0.6);
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            display: none;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .popup-content {
            height: 500px;
            width: 600px;
            background: tomato;
            padding: 20px;
            border-radius: 10px;
            position: relative;
        }
    </style>


    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"> </script>

    <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places&key=AIzaSyBKGXrysrc_X7eF583icnWEH0VvbV-Gwy8"></script>

    <script>  

        $(document).ready(function () {
            $('#mytable').DataTable();
        });

    </script>

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
                    <a href="distance.aspx" class="nav-item nav-link">Distance</a>

                    <%--                    <a href="manage_campaigns.aspx" class="nav-item nav-link" >Campaigns</a>--%>
                    <a href="my_account.aspx" class="nav-item nav-link">Account</a>
                    <a href="logout.aspx" class="nav-item nav-link" id="loggedin" style="margin-left: 1100px;">Logout</a>

                </div>
            </div>
        </nav>
    </div>

    <form id="form1" runat="server">
        <div class="bs-docs-example">
            <br />
            <table class="table" id="mytable">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Surname</th>
                        <th>Email</th>
                        <th>Usertype</th>
                        <th>Contact</th>
                        <th>Address</th>
                    </tr>
                </thead>
                <tbody id="datatable" runat="server">
                </tbody>
            </table>
            <br />
            <asp:Button ID="adduser" runat="server" Text="Add New User" class="btn" OnClick="adduser_Click" Style="height: 40px; margin-left: 13px; width: 200px" />

            <br />
        </div>

        <div id="popup" class="popup">
            <div id="popup-content" class="popup-content">
                <div id="close" class="close">+ </div>

                <h2 style="color: black">User  Information </h2>
                <br />

                <label height="50px" style="color: black; width: 100px">User Type </label>
                <asp:DropDownList ID="user_type" runat="server" Width="300px">
                    <asp:ListItem Selected="True" Value="DONOR"> DONOR  </asp:ListItem>
                    <asp:ListItem Value="DRIVER"> DRIVER </asp:ListItem>
                </asp:DropDownList>
                <br />
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
                <input id="address" type="text" runat="server" placeholder="Home Address" required="required" style="width: 400px;" />
                <br />
                <br />
                <input id="contact" type="text" runat="server" placeholder="Contact" style="width: 405px;" title="Phone Number : 0**********" required="required" pattern="^[0]\d{9}$" />
                <br />
                <br />
                <br />
                <asp:Button ID="submit" runat="server" Text="Register" class="btn" OnClick="Register_Click" Height="40px" Style="width: 400px; background-color: black; color: white;" />

            </div>
        </div>

        <script>
            document.getElementById("adduser").addEventListener("click", function () {
                document.querySelector(".popup").style.display = "flex";
            })

            document.querySelector(".close").addEventListener("click", function () {
                document.querySelector(".popup").style.display = "none";
            });
        </script>

        <script>
            var searchInput = 'address';
            $(document).ready(function () {
                var autocomplete;
                autocomplete = new google.maps.places.Autocomplete((document.getElementById(searchInput)), {
                    types: ['geocode'],
                });

                google.maps.event.addListener(autocomplete, 'place_changed', function () {
                    var near_place = autocomplete.getPlace();

                });
            });

        </script>

    </form>
</body>
</html>
