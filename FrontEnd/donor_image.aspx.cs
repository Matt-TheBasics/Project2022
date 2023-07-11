using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodingPackFrontRevised.ServiceReference2;

namespace CodingPackFrontRevised
{
    public partial class donor_image : System.Web.UI.Page
    {
        ServiceClient sc = new ServiceClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                int id = Convert.ToInt32(Request.QueryString["donationid"]);

                Donation donation = sc.getDonation(id);

                string path = donation.Image;

                Image1.ImageUrl = path;
            }

            //var sOutput = "";

            //int userid = Convert.ToInt32(Session["LoggedInUserID"]);

            ////foreach (Donation don in sc.getAllApproved())
            //foreach (Schedule schedule in sc.drivertasks(userid))
            //{
            //    Donation don = sc.getDonation(schedule.DonationID);

            //    var user = sc.getUser(don.DonorID);

            //    sOutput += "<tr>";
            //    sOutput += "<td>" + user.Name + "</td>";
            //    sOutput += "<td>" + user.Contact + "</td>";
            //    sOutput += "<td>" + don.DonationType + "</td>";
            //    sOutput += "<td>" + don.Description + "</td>";
            //    sOutput += "<td>" + don.Quantity + "</td>";
            //    sOutput += "<td>" + don.PickupAddress + "</td>";
            //    sOutput += "<td>" + don.PickupDate + "</td>";
            //    sOutput += "<td>" + don.Status + "</td>";
            //    sOutput += "<td>" + "<a href='donor_image.aspx?donationid=" + don.DonationID + "'>" + "View Image" + "</td>";

            //    sOutput += "</tr>";
            //    //}

            //    datatable.InnerHtml = sOutput;
            //}

        }

        protected void back_Click(object sender, EventArgs e)
        {
            int userid = Convert.ToInt32(Session["LoggedInUserID"]);

            User user = sc.getUser(userid);

            if (user.Usertype == "MANAGER")
            {
                Response.Redirect("manage_donations.aspx");
            }

            if (user.Usertype == "DONOR")
            {
                Response.Redirect("donor.aspx");
            }

            if (user.Usertype == "DRIVER")
            {
                Response.Redirect("driverr.aspx");
            }

        }
    }
}