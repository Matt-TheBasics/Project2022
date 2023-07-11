<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="driverrr.aspx.cs" Inherits="CodingPackFrontRevised.driverrr" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Driver</title>

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

                    <a href="driverr.aspx" class="nav-item nav-link" id="dona">Driver</a>
                    <a href="my_account.aspx" class="nav-item nav-link" id="account">Account</a>
                    <a href="logout.aspx" class="nav-item nav-link" id="loggedin" style="margin-left: 900px;">Logout</a>

                </div>
            </div>
        </nav>
    </div>



    <form id="form1" runat="server">
        <br />
        <br />

        <table class="table" id="mytable">
            <thead>
                <tr>
                    <th>Donor Name</th>
                    <th>Donor Contact</th>
                    <th>Donation Type</th>
                    <th>Description</th>
                    <th>Quantity</th>
                    <th>Pickup Address</th>
                    <th>Pickup Date</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody id="datatable" runat="server">
            </tbody>

        </table>

        <div id="popup1" class="popup1">
            <div id="popup-content1" class="popup-content1">
                <div id="close1" class="close1">+ </div>
                <h2 style="color: white">Donation  Details</h2>
                <br />
                <asp:Image ID="Image1" runat="server" Style="width: 200px; height: 190px;" />
                <br />
                <br />
                <label height="40px" style="width: 50px; color: black">Type </label>
                <input id="type" type="text" runat="server" placeholder="Type" style="width: 200px;" required="required" readonly="true" />
                <%--                <br />
                <br />--%>
                <label height="50px" style="color: black; width: 60px">Quantity </label>
                <input id="quantity1" type="text" runat="server" placeholder="Quantity" style="width: 190px;" required="required" readonly="true" />
                <br />
                <br />
                <%--<br />--%>
                <label height="40px" style="width: 100px; color: black">Description </label>

                <input id="description1" type="text" runat="server" placeholder="Brief Description" style="width: 400px;" required="required" />
                <br />
                <br />
                <label id="add11" typeof="text" style="width: 100px; color: black;">Pickup Add</label>
                <input id="to_places1" type="text" runat="server" style="width: 400px;" required="required" placeholder="Pick up Date" readonly="true" />
                <input id="destination1" type="hidden" runat="server" style="width: 100px;" required="required" />
                <%--                <br />
                <br />--%>
                <%--                <label id="add111" typeof="text" style="width: 100px; color: black;" visible="false">Fora Add</label>--%>
                <input id="from_places1" type="text" runat="server" style="width: 400px;" required="required" value="Wolfelea AH, South Africa" readonly="true" visible="false" />
                <input id="origin1" type="hidden" runat="server" style="width: 100px;" required="required" />
                <br />
                <br />

                <label height="40px" style="width: 100px; color: black">Pickup Date </label>
                <input id="pdate1" type="date" runat="server" required="required" style="width: 150px;" placeholder="Pick up Date" readonly="true" />
                <label height="40px" style="width: 50px; color: black">Status</label>
                <asp:DropDownList ID="decision" runat="server" Style="width: 150px;" readonly="readonly">
                    <asp:ListItem Selected="True" Value="DECLINE">DECLINE   </asp:ListItem>
                    <asp:ListItem Value="COLLECTED">  COLLECTED</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <label id="lblcode" typeof="text" style="width: 50px; color: black;">Code:</label>
                <input id="code" type="text" runat="server" required="required" style="width: 200px;" visible="true" />
                <asp:Button ID="regsubmit" runat="server" Text="Collect" class="btn" OnClick="collect_Click" Style="width: 250px; background-color: black; color: white;" />
            
            </div>
        </div>

        <script>

            document.querySelector(".close1").addEventListener("click", function () {
                document.querySelector(".popup1").style.display = "none";
            });

            document.getElementById("viewDonation").addEventListener("click", function () {
                document.querySelector(".popup1").style.display = "flex";
            })

        </script>


    </form>
</body>
</html>
