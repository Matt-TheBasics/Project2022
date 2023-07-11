<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manager.aspx.cs" Inherits="CodingPackFrontRevised.manager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Dashboard</title>

    <link href="css/style2.css" rel="stylesheet" />

    <link href="Chart.js" rel="stylesheet" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/chartjs-plugin-datalabels/2.1.0/chartjs-plugin-datalabels.min.js" integrity="sha512-Tfw6etYMUhL4RTki37niav99C6OHwMDB2iBT5S5piyHO+ltK2YX8Hjy9TXxhE1Gm/TmAV0uaykSpnHKFIAif/A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />


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
                                        <a href="distance.aspx" class="nav-item nav-link"  >Distance</a>

                    <a href="my_account.aspx" class="nav-item nav-link">Account</a>

                    <a href="logout.aspx" class="nav-item nav-link" id="loggedin" style="margin-left:1100px;margin-top:0px;">Logout</a>

                </div>
            </div>
        </nav>
    </div>


    <form id="form1" runat="server">

       <div class="container" id="report" runat="server">  </div>

    </form>
</body>
</html>
