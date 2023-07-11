using IronPdf;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using CodingPackFrontRevised.ServiceReference2;

namespace CodingPackFrontRevised
{
    public partial class donor : System.Web.UI.Page
    {
        ServiceClient sc = new ServiceClient();


        protected void Page_Load(object sender, EventArgs e)
        {
            int UserID = Convert.ToInt32(Session["LoggedInUserID"]);

            total.Value = sc.countDonorDonations(UserID).ToString();

            string sOutput = "";

            foreach (Donation don in sc.getDonorDonations(UserID))
            {
                string path = don.Image;                

                sOutput += "<tr>";
                sOutput += "<td>" + don.DonationType + "</td>";
                sOutput += "<td>"  + don.Description + "</td>";
                sOutput += "<td>" + don.Quantity + "</td>";
                sOutput += "<td>" + don.PickupDate + "</td>";
                sOutput += "<td>" + don.PickupAddress + "</td>";
                if (don.Status == "PENDING")
                {
                    sOutput += "<td style='color:white;background-color:#D6EEEE;'>" + "<a href='apply_donat.aspx?donationid=" + don.DonationID + "'>"  + don.Status  + "</td>";
                }
                else if (don.Status == "APPROVE")
                {
                    sOutput += "<td style='color:white;background-color:rgb(255, 255, 144);'>" + "<a href='apply_donat.aspx?donationid=" + don.DonationID + "'>"  + don.Status  + "</td>";
                }
                else if (don.Status == "COLLECTED")
                {
                    sOutput += "<td style='color:white;background-color:rgba(255, 99, 71, 0.5);'>" +  "<a href='apply_donat.aspx?donationid=" + don.DonationID + "'>"  + don.Status + "</td>";
                }
                sOutput += "<td>" + don.Code + "</td>";
                sOutput += "</tr>";

            }

            datatable.InnerHtml = sOutput;
        }

        //protected void update_Click(object sender, EventArgs e)
        //{                           
        //        int id = Convert.ToInt32(Request.QueryString["donationid"]);

        //        Donation donation = sc.getDonation(id);

        //        Image1.ImageUrl = donation.Image;
        //        description1.Value = donation.Description;
        //        quantity1.Value = donation.Quantity.ToString();
        //        pdate1.Value = donation.PickupDate;
        //        to_places1.Value = donation.PickupAddress;
        //        status1.Value = donation.Status;            
        //}


        protected void apply_Click(object sender, EventArgs e)
        {

        }

        protected void adddonation_Click(object sender, EventArgs e)
        {

        }

        protected void add_Click(object sender, EventArgs e)
        {           
            int UserID = Convert.ToInt32(Session["LoggedInUserID"]);

            string tp = donationtype.SelectedItem.Value;
            int qty = Convert.ToInt32(quantity.Value);

            if (FileUpload1.HasFile == false)
            {
                Response.Write("<script>alert('Please upload a clear image of the item!. please try again')</script>");
            }
            else if (FileUpload1.HasFile == true)
            {
                try
                {
                    string pPath = "Images/";
                    string filename = Path.GetFileName(FileUpload1.FileName);
                    FileUpload1.SaveAs(Server.MapPath(pPath) + filename);
                    string image = pPath + filename;

                    bool add = sc.AddDonation(UserID, tp, description.Value, image, pdate.Value, to_places.Value, qty, status.Value, "NULL");

                    if (add == true)
                    {
                        Response.Write("<script>alert('Donation Application successfull!.Please note if more than 100km your application will be declined as we do pickups for donors within 100km radius.');window.location = 'donor.aspx';</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Donation Application unsuccessfull!. please try again')</script>");
                    }

                }
                catch (Exception ex)
                {
                }
            }
        }
    }
}