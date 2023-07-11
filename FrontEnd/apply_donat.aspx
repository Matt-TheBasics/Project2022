<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="apply_donat.aspx.cs" Inherits="CodingPackFrontRevised.apply_donat" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Donor</title>

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
            display: none;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .popup-content {
            height: 580px;
            width: 600px;
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
            display: none;
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

                    <a href="donor.aspx" class="nav-item nav-link">Donor</a>
                    <a href="distance.aspx" class="nav-item nav-link" id="dona1">Distance</a>
                    <a href="my_account.aspx" class="nav-item nav-link">Account</a>
                    <%--                    <a href="Invites.aspx" class="nav-item nav-link">Invites</a>--%>
                    <a href="logout.aspx" class="nav-item nav-link" id="loggedin" style="margin-left: 900px;">Logout</a>

                </div>
            </div>
        </nav>
    </div>

    <form id="form1" runat="server">

        <div id="test" runat="server"></div>

        <label height="40px" style="margin-left: 13px; width: 150px; color: black; text-align: center; border: 3px solid tomato">Total Donated Items: </label>

        <input id="total" type="text" runat="server" placeholder="Total" style="width: 50px; text-align: center;" required="required" readonly="readonly" />

        <br />
        <br />

        <table class="table" id="mytable">
            <thead>
                <tr>
                    <th>Donation Type</th>
                    <th>Description</th>
                    <th>Quantity</th>
                    <th>Pickup Date</th>
                    <th>Pickup Address</th>
                    <th>Status</th>
                    <th>Code</th>
                </tr>
            </thead>
            <tbody id="datatable" runat="server">
            </tbody>
        </table>

        <asp:Button ID="applyDonation" runat="server" Text="Apply To Donate" class="btn" OnClick="apply_Click" Height="40px" Width="200px" Style="text-align: center; margin-left: 13px;" />
        <br />
        <br />

        <div id="popup" class="popup">
            <div id="popup-content" class="popup-content">
                <div id="close" class="close">+ </div>
                <h2 style="color: white">Donation  Details</h2>
                <br />

                <label height="40px" style="width: 200px; color: black">Type </label>
                <asp:DropDownList ID="donationtype" runat="server" Style="width: 300px;">
                    <asp:ListItem Selected="True" Value="FOOD"> FOODS  </asp:ListItem>
                    <asp:ListItem Value="CLOTHES"> CLOTHES/FURNITURE/OTHER </asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <label height="40px" style="width: 200px; color: black">Description </label>

                <input id="description" type="text" runat="server" placeholder="Brief Description" style="width: 300px;" />
                <br />
                <br />
                <asp:FileUpload ID="FileUpload1" runat="server" Style="width: 200px; color: black; margin-left: 260px;" />
                <label id="lblimage" typeof="text" style="width: 200px; color: black; margin-left: 45px;">Upload Image of Item</label>

                <br />
                <br />
                <label height="50px" style="color: black; width: 200px">Quantity </label>
                <input id="quantity" type="number" runat="server" style="width: 300px;" min="1" max="100" default="1" />
                <br />
                <br />
                <label height="40px" style="width: 200px; color: black">Pickup Date </label>
                <input id="pdate" type="date" runat="server" style="width: 300px;" />
                <br />
                <br />
                <label id="add1" typeof="text" style="width: 200px; color: black;">Pickup Address:</label>
                <input id="to_places" type="text" runat="server" style="width: 300px;" />
                <input id="destination" type="hidden" runat="server" sstyle="width:300px;" required="required" />
                <%--                <br />
                <br />
                <label id="add" typeof="text" style="width: 200px; color: black;">Fora Address:</label>--%>
                <input id="from_places" type="text" runat="server" style="width: 300px;" required="required" value="Wolfelea AH, South Africa" readonly="true" visible="false" />
                <input id="origin" type="hidden" runat="server" style="width: 300px;" required="required" />
                <br />
                <br />

                <%--            <label style="width: 200px;">Check Distance: </label>
                <asp:Button ID="Button2" runat="server" Text="Calculate" OnClick="check_Click" Style="width: 200px; height: 30px;" />
                <input id="check" placeholder="Total Distance" style="width: 100px;" runat="server" />
                --%>
                <p style="background-color: yellow; font: 30px;"><b>NOTE!! IF distance > 100km ,donation will be declined</b></p>

                <input id="Text1" type="text" runat="server" value="PENDING" required="required" readonly="true" style="width: 300px;" visible="false" />
                <br />

                <asp:Button ID="regsubmit" runat="server" Text="Add" class="btn" OnClick="add_Click" Style="width: 480px; background-color: black; color: white;" />

            </div>
        </div>

        <div id="popup1" class="popup1">
            <div id="popup-content1" class="popup-content1">
                <div id="close1" class="close1">+ </div>
                <h2 style="color: white">Donation  Details</h2>
                <br />
                <asp:Image ID="Image1" runat="server" Style="width: 200px; height: 190px;" />
                <br />
                <br />
                <label height="40px" style="width: 100px; color: black">Type </label>
                <asp:DropDownList ID="donationtype1" runat="server" Style="width: 150px;">
                    <asp:ListItem Selected="True" Value="FOOD"> FOOD  </asp:ListItem>
                    <asp:ListItem Value="CLOTHES"> CLOTHES/FURNITURE/OTHER  </asp:ListItem>
                </asp:DropDownList>
                <label height="50px" style="color: black; width: 100px">Quantity </label>
                <input id="quantity1" type="number" runat="server" style="width: 150px;" min="1" max="100" default="1" required="required" />
                <br />
                <br />
                <label height="40px" style="width: 100px; color: black">Description </label>

                <input id="description1" type="text" runat="server" placeholder="Brief Description" style="width: 400px;" required="required" />

                <br />
                <br />
                <label id="add11" typeof="text" style="width: 90px; color: black;">Pickup Add</label>
                <input id="to_places1" type="text" runat="server" style="width: 410px;" />
                <input id="destination1" type="hidden" runat="server" style="width: 100px;" required="required" />
                <%--                <br />
                <br />--%>
<%--                <label id="add111" typeof="text" style="width: 80px; color: black;">Fora Add</label>--%>
                <input id="from_places1" type="text" runat="server" style="width: 200px;" required="required" value="Wolfelea AH, South Africa" readonly="true" visible="false" />
                <input id="origin1" type="hidden" runat="server" style="width: 100px;" required="required" />

                <br />
                <br />

                <label height="40px" style="width: 90px; color: black">Pickup Date </label>
                <input id="pdate1" type="date" runat="server" required="required" style="width: 160px;" />
                <label id="Status" typeof="text" style="width: 50px; color: black;">Status:</label>

                <input id="status1" type="text" runat="server" required="required" readonly="true" style="width: 200px;" visible="true" />
                <br />
                <br />
                <asp:Button ID="regsubmit1" runat="server" Text="Update" class="btn" OnClick="update_Click" Style="width: 480px; background-color: black; color: white;" />

            </div>
        </div>

        <%--        <div id="popup2" class="popup2">
            <div id="popup-content2" class="popup-content2">
                <div id="close2" class="close2">+ </div>

                <h3 style="color: white"><b>Check Your Distance</b></h3>
                <br />
                <p style="background-color: yellow; font: 30px;"><b>NOTE!! IF distance > 100km ,donation will be declined</b></p>
                <br />
                <label style="width: 200px;">Donor Location: </label>
                <input id="from_places2" type="text" placeholder="Enter start Location" style="width: 450px;" runat="server" />
                <input id="origin2" type="hidden" name="origin2" required="required" />
                <br />
                <br />

                <label style="width: 200px;">Fora Location: </label>
                <input id="to_places2" type="text" placeholder="Enter final Location" style="width: 450px;" value="Wolfelea AH, South Africa" readonly="true" runat="server" />
                <input id="destination2" type="hidden" name="destination2" required="required" />
                <br />
                <br />
                <br />

                <asp:Button ID="Button1" runat="server" Text="Calculate" OnClick="adddonation_Click" Style="width: 450px; height: 40px;" />
                <br />
                <br />

                <label style="width: 200px;">Result: </label>
                <input id="res" placeholder="Total Distance" style="width: 450px;" runat="server" />
            </div>

        </div>--%>
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

            var from_places1 = new google.maps.places.Autocomplete(document.getElementById("from_places1"));
            var to_places1 = new google.maps.places.Autocomplete(document.getElementById("to_places1"));

            google.maps.event.addListener(from_places1, "place_changed", function () {
                var from_place1 = from_places1.getPlace();
                var from_address1 = from_place1.formatted_address;
                $("#origin1").val(from_address1);
            });

            google.maps.event.addListener(to_places1, "place_changed", function () {
                var to_place1 = to_places1.getPlace();
                var to_address1 = to_place1.formatted_address;
                $("#destination1").val(to_address1);
            });


            //    var from_places2 = new google.maps.places.Autocomplete(document.getElementById("from_places2"));
            //    var to_places2 = new google.maps.places.Autocomplete(document.getElementById("to_places2"));

            //    google.maps.event.addListener(from_places2, "place_changed", function () {
            //        var from_place2 = from_places2.getPlace();
            //        var from_address2 = from_place2.formatted_address;
            //        $("#origin2").val(from_address2);
            //    });

            //    google.maps.event.addListener(to_places2, "place_changed", function () {
            //        var to_place2 = to_places2.getPlace();
            //        var to_address2 = to_place2.formatted_address;
            //        $("#destination2").val(to_address2);
            //    });

            //    function calculateDistance() {
            //        var origin = $("#origin").val();
            //        var destination = $("#destination").val();
            //        var service = new google.maps.DistanceMatrixService();
            //        service.getDistanceMatrix(
            //            {
            //                origins: [origin],
            //                destinations: [destination],
            //                travelMode: google.maps.TravelMode.DRIVING,
            //                unitSystem: google.maps.UnitSystem.IMPERIAL,
            //                avoidHighways: false,
            //                avoidTolls: false,
            //            },
            //            callback
            //        );
            //    }

            //    function callback(response, status) {
            //        if (status != google.maps.DistanceMatrixStatus.OK) {
            //            $("#result").html(err);
            //        } else {
            //            var origin = response.originAddresses[0];
            //            var destination = response.destinationAddresses[0];
            //            if (response.rows[0].elements[0].status === "ZERO_RESUTS") {
            //                $("#result").html("Better get on a plane.There are no roads between" + origin + "and " + destination);
            //            } else {
            //                var distance = response.rows[0].elements[0].distance;

            //                var distance_in_kilo = distance.value / 1000;

            //                $("#check").val(distance_in_kilo.toFixed(2));
            //            }
            //        }
            //    }

            //    $("#form1").submit(function (e) {
            //        e.preventDefault();
            //        calculateDistance();
            //    });
        });

    </script>

    <script>

        document.getElementById("applyDonation").addEventListener("click", function () {
            document.querySelector(".popup1").style.display = "none"; document.querySelector(".popup").style.display = "flex";    /*document.querySelector(".popup2").style.display = "flex";*/
        });

        document.querySelector(".close").addEventListener("click", function () {
            document.querySelector(".popup").style.display = "none";
        });

        //document.querySelector(".close2").addEventListener("click", function () {
        //    document.querySelector(".popup2").style.display = "none";
        //});
    </script>


    <script>

        document.querySelector(".close1").addEventListener("click", function () {
            document.querySelector(".popup1").style.display = "none";
        });

        //document.getElementById("viewDonation").addEventListener("click", function () {
        //    document.querySelector(".popup1").style.display = "flex";
        //})

    </script>

</body>
</html>
