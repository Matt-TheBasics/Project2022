using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodingPackFrontRevised.ServiceReference2;

namespace CodingPackFrontRevised
{
    public partial class manager : System.Web.UI.Page
    {
        ServiceClient sc = new ServiceClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            User bd = sc.getUser(sc.bestDonor());

            var sOutput = "";

            int totusers = sc.getDonors()  + sc.getDrivers();

            sOutput += "<div style='padding-top:20;text-align:center;border:5px solid white'>";

            sOutput += "<p style='align:center;border:5px solid black;background-color:tomato;width:500px;height:115px;color:white;float:right;'>" + " <b style='font-size:20px'>" + "Users " + "</b> " + "<br>"  +  " Best Donor :" + "<a href='bestDonor.aspx'>" + bd.Name  + " Donations: " + sc.countDonorDonations(bd.UserID) + "</a>" +  "<br> Frequent Donors: " +"<a href='frequentdonors.aspx'>" +   sc.countAllFrequentDonors() + "</a>" + "<br>" +  " Total Users :" + "<a href='manage_users.aspx'>"  + totusers + "</a>" + "</p>";
            sOutput += "<p style='align:center;backgroud-color:tomato;background-color:tomato;width:500px;border:5px solid black;height:115px;color:white;float:right'>" + " <b style='font-size:20px'>" + " Donations " + "</b> " + "<br>" + " Total Food Donation :" + "<a href='manage_donations.aspx'>" + sc.countFoodDonations() + "</a>" + "<br>" + " Total Clothes Donations :" + "<a href='manage_donations.aspx'>" + sc.countClothesDonations() + "<br>" + "</a>" + " Total Donations :" + "<a href='manage_donations.aspx'>" + sc.countAllDonations() + "</a>" + "</p>";
            sOutput += "</div";

            string chat1 = "";

            //chat1 += "<div class= 'container' style='width:500px;height:450px;float:right'>";
            //chat1 += "<canvas id='myChart'></canvas>";
            //chat1 += "</div>";
            //chat1 += "<script>";
            //chat1 += "var myChart = document.getElementById('myChart').getContext('2d');";
            //chat1 += "var massChart = new Chart(myChart,{";
            //chat1 += "type: 'bar',data: { ";
            //chat1 += "labels: ['Per Month', 'Per Year','FOOD','CLOTHES', 'Total Accumulated'],";
            //chat1 += "datasets: [{ label: 'Donations', data: [" + sc.donationspermonth() + "," + sc.donationsperyear() + "," + sc.countFoodDonations() + "," + sc.countClothesDonations() + "," + sc.countAllDonations() + "," + sc.countAllDonations() + " ] , backgroundColor: ['tomato', 'green', 'black'], borderWidth: 4, borderColor: 'pink', horverBorderWidth: 4, horverBorderColor: 'lime'}]";
            //chat1 += "},options:{plugins:{tooltip:{enabled:false}},maintainAspectRatio:false,title:{display: true,text: 'Largest Cities in South ASfrica',";
            //chat1 += "fontSize: 25 },legend: { display: false, position: 'right', labels: { fontColor: 'brown' } }} ,plugins:[ChartDataLabels] });";
            //chat1 += "</script>";


            int[] permonth = sc.fooddonationspermonth();

            chat1 += "<div class= 'container' style='width:500px;height:450px;float:right'>";
            chat1 += "<canvas id='myChart'></canvas>";
            chat1 += "</div>";
            chat1 += "<script>";
            chat1 += "var myChart = document.getElementById('myChart').getContext('2d');";
            chat1 += "var massChart = new Chart(myChart,{";
            chat1 += "type: 'bar',data: { ";
            chat1 += "labels: ['Jan', 'February','March', 'April','May', 'June','July', 'August','September', 'October','November', 'December'],";
            chat1 += "datasets: [{ label: 'Food Donations', data: [" + permonth[1] + "," + permonth[2] + "," + permonth[3] + "," + permonth[4] + "," + permonth[5] + "," + permonth[6] + "," + permonth[7] + "," + permonth[8] + "," + permonth[9] + "," + permonth[10] + "," + permonth[11] + "," + permonth[12] + " ] , backgroundColor: ['tomato'], borderWidth: 4, borderColor: 'black', horverBorderWidth: 4, horverBorderColor: 'lime'}]";
            chat1 += "},options:{plugins:{tooltip:{enabled:false}},maintainAspectRatio:false,title:{display: true,text: 'Largest Cities in South ASfrica',";
            chat1 += "fontSize: 25 },legend: { display: false, position: 'right', labels: { fontColor: 'brown' } }},plugins:[ChartDataLabels] });";
            chat1 += "</script>";

            int tot = sc.getDonors() + sc.getDrivers() + sc.getAdmins();

            string chat = "";

            ////chat += "<div class= 'container' style='width:500px;height:450px;float:right'>";
            ////chat += "<canvas id='myChart1'></canvas>";
            ////chat += "</div>";
            ////chat += "<script>";
            ////chat += "var myChart1 = document.getElementById('myChart1').getContext('2d');";
            ////chat += "var massChart1 = new Chart(myChart1,{";
            ////chat += "type: 'bar',data: { ";
            ////chat += "labels: ['Donors', 'Drivers'],";
            ////chat += "datasets: [{ label: 'Users', data: [" + sc.getDonors() + "," + sc.getDrivers() + " ] , backgroundColor: ['tomato', 'green', 'black'], borderWidth: 4, borderColor: 'pink', horverBorderWidth: 4, horverBorderColor: 'lime'}]";
            ////chat += "},options:{plugins:{tooltip:{enabled:false}},maintainAspectRatio:false,title:{display: true,text: 'Largest Cities in South ASfrica',";
            ////chat += "fontSize: 25 },legend: { display: false, position: 'right', labels: { fontColor: 'brown' } }},plugins:[ChartDataLabels] });";
            ////chat += "</script>";

            int[] permonth1 = sc.clothesdonationspermonth();

            chat += "<div class= 'container' style='width:500px;height:450px;float:right'>";
            chat += "<canvas id='myChart1'></canvas>";
            chat += "</div>";
            chat += "<script>";
            chat += "var myChart1 = document.getElementById('myChart1').getContext('2d');";
            chat += "var massChart1 = new Chart(myChart1,{";
            chat += "type: 'bar',data: { ";
            chat += "labels: ['Jan', 'February','March', 'April','May', 'June','July', 'August','September', 'October','November', 'December'],";
            chat += "datasets: [{ label: 'Clothes Donations', data: [" + permonth1[1] + "," + permonth1[2]  +"," + permonth1[3] + "," + permonth1[4] + "," + permonth1[5] + "," + permonth1[6] + "," + permonth1[7] + "," + permonth1[8] + "," + permonth1[9] + "," + permonth1[10] +"," + permonth1[11] + "," + permonth1[12] + " ] , backgroundColor: ['tomato'], borderWidth: 4, borderColor: 'black', horverBorderWidth: 4, horverBorderColor: 'lime'}]";
            chat += "},options:{plugins:{tooltip:{enabled:false}},maintainAspectRatio:false,title:{display: true,text: 'Largest Cities in South ASfrica',";
            chat += "fontSize: 25 },legend: { display: false, position: 'right', labels: { fontColor: 'brown' } }},plugins:[ChartDataLabels] });";
            chat += "</script>";

            //dList.Visible = false;
            report.InnerHtml = chat + chat1 + sOutput;
        }

        //donation management
        protected void donationmanagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("manage_donations.aspx");
        }


        //user management

        protected void usermanagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("manage_users.aspx");
        }


        //campaign management

        protected void campaignmanagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("manage_campaigns.aspx");
        }

        protected void generatereport_Click(object sender, EventArgs e)
        {

            var sOutput = "";


            sOutput += " <br> ";
            //sOutput += "<h4 style='color:black;border:5px solid tomato';>Number of donations this month: " + sc.donationspermonth() + "</h4>";


            sOutput += " <br> ";
            sOutput += "<h4 style='color:black;border:5px solid tomato;'>Number of donations this year: " + sc.donationsperyear() + "</h4>";

            sOutput += " <br> ";
            sOutput += "<h4 style='color:black;border:5px solid tomato;'>Accumulated Donations: " + sc.countAllDonations() + "</h4>";

            sOutput += " <br> ";
            sOutput += "<h4 style='color:black;border:5px solid tomato;'>Frequent Donors: " + sc.countAllFrequentDonors() + "</h4>";
            sOutput += " <br> ";

            User bd = sc.getUser(sc.bestDonor());
            sOutput += "<h4 style='color:black;border:5px solid tomato;'>Best Donor: " + bd.Name + "                  ID: " + bd.UserID + "   nDonations: " + sc.countbestdonations() + "</h4>";
            sOutput += " <br> ";

            sOutput += "<h4 style='color:black;border:5px solid tomato;'>Number of admins: " + sc.getAdmins() + "</h4>";
            sOutput += " <br> ";

            sOutput += "<h4 style='color:black;border:5px solid tomato;'>Number of drivers: " + sc.getDrivers() + "</h4>";
            sOutput += " <br> ";

            sOutput += "<h4 style='color:black;border:5px solid tomato;'>Number of Campaigns: " + sc.getCampaigns() + "</h4>";
            sOutput += " <br> ";

            //dList.Visible = false;
            report.InnerHtml = sOutput;
        }

    }
}