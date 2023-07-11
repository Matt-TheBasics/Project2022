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
    public partial class add_donation : System.Web.UI.Page
    {
        ServiceClient sc = new ServiceClient();


        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void add_Click(object sender, EventArgs e)
        {

            //int times = Convert.ToInt32(ntimes.Value);
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
                            Response.Write("<script>alert('Donation successfully added!..');window.location = 'manage_donations.aspx';</script>");

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
                            capturedetails.Visible = false;
                        }
                        else
                        {
                            capturedetails.Visible = true;
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