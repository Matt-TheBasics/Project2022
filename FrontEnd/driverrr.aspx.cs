using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodingPackFrontRevised.ServiceReference2;

namespace CodingPackFrontRevised
{
    public partial class driverrr : System.Web.UI.Page
    {
        ServiceClient sc = new ServiceClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            var sOutput = "";

            int userid = Convert.ToInt32(Session["LoggedInUserID"]);

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
                    sOutput += "<td style='color:white;background-color:#D6EEEE;'>" + "<a href='driverrr.aspx?donationid=" + don.DonationID + "'>" + don.Status + "</td>";
                }
                else if (don.Status == "APPROVE")
                {
                    sOutput += "<td style='color:white;background-color:rgb(255, 255, 144);'>" + "<a href='driverrr.aspx?donationid=" + don.DonationID + "'>" + don.Status + "</td>";
                }
                else if (don.Status == "COLLECTED")
                {
                    sOutput += "<td style='color:white;background-color:rgba(255, 99, 71, 0.5);'>" + "<a href='driverrr.aspx?donationid=" + don.DonationID + "'>" + don.Status + "</td>";
                }
                sOutput += "</tr>";
          
                datatable.InnerHtml = sOutput;

                if (!Page.IsPostBack)
                {
                    int id = Convert.ToInt32(Request.QueryString["donationid"]);

                    Donation don1 = sc.getDonation(id);
                    if (don != null)
                    {
                        Image1.ImageUrl = don1.Image;
                        description1.Value = don1.Description;
                        type.Value = don.DonationType;
                        quantity1.Value = don1.Quantity.ToString();
                        pdate1.Value = don1.PickupDate;
                        to_places1.Value = don1.PickupAddress;
                        decision.SelectedItem.Value = don1.Status;

                    }
                }

            }
        }

        protected void collect_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["donationid"]);

            Donation don = sc.getDonation(id);

            string status = decision.SelectedItem.Value;

            int qty = Convert.ToInt32(quantity1.Value);

            if(code.Value != don.Code)
            {
                Response.Write("<script>alert('Invalid Code. please try again')</script>");
            }else
            {
                bool edit = sc.editDonation(id, don.DonorID, don.DonationType, don.Description, don.Image, don.PickupDate, don.PickupAddress, don.Quantity, status, code.Value);

                if (edit == false)
                {
                    Response.Write("<script>alert('Failed to complete collection . please try again')</script>");
                }
                else
                {
                    Response.Write("<script>alert('Donation successfully collected!..');window.location = 'driverr.aspx';</script>");
                }

            }

        }
    }
}