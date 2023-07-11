using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodingPackFrontRevised.ServiceReference2;

namespace CodingPackFrontRevised
{
    public partial class Invites : System.Web.UI.Page
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
                sOutput += "<td>" + don.Date_to +  "</td>";
                sOutput += "</tr>";

            }

            datatable.InnerHtml = sOutput;

        }
    }
}