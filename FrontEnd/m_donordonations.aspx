<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="m_donordonations.aspx.cs" Inherits="CodingPackFrontRevised.m_donordonations" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/style2.css" rel="stylesheet" />

    <title>Donor Donations</title>

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
                </tr>
            </thead>
            <tbody id="datatable" runat="server">
            </tbody>
        </table>
        <asp:Button ID="pdf" runat="server" Text="Generate Report" class="btn" OnClick="pdf_Click" Height="40px" Width="200px" Style="text-align: center; margin-left: 13px;" />

        <asp:Button ID="back" runat="server" Text="Back" class="btn" OnClick="back_Click" Style="height: 40px; margin-left: 13px; width: 200px" />
    </form>





</body>
</html>
