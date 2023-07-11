using IronPdf;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodingPackFrontRevised.ServiceReference2;
using System.Net;
using System.Net.Mail;
using System.IO;
using System.Text;

namespace CodingPackFrontRevised
{
    public partial class single_donation : System.Web.UI.Page
    {
        ServiceClient sc = new ServiceClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                int id = Convert.ToInt32(Request.QueryString["donationid"]);
                Donation donation = sc.getDonation(id);

                User user = sc.getUser(donation.DonorID);

                Image1.ImageUrl = donation.Image;
                donoremail.Value = user.Email;
                decision.SelectedItem.Value = donation.Status;
                pdate.Value = donation.PickupDate;
                address.Value = donation.PickupAddress;
                description.Value = donation.Description;
                quantity.Value = donation.Quantity.ToString();
                dtype.Value = donation.DonationType;

                //from_places.Value = donation.PickupAddress;


            }

            var sOutput = "";

            foreach (Donation don in sc.getAllDonations())
            {
                var user = sc.getUser(don.DonorID);

                sOutput += "<tr>";
                sOutput += "<td>" + "<a href='m_donordonations.aspx?userid=" + user.UserID + "'>" + user.Name + "</td>";
                sOutput += "<td>" + "<a href='AddUse.aspx?userid=" + user.UserID + "'>" + user.Email + "</td>";
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

        protected void adddonation_Click(object sender, EventArgs e)
        {
            //Response.Redirect("add_donation.aspx");
        }


        protected void dis_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["donationid"]);

            Session["DonationDistance"] = id;
        }

        protected void add_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["donationid"]);

            Donation don = sc.getDonation(id);

            string status = decision.SelectedItem.Value;
            int qty = Convert.ToInt32(quantity.Value);

            string code = sc.returnrandomstring();

            bool edit = sc.editDonation(id, don.DonorID, don.DonationType,description.Value,don.Image, don.PickupDate, don.PickupAddress,qty, status,code);

            int driverid = Convert.ToInt32(schedule.SelectedItem.Value);

            int scd = sc.scheduledriver(id, driverid);

            if (edit == false)
            {
                Response.Write("<script>alert('Failed to update donation details. please try again')</script>");
            }
            else
            {
                if (status == "APPROVE")
                {
                    if (scd != -1)
                    {
                        User user = sc.getUser(don.DonorID);

                        string to = user.Email;
                        string from = "codingpackfora3@outlook.com";

                        MailMessage message = new MailMessage(from, to); ;

                        string mailbody = "Dear " + user.Name + ".. Please note your donation has been approved and will be collected on the " + don.PickupDate + "Before 5PM.Thank you.";
                        message.Subject = "APPROVED DONATION";
                        message.Body = mailbody;
                        message.BodyEncoding = Encoding.UTF8;
                        message.IsBodyHtml = true;
                        SmtpClient client = new SmtpClient("smtp.office365.com", 587);
                        System.Net.NetworkCredential basicCredential = new System.Net.NetworkCredential("codingpackfora3@outlook.com", "Ifm3APr0g");
                        client.EnableSsl = true;
                        client.UseDefaultCredentials = false;
                        client.Credentials = basicCredential;

                        try
                        {
                            client.Send(message);
                        }
                        catch (Exception ex)
                        {
                            throw ex;
                        }
                    }
                }

                if (status == "DECLINE")
                {
                    User user = sc.getUser(don.DonorID);

                    string to = user.Email;
                    string from = "codingpackfora3@outlook.com";

                    MailMessage message1 = new MailMessage(from, to); ;

                    string mailbody1 = "Dear " + user.Name + ".. Please note we only collect donations within 100km radius from Krugersdorp,and for that reason we regret to decline your application .Thank you.";
                    message1.Subject = "DECLINED DONATION";
                    message1.Body = mailbody1;
                    message1.BodyEncoding = Encoding.UTF8;
                    message1.IsBodyHtml = true;
                    SmtpClient client1 = new SmtpClient("smtp.office365.com", 587);
                    System.Net.NetworkCredential basicCredential = new System.Net.NetworkCredential("codingpackfora3@outlook.com", "Ifm3APr0g");
                    client1.EnableSsl = true;
                    client1.UseDefaultCredentials = false;
                    client1.Credentials = basicCredential;

                    try
                    {
                        client1.Send(message1);
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                }

                Response.Write("<script>alert('Donation details successfully updated!..');window.location = 'manage_donations.aspx';</script>");
            }

        }
    }
}