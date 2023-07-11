using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodingPackFrontRevised.ServiceReference2;

namespace CodingPackFrontRevised
{
    public partial class bestDonor : System.Web.UI.Page
    {
        ServiceClient sc = new ServiceClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            var sOutput = "";

            User bd = sc.getUser(sc.bestDonor());

            foreach (Donation don in sc.getDonorDonations(bd.UserID))
            {
                var user = sc.getUser(don.DonorID);

                sOutput += "<tr>";
                sOutput += "<td>" + "<a href='AddUse.aspx?userid=" + user.UserID + "'>" + user.Name + "</td>";
                sOutput += "<td>" + user.Email + "</td>";
                sOutput += "<td>" + don.DonationType + "</td>";
                sOutput += "<td>" + don.Description + "</td>";
                sOutput += "<td>" + don.Quantity + "</td>";
                sOutput += "<td>" + don.PickupAddress + "</td>";
                sOutput += "<td>" + don.PickupDate + "</td>";
                if (don.Status == "PENDING")
                {
                    sOutput += "<td style='color:white;background-color:#D6EEEE;'>" + "<a href='single_donation.aspx?donationid=" + don.DonationID + "'>" + don.Status + "</a>" + "</td>";
                }
                else if (don.Status == "APPROVE")
                {
                    sOutput += "<td style='color:white;background-color:rgb(255, 255, 144);'>" + "<a href='single_donation.aspx?donationid=" + don.DonationID + "'>" + don.Status + "</a>" + "</td>";
                }
                else if (don.Status == "COLLECTED")
                {
                    sOutput += "<td style='color:white;background-color:rgba(255, 99, 71, 0.5);'>" + "<a href='single_donation.aspx?donationid=" + don.DonationID + "'>" + don.Status + "</a>" + "</td>";
                }
                sOutput += "</tr>";

            }

            datatable.InnerHtml = sOutput;
        }

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("manager.aspx");
        }

        protected void pdf_Click(object sender, EventArgs e)
        {
            IronPdf.AspxToPdf.RenderThisPageAsPdf(IronPdf.AspxToPdf.FileBehavior.Attachment);
        }

    }
}