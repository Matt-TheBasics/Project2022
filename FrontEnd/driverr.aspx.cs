using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodingPackFrontRevised.ServiceReference2;

namespace CodingPackFrontRevised
{
    public partial class driverr : System.Web.UI.Page
    {
        ServiceClient sc = new ServiceClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            var sOutput = "";

            int userid = Convert.ToInt32(Session["LoggedInUserID"]);

            //foreach (Donation don in sc.getAllApproved())
            foreach (Schedule schedule in sc.drivertasks(userid))
            {
                Donation don = sc.getDonation(schedule.DonationID);

                   var user = sc.getUser(don.DonorID);

                    sOutput += "<tr>";
                    sOutput += "<td>" + user.Name + "</td>";
                    sOutput += "<td>" + user.Contact + "</td>";
                    sOutput += "<td>" + don.DonationType + "</td>";
                    sOutput += "<td>" + don.Description + "</td>";
                    sOutput += "<td>" + don.Quantity + "</td>";
                    sOutput += "<td>" + don.PickupAddress + "</td>";
                    sOutput += "<td>" + don.PickupDate + "</td>";
                if (don.Status == "PENDING")
                {
                    sOutput += "<td style='color:white;background-color:#D6EEEE;'>" + "<a href='driverrr.aspx?donationid=" + don.DonationID + "'>"  + don.Status + "</td>";
                }
                else if (don.Status == "APPROVE")
                {
                    sOutput += "<td style='color:white;background-color:rgb(255, 255, 144);'>" + "<a href='driverrr.aspx?donationid=" + don.DonationID + "'>"  + don.Status + "</td>";
                }
                else if (don.Status == "COLLECTED")
                {
                    sOutput += "<td style='color:white;background-color:rgba(255, 99, 71, 0.5);'>" + "<a href='driverrr.aspx?donationid=" + don.DonationID + "'>"  + don.Status + "</td>";
                }

                sOutput += "</tr>";
                //}

                datatable.InnerHtml = sOutput;
            }
        }
    }
}