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
    public partial class collec : System.Web.UI.Page
    {
        ServiceClient sc = new ServiceClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                int id = Convert.ToInt32(Request.QueryString["donationid"]);

                Donation don = sc.getDonation(id);

                if(don != null)
                {
                    DonationType.Value = don.DonationType;
                    Description.Value = don.Description;
                    
                }
            }
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("driverr.aspx");
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            int did = Convert.ToInt32(Request.QueryString["donationid"]);

            string dec = decision.SelectedItem.Value;
            int qty = Convert.ToInt32(quantity.Value);


            Donation don = sc.getDonation(did);

            bool edit = sc.editDonation(did, don.DonorID, don.DonationType,don.Description,don.Image, don.PickupDate, don.PickupAddress,qty, dec,don.Code);

            if (edit == false)
            {
                Response.Write("<script>alert('Process unsuccessfully please try again')</script>");
            }
            else
            {
                if (dec == "COLLECTED")
                {

                    User user = sc.getUser(don.DonorID);
                    int driverid = Convert.ToInt32(Session["LoggedInUserID"]);
                    User driver = sc.getUser(driverid);

                    string to = user.Email;
                    string from = "codingpackfora@outlook.com";

                    MailMessage message = new MailMessage(from, to);

                    string mailbody = "Dear " + user.Name + ".. We have recieved your donation.Collection Date " + DateTime.Now + "by "+ driver.Name + ".Thank you.";
                    message.Subject = "COLLECTED  DONATION";
                    message.Body = mailbody;
                    message.BodyEncoding = Encoding.UTF8;
                    message.IsBodyHtml = true;
                    SmtpClient client = new SmtpClient("smtp.office365.com", 587);
                    System.Net.NetworkCredential basicCredential = new System.Net.NetworkCredential("codingpackfora@outlook.com", "Ifm3APr0g");
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
                else
                {
                    User user = sc.getUser(don.DonorID);

                    string to = user.Email;
                    string from = "codingpackfora@outlook.com";

                    MailMessage message = new MailMessage(from, to);

                    string mailbody = "Dear " + user.Name + ".. We regret to have not proceeded with your item. Decline Date " + DateTime.Now + ".Thank you.";
                    message.Subject = "DECLINED  DONATION";
                    message.Body = mailbody;
                    message.BodyEncoding = Encoding.UTF8;
                    message.IsBodyHtml = true;
                    SmtpClient client = new SmtpClient("smtp.office365.com", 587);
                    System.Net.NetworkCredential basicCredential = new System.Net.NetworkCredential("codingpackfora@outlook.com", "Ifm3APr0g");
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

                Response.Write("<script>alert('Process Successfull !..');window.location = 'driverr.aspx';</script>");
            }
        }

    }
}