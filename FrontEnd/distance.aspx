<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="distance.aspx.cs" Inherits="CodingPackFrontRevised.distance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Distance</title>

    <link href="css/style2.css" rel="stylesheet" />

    <style>
        div.dataTables_wrapper {
            width: 1300px;
            margin: 0 auto;
        }

        .container1 {
            text-align: center;
            border: 7px solid black;
            width: 600px;
            height: 500px;
            padding-top: 0px;
            margin: 30px 350px 20px 330px;
            background-color: rgb(255,99,71);
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

        .close1 {
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
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .popup-content {
            height: 400px;
            width: 500px;
            background: tomato;
            padding: 20px;
            border-radius: 10px;
            position: relative;
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
            height: 550px;
            width: 600px;
            background: tomato;
            padding: 20px;
            border-radius: 10px;
            position: relative;
        }
    </style>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places&key=AIzaSyBKGXrysrc_X7eF583icnWEH0VvbV-Gwy8"></script>

</head>
<body>

    <div class="container-fluid p-0">
        <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-lg-5">
            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-between px-3" id="navbarCollapse">
                <div class="navbar-nav mr-auto py-0">

                    <a href="donor.aspx" class="nav-item nav-link" id="dona" visible="false" runat="server">Donor</a>

                    <a href="manager.aspx" class="nav-item nav-link" id="m1" visible="false" runat="server">Dashboard</a>
                    <a href="manage_donations.aspx" class="nav-item nav-link" id="m2" visible="false" runat="server">Donations</a>
                    <a href="manage_users.aspx" class="nav-item nav-link" id="m3" visible="false" runat="server">Users</a>

                    <a href="distance.aspx" class="nav-item nav-link">Distance</a>
                    <a href="my_account.aspx" class="nav-item nav-link" id="account">Account</a>
                    <%--                    <a href="Invites.aspx" class="nav-item nav-link" id="invite">Invites</a>--%>
                    <a href="logout.aspx" class="nav-item nav-link" id="loggedin" style="margin-left: 1100px;">Logout</a>
                </div>
            </div>
        </nav>
    </div>

    <form id="distance_form" runat="server">

        <div class="container1" style="padding-top: 1">
            <br />
            <br />
            <p style="background-color: yellow; font: 30px;"><b>Please note pickups only done if ditance < 100km</b></p>
            <br />
            <br />
            <label style="width: 200px;">Donor Location: </label>
            <input id="from_places" placeholder="Enter Donor Location" style="width: 450px;" />
            <input id="origin" type="hidden" name="origin" required="true" />

            <br />
            <br />
            <br />
            <label style="width: 200px;">Fora Location: </label>
            <input id="to_places" placeholder="Enter final Location" style="width: 450px;" value="Wolfelea AH, South Africa" readonly="true" />
            <input id="destination" type="hidden" name="destination" required="true" />
            <br />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Calculate" OnClick="adddonation_Click" Style="width: 450px; height: 40px;" />
            <br />
            <br />
            <br />
            <label style="width: 200px;">Result: </label>
            <input id="respon" type="text" name="respon" style="width: 450px;" />

        </div>
    </form>

    <script>
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

                        $("#respon").val(distance_in_kilo.toFixed(2));
                    }
                }
            }

            $("#distance_form").submit(function (e) {
                e.preventDefault();
                calculateDistance();
            });
        });
    </script>


    <%--    <script>
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

            $("#distance_form").submit(function (e) {
                e.preventDefault();
                calculateDistance();
            });
        });
    </script>--%>
</body>
</html>
