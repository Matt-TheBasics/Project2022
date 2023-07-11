using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodingPackFrontRevised.ServiceReference2;

namespace CodingPackFrontRevised
{
    public partial class frequentdonors : System.Web.UI.Page
    {
        ServiceClient sc = new ServiceClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            var sOutput = "";


            foreach (int don in sc.getFrequestDonors())
            {
                var user = sc.getUser(don);
                //List<Donation> donationlist = new List<Donation>();

                //foreach (Donation d in sc.getDonorDonations(user.UserID))
                //{
                //    donationlist.Add(d);
                //}

                sOutput += "<tr>";
                sOutput += "<td>" + "<a href='AddUse.aspx?userid=" + user.UserID + "'>" + user.Name + "</td>";
                sOutput += "<td>" + user.Email + "</td>";
                sOutput += "<td>" + "<a href='m_donordonations.aspx?userid=" + user.UserID + "'>" + sc.countDonorDonations(user.UserID) + "</td>";
                sOutput += "</tr>";
                //donationlist.Clear();
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