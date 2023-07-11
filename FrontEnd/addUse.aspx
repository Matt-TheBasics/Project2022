<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addUse.aspx.cs" Inherits="CodingPackFrontRevised.addUse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Manage Donations</title>

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

        .close1 {
            position: absolute;
            top: 0;
            right: 30px;
            font-size: 40px;
            transform: rotate(45deg);
            cursor: pointer;
        }

        .popup1 {
            background: rgba(0,0,0,0.6);
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .popup-content1 {
            height: 580px;
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

                    <%--                    <a href="manage_campaigns.aspx" class="nav-item nav-link">Campaigns</a>--%>
                    <a href="my_account.aspx" class="nav-item nav-link">Account</a>

                    <a href="logout.aspx" class="nav-item nav-link" id="loggedin" style="margin-left: 1100px;">Logout</a>

                </div>
            </div>
        </nav>
    </div>


    <form id="form1" runat="server">


        <div class="bs-docs-example">

            <table class="table" id="mytable">
                <thead>
                    <tr>
                        <th>Donor Name</th>
                        <th>Donor Email</th>
                        <th>Donation Type</th>
                        <th>Description</th>
                        <th>Quantity</th>
                        <th>Pickup Address</th>
                        <th>Pickup Date </th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody id="datatable" runat="server">
                </tbody>
            </table>
            <asp:Button ID="addDonation" runat="server" Text="Add Donation" class="btn" OnClick="adddonation_Click" Style="height: 40px; margin-left: 13px;" />
        </div>


        <%--        <div class="container1" style="padding-top: 1">--%>
        <div id="popup1" class="popup1">
            <div id="popup-content1" class="popup-content1">
                <div id="close1" class="close1">+ </div>
                <h2 style="color: black">User Information </h2>
                <br />

                <label height="50px" style="color: black; width: 100px">User Type </label>
                <asp:DropDownList ID="user_type" runat="server" Width="300px">
                    <asp:ListItem Selected="True" Value="DONOR"> DONOR  </asp:ListItem>
                    <asp:ListItem Value="DRIVER"> DRIVER </asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <label height="100px" style="color: black; width: 100px">Name </label>
                <input id="name" type="text" runat="server" placeholder="Name" required="required" style="width: 300px;" readonly="true" />
                <br />
                <br />
                <label height="100px" style="color: black; width: 100px">Surname </label>
                <input id="surname" type="text" runat="server" placeholder="Surname" required="required" style="width: 300px;" readonly="true" />
                <br />
                <br />
                <label height="100px" style="color: black; width: 100px">Email </label>
                <input id="email" type="Email" runat="server" placeholder="Email" required="required" style="width: 300px;" title="email@****.***" pattern="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" readonly="true" />
                <br />
                <br />
                <label height="100px" style="color: black; width: 100px">Password </label>
                <input id="password" type="Password" runat="server" placeholder="Password" style="width: 300px;" required="required" readonly="true" />
                <br />
                <br />
                <label height="100px" style="color: black; width: 100px">Confirm Pass </label>
                <input id="confirmpassword" type="Password" runat="server" placeholder="Confirm Password" required="required" style="width: 300px;" readonly="true" />
                <br />
                <br />
                <label height="100px" style="color: black; width: 100px">Address </label>
                <input id="address" type="text" runat="server" placeholder="Home Address" required="required" style="width: 300px;" readonly="true" />
                <br />
                <br />
                <label height="100px" style="color: black; width: 100px">Contact </label>
                <input id="contact" type="text" runat="server" placeholder="Contact" style="width: 300px;" title="Phone Number : 0**********" required="required" pattern="^[0]\d{9}$" readonly="true" />
                <br />
                <br />
                <br />
                <asp:Button ID="submit" runat="server" Text="Update" class="btn" OnClick="Register_Click" Height="40px" Style="width: 400px; background-color: black; color: white;" />
            </div>
        </div>
        <%--            <asp:Button ID="back" runat="server" Text="Back" class="btn" OnClick="back_Click" Style="height: 40px; margin-left: 20px; width: 200px; background-color: tomato; color: white;" />--%>
    </form>


    <script>

        document.querySelector(".close1").addEventListener("click", function () {
            document.querySelector(".popup1").style.display = "none";
        });

        document.getElementById("viewDonation").addEventListener("click", function () {
            document.querySelector(".popup1").style.display = "flex";
        })

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
</body>
</html>
