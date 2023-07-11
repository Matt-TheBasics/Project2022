<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="driverr.aspx.cs" Inherits="CodingPackFrontRevised.driverr" %>

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
    </form>
</body>
</html>
