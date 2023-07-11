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
    public partial class manage_donations : System.Web.UI.Page
    {
        ServiceClient sc = new ServiceClient();

        protected void Page_Load(object sender, EventArgs e)
        {

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

                if(don.Status == "PENDING")
                {
                    sOutput += "<td style='color:white;background-color:#D6EEEE;'>" + "<a href='single_donation.aspx?donationid=" + don.DonationID + "'>" + don.Status + "</a>" + "</td>";
                }
                else if(don.Status == "APPROVE")
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


        protected void add_Click(object sender, EventArgs e)
        {
            User user = sc.getUserB(donoremail.Value);

            if (user == null)
            {
                Response.Write("<script>alert('User not registered.Please register user first!..');window.location = 'addUse.aspx';</script>");

            }
            else
            {
                int id = user.UserID;

                string tp = donationtype.SelectedItem.Value;

                int qty = Convert.ToInt32(quantity.Value);

                if (FileUpload1.HasFile)
                {
                    try
                    {
                        string pPath = "Images/";
                        string filename = Path.GetFileName(FileUpload1.FileName);
                        FileUpload1.SaveAs(Server.MapPath(pPath) + filename);
                        string image = pPath + filename;

                        bool add = sc.AddDonation(id, tp, description.Value, image, pdate.Value, "FORA", qty, "COLLECTED", "NULL");

                        if (add == true)
                        {
                            Response.Write("<script>alert('Donation successfully collected!..');window.location = 'manage_donations.aspx';</script>");

                            //string to = user.Email;
                            //string from = "codingpackfora@outlook.com";

                            //MailMessage message = new MailMessage(from, to);

                            //string mailbody = "Dear " + user.Name + ".. We have recieved your donation.Collection Date " + DateTime.Now + ".Thank you.";
                            //message.Subject = "COLLECTED  DONATION";
                            //message.Body = mailbody;
                            //message.BodyEncoding = Encoding.UTF8;
                            //message.IsBodyHtml = true;
                            //SmtpClient client = new SmtpClient("smtp.office365.com", 587);
                            //System.Net.NetworkCredential basicCredential = new System.Net.NetworkCredential("codingpackfora@outlook.com", "Ifm3APr0g");
                            //client.EnableSsl = true;
                            //client.UseDefaultCredentials = false;
                            //client.Credentials = basicCredential;

                            //try
                            //{
                            //    client.Send(message);
                            //}
                            //catch (Exception ex)
                            //{
                            //    throw ex;
                            //}
                        }
                        else
                        {
                        }

                    }
                    catch (Exception ex)
                    {
                    }
                }
            }


        }

    }
}