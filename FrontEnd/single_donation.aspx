<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="single_donation.aspx.cs" Inherits="CodingPackFrontRevised.single_donation" %>

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
            height: 600px;
            width: 600px;
            background: tomato;
            padding: 20px;
            border-radius: 10px;
            position: relative;
        }

        .close2 {
            position: absolute;
            top: 0;
            right: 30px;
            font-size: 40px;
            transform: rotate(45deg);
            cursor: pointer;
        }

        .popup2 {
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

        .popup-content2 {
            height: 470px;
            width: 500px;
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

        <%--        <div class="container1">

            <div id="capturedetails" runat="server" visible="true">--%>

        <div id="popup1" class="popup1">
            <div id="popup-content1" class="popup-content1">
                <div id="close1" class="close1">+ </div>

                <h2 style="color: white">Donation  Details</h2>
                <br />

                <asp:Image ID="Image1" runat="server" Style="width: 250px; height: 190px;" />
                <br />
                <br />
                <label height="40px" style="width: 100px; color: black">Donor Email </label>

                <input id="donoremail" type="text" runat="server" placeholder="Donor Email" required="required" style="width: 400px;" readonly="readonly" />
                <br />
                <br />
                <label height="40px" style="width: 50px; color: black">Type </label>
                <input id="dtype" type="text" runat="server" placeholder="Donation Type" required="required" style="width: 200px;" readonly="readonly" />
                <label height="50px" style="color: black; width: 70px">Quantity </label>
                <input id="quantity" type="number" runat="server" style="width: 180px;" min="1" max="100" readonly="readonly" />

                <br />
                <br />
                <label height="40px" style="width: 100px; color: black">Description </label>
                <input id="description" type="text" runat="server" placeholder="Brief Description" style="width: 400px;" required="required" readonly="readonly" />
                <br />
                <br />

                <label height="40px" style="width: 100px; color: black">Date </label>
                <input id="pdate" type="date" runat="server" required="required" style="width: 140px;" readonly="readonly" />

                <label id="add" typeof="text" style="width: 60px; color: black;">Address</label>
                <input id="address" type="text" runat="server" placeholder="Pickup Address" style="width: 200px;" required="required" readonly="readonly" />
                <br />
                <br />
                <label height="40px" style="width: 50px; color: black">Driver</label>
                <asp:DropDownList ID="schedule" runat="server" Style="width: 200px;" readonly="readonly">
                    <asp:ListItem Selected="True" Value="3"> Nhlamulo Makhubela   </asp:ListItem>
                </asp:DropDownList>
                <label height="40px" style="width: 50px; color: black">Status</label>
                <asp:DropDownList ID="decision" runat="server" Style="width: 150px;" readonly="readonly">
                    <asp:ListItem Selected="True" Value="DECLINE">DECLINE   </asp:ListItem>
                    <asp:ListItem Value="APPROVE">  APPROVE</asp:ListItem>
                </asp:DropDownList><br />
                <br />

                <asp:Button ID="regsubmit" runat="server" Text="Submit" class="btn" OnClick="add_Click" Style="width: 500px; background-color: black; color: white;" />
            </div>
        </div>


        <%--        <div id="popup2" class="popup2">
            <div id="popup-content2" class="popup-content2">
                <div id="close2" class="close2">+ </div>

                <br />
                <p style="background-color: yellow; font: 30px;"><b>Check Distance</b></p>
                <br />
                <br />
                <label style="width: 200px;">Donor Location: </label>
                <input id="from_places" placeholder="Enter start Location" style="width: 450px;" runat="server" />
                <input id="origin" type="hidden" name="origin" required="true" />
                <br />
                <br />
                <br />
                <label style="width: 200px;">Fora Location: </label>
                <input id="to_places" placeholder="Enter final Location" style="width: 450px;" value="Wolfelea AH, South Africa" readonly="true" runat="server" />
                <input id="destination" type="hidden" name="destination" required="true" />
                <br />
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" Text="Calculate" OnClick="adddonation_Click" Style="width: 450px; height: 40px;" />
                <br />
                <br />
                <br />
                <label style="width: 200px;">Result: </label>
                <input id="res" placeholder="Total Distance" style="width: 450px;" runat="server" />
            </div>

        </div>--%>

<%--        <script>
            $(document).ready(function () {
                var from_places = new google.maps.places.Autocomplete(document.getElementById("from_places"));
                var to_places = new google.maps.places.Autocomplete(document.getElementById("to_places"));

                google.maps.event.addListener(from_places, "place_changed", function () {
                    var from_place = from_places.getPlace();
                    var from_address = from_place.formatted_address;
                    $("#origin").val(from_address);
                });

                google.maps.event.addListener(to_places, "place_changed", function () {
                    var to_place = to_places.getPlace();
                    var to_address = to_place.formatted_address;
                    $("#destination").val(to_address);
                });

                function calculateDistance() {
                    var origin = $("#origin").val();
                    var destination = $("#destination").val();
                    var service = new google.maps.DistanceMatrixService();
                    service.getDistanceMatrix(
                        {
                            origins: [origin],
                            destinations: [destination],
                            travelMode: google.maps.TravelMode.DRIVING,
                            unitSystem: google.maps.UnitSystem.IMPERIAL,
                            avoidHighways: false,
                            avoidTolls: false,
                        },
                        callback
                    );
                }

                function callback(response, status) {
                    if (status != google.maps.DistanceMatrixStatus.OK) {
                        $("#result").html(err);
                    } else {
                        var origin = response.originAddresses[0];
                        var destination = response.destinationAddresses[0];
                        if (response.rows[0].elements[0].status === "ZERO_RESUTS") {
                            $("#result").html("Better get on a plane.There are no roads between" + origin + "and " + destination);
                        } else {
                            var distance = response.rows[0].elements[0].distance;

                            var distance_in_kilo = distance.value / 1000;

                            $("#res").val(distance_in_kilo.toFixed(2));
                        }
                    }
                }

                $("#form1").submit(function (e) {
                    e.preventDefault();
                    calculateDistance();
                });
            });
        </script>--%>


        <script>

            document.querySelector(".close1").addEventListener("click", function () {
                document.querySelector(".popup1").style.display = "none";
            });

            //document.getElementById("viewDonation").addEventListener("click", function () {
            //    document.querySelector(".popup1").style.display = "flex";
            //})

        </script>

       <%-- <script>
            document.querySelector(".close2").addEventListener("click", function () {
                document.querySelector(".popup2").style.display = "none";
            });
        </script>--%>

    </form>

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
