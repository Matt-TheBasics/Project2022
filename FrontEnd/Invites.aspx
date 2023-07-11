<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Invites.aspx.cs" Inherits="CodingPackFrontRevised.Invites" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Campaigns</title>
    <div class="container-fluid p-0">
        <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-lg-5">
            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-between px-3" id="navbarCollapse">
                <div class="navbar-nav mr-auto py-0">

                    <a href="donor.aspx" class="nav-item nav-link">Donor</a>
                    <a href="my_account.aspx" class="nav-item nav-link">Account</a>
                    <a href="Invites.aspx" class="nav-item nav-link">Invites</a>
                    <a href="logout.aspx" class="nav-item nav-link" id="loggedin">Logout</a>

                </div>
            </div>
        </nav>
    </div>
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
            Width:200px;
            margin-right:100px;
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
  

     <form id="form1" runat="server">

        <div class="bs-docs-example">

            <br />

            <table class="table" id="mytable">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Location</th>
                        <th>Date From</th>
                        <th>Date To </th>
                    </tr>
                </thead>
                <tbody id="datatable" runat="server">
                </tbody>

            </table>
            <br />

        </div>

    </form>
</body>
</html>
