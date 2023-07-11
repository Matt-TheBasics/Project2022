<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frequentdonors.aspx.cs" Inherits="CodingPackFrontRevised.frequentdonors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link href="css/style2.css" rel="stylesheet" />
    <title>Frequent Donors</title>

    <style>
        div.dataTables_wrapper {
            width: 1300px;
            margin: 0 auto;
        }

        .btn {
            font-size: 25px;
            color: black;
            background-color: tomato;
            Width: 200px;
            margin-right: 100px;
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

                    <a href="my_account.aspx" class="nav-item nav-link">Account</a>

                    <a href="logout.aspx" class="nav-item nav-link" id="loggedin" style="margin-left: 1100px;">Logout</a>

                </div>
            </div>
        </nav>
    </div>


    <form id="form1" runat="server">

        <h2 style="text-align: center; color: tomato">Frequent Donors</h2>

        <br />
        <br />

        <table class="table" id="mytable">
            <thead>
                <tr>
                    <th>Donor Name</th>
                    <th>Donor Email</th>
                    <th>Donated Times</th>
                </tr>
            </thead>
            <tbody id="datatable" runat="server">
            </tbody>

        </table>
        <br />
        <asp:Button ID="pdf" runat="server" Text="Generate Report" class="btn" OnClick="pdf_Click" Height="40px" Width="200px" Style="text-align: center; margin-left: 13px;" />

        <asp:Button ID="back" runat="server" Text="Back" class="btn" OnClick="back_Click" Style="height: 40px; margin-left: 13px;" />

    </form>
</body>
</html>
