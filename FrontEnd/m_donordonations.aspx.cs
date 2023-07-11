using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodingPackFrontRevised.ServiceReference2;

namespace CodingPackFrontRevised
{
    public partial class m_donordonations : System.Web.UI.Page
    {
        ServiceClient sc = new ServiceClient();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                int userid = Convert.ToInt32(Request.QueryString["userid"]);

                total.Value = sc.countDonorDonations(userid).ToString();

                string sOutput = "";

                foreach (Donation don in sc.getDonorDonations(userid))
                {

                    sOutput += "<tr>";
                    sOutput += "<td>" + don.DonationType + "</td>";
                    sOutput += "<td>" + don.Description + "</td>";
                    sOutput += "<td>" + don.Quantity + "</td>";
                    sOutput += "<td>" + don.PickupDate + "</td>";
                    sOutput += "<td>" + don.PickupAddress + "</td>";
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
        }

        protected void pdf_Click(object sender, EventArgs e)
        {
            IronPdf.AspxToPdf.RenderThisPageAsPdf(IronPdf.AspxToPdf.FileBehavior.Attachment);
        }


        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("manage_donations.aspx");
        }

    }
}