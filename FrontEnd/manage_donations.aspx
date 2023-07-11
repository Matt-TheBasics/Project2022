<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manage_donations.aspx.cs" Inherits="CodingPackFrontRevised.manage_donations" %>

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
                    <%--                    <a href="manage_campaigns.aspx" class="nav-item nav-link">Campaigns</a>--%>
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

        <div id="popup" class="popup">
            <div id="popup-content" class="popup-content">
                <div id="close" class="close">+ </div>

                <h2>Donation  Details</h2>
                <br />

                <label height="40px" style="width: 200px; color: black">Donor Email </label>
                <input id="donoremail" type="text" runat="server" placeholder="Donor Email" required="required" style="width: 300px;" />
                <br />
                <br />
                <label height="40px" style="width: 200px; color: black">Type </label>
                <asp:DropDownList ID="donationtype" runat="server" Style="width: 300px;">
                    <asp:ListItem Selected="True" Value="FOOD"> FOOD  </asp:ListItem>
                    <asp:ListItem Value="CLOTHES"> CLOTHES/FURNITURE/OTHER  </asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <label height="40px" style="width: 200px; color: black">Description </label>

                <input id="description" type="text" runat="server" placeholder="Brief Description" style="width: 300px;" required="required" />
                <br />
                <br />
                <asp:FileUpload ID="FileUpload1" runat="server" Style="width: 200px; color: black; margin-left: 245px;" />
                <label id="lblimage" typeof="text" style="width: 200px; color: black; margin-left: 45px;">Upload Image of Item</label>
                <br />
                <br />
                <label height="50px" style="color: black; width: 200px">Quantity </label>
                <input id="quantity" type="number" runat="server" style="width: 300px;" min="1" max="100" default="1" required="required" />
                <br />
                <br />

                <label height="40px" style="width: 200px; color: black">Collection Date </label>
                <input id="pdate" type="date" runat="server" required="required" style="width: 300px;" />

                <%--                <label id="add" typeof="text" style="width: 200px; color: black;">Address</label>--%>

                <input id="address" type="text" runat="server" placeholder="Pickup Address" style="width: 300px;" required="required" value="FORA" readonly="true" visible="false" />
                <br />
                <br />
                <br />
                <%--                <label height="40px" style="width: 200px; color: black">Status</label>--%>
                <input id="status" type="text" runat="server" value="COLLECTED" required="required" readonly="true" style="width: 300px;" visible="false" />
                <asp:Button ID="regsubmit" runat="server" Text="Add" class="btn" OnClick="add_Click" Style="width: 470px; background-color: black; color: white;" />

            </div>
        </div>

        <script>
            document.getElementById("addDonation").addEventListener("click", function () {
                document.querySelector(".popup").style.display = "flex";
            })

            document.querySelector(".close").addEventListener("click", function () {
                document.querySelector(".popup").style.display = "none";
            });
        </script>

    </form>
</body>
</html>
