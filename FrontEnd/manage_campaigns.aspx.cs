using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodingPackFrontRevised.ServiceReference2;

namespace CodingPackFrontRevised
{
    public partial class manage_campaigns : System.Web.UI.Page
    {
        ServiceClient sc = new ServiceClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            var sOutput = "";

            foreach (Campaign don in sc.getAllCampaigns())
            {

                sOutput += "<tr>";
                sOutput += "<td>" + don.Name + "</td>";
                sOutput += "<td>" + don.Description + "</td>";
                sOutput += "<td>" + don.Location + "</td>";
                sOutput += "<td>" + don.Date_from + "</td>";
                sOutput += "<td>" + "<a href='single_campaign.aspx?campaignid=" + don.CampaignID + "'>" + don.Date_to  + "</a>" +  "</td>";
                sOutput += "</tr>";

            }

            datatable.InnerHtml = sOutput;

        }

        protected void addcampaign_Click(object sender, EventArgs e)
        {
            Response.Redirect("addCampaign.aspx");
        }

    }
}