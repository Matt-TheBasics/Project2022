<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="donor.aspx.cs" Inherits="CodingPackFrontRevised.donor" %>

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

        .popup1 {
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
            height: 530px;
            width: 560px;
            background: tomato;
            padding: 20px;
            border-radius: 10px;
            position: relative;
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

    <!-- Customized Bootstrap Stylesheet -->


</head>
<body>


    <div class="container-fluid p-0">
        <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-lg-5">
            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-between px-3" id="navbarCollapse">
                <div class="navbar-nav mr-auto py-0">

                    <a href="donor.aspx" class="nav-item nav-link" id="dona">Donor</a>
                    <a href="distance.aspx" class="nav-item nav-link" id="dona1">Distance</a>
                    <a href="my_account.aspx" class="nav-item nav-link" id="account">Account</a>
                    <%--                    <a href="Invites.aspx" class="nav-item nav-link" id="invite">Invites</a>--%>
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
                <asp:DropDownList ID="donationtype" runat="server" Style="width: 300px;" required="required">
                    <asp:ListItem Selected="True" Value="FOOD"> FOOD  </asp:ListItem>
                    <asp:ListItem Value="CLOTHES"> CLOTHES/FURNITURE/OTHER  </asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <label height="40px" style="width: 200px; color: black">Description </label>

                <input id="description" type="text" runat="server" placeholder="Brief Description" style="width: 300px;" required="required" />
                <br />
                <br />
                <asp:FileUpload ID="FileUpload1" runat="server" Style="width: 200px; color: black; margin-left: 260px;" />
                <label id="lblimage" typeof="text" style="width: 200px; color: black; margin-left: 45px;">Upload Image of Item</label>

                <br />
                <br />
                <label height="50px" style="color: black; width: 200px">Quantity </label>
                <input id="quantity" type="number" runat="server" style="width: 300px;" min="1" max="100" default="1" required="required" />
                <br />
                <br />
                <label height="40px" style="width: 200px; color: black">Pickup Date </label>
                <input id="pdate" type="date" runat="server" style="width: 300px;" required="required" />
                <br />
                <br />
                <label id="add1" typeof="text" style="width: 200px; color: black;">Pickup Address:</label>
                <input id="to_places" type="text" runat="server" style="width: 300px;"  required="required"/>
                <input id="destination" type="hidden" runat="server" style="width: 300px;" required="required" />
                <br />
                <br />
                <p style="background-color: yellow; font: 30px;"><b>NOTE!! IF distance > 100km,donation will be declined (check distance under distance page)</b></p>

                <input id="status" type="text" runat="server" value="PENDING" required="required" readonly="true" style="width: 300px;" visible="false" />
                <br />

                <asp:Button ID="regsubmit" runat="server" Text="Add" class="btn" OnClick="add_Click" Style="width: 480px; background-color: black; color: white;" />

            </div>
        </div>

        <%--        <div id="popup1" class="popup1">
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
                <input id="quantity1" type="number" runat="server" style="width: 150px;" min="1" max="100" default="1" />
                <br />
                <br />
                <label height="40px" style="width: 100px; color: black">Description </label>

                <input id="description1" type="text" runat="server" placeholder="Brief Description" style="width: 400px;" />

                <br />
                <br />
                <label height="40px" style="width: 90px; color: black">Pickup Date </label>
                <input id="pdate1" type="date" runat="server" style="width: 125px;" />
                <label id="add11" typeof="text" style="width: 90px; color: black;">Pickup Add</label>
                <input id="to_places1" type="text" runat="server" style="width: 200px;" />
                <input id="destination1" type="hidden" runat="server" style="width: 100px;" />
                <br />
                <br />
                <label id="add111" typeof="text" style="width: 80px; color: black;">Fora Add</label>
                <input id="from_places1" type="text" runat="server" style="width: 200px;" required="required" value="Wolfelea AH, South Africa" readonly="true" />
                <input id="origin1" type="hidden" runat="server" style="width: 100px;" required="required" />

                <label id="Status" typeof="text" style="width: 50px; color: black;">Status:</label>

                <input id="status1" type="text" runat="server" required="required" readonly="true" style="width: 150px;" visible="true" />
                <br />
                <br />
                <asp:Button ID="regsubmit1" runat="server" Text="Update" class="btn" OnClick="update_Click" Style="width: 480px; background-color: black; color: white;" />

            </div>
        </div>--%>
    </form>

    <script>

        document.getElementById("applyDonation").addEventListener("click", function () {
            document.querySelector(".popup").style.display = "flex";
        });

        document.querySelector(".close").addEventListener("click", function () {
            document.querySelector(".popup").style.display = "none";
        });

    </script>


    <script>

        $(document).ready(function () {

            var to_places = new google.maps.places.Autocomplete(document.getElementById("to_places"));

            google.maps.event.addListener(to_places, "place_changed", function () {
                var to_place = to_places.getPlace();
                var to_address = to_place.formatted_address;
                $("#destination").val(to_address);
            });

        });

    </script>

    <%--    <script>

        document.querySelector(".close1").addEventListener("click", function () {
            document.querySelector(".popup1").style.display = "none";
        });

    </script>--%>
</body>
</html>
