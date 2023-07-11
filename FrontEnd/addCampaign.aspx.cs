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
    public partial class addCampaign : System.Web.UI.Page
    {
        ServiceClient sc = new ServiceClient();

        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void add_Click(object sender, EventArgs e)
        {
            string tp = campaigntype.SelectedItem.Value;

             bool add = sc.AddCampaign(name.Value, description.Value, datefrom.Value, dateto.Value, tp, location.Value);

            if (add == true)
                {

                foreach (User user in sc.getAllUsers())
                {
                    string to = user.Email;
                    string from = "codingpackfora@outlook.com";

                    MailMessage message = new MailMessage(from, to);

                    string mailbody = "Dear " + user.Name +  ".. You are ivited to a campaign that will take place from the " + datefrom.Value+ " to " + dateto.Value + "at " + location.Value + ".";
                    message.Subject = "Campaign Invite";
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

                Response.Write("<script>alert('Campaign successfully created!Invites sent..');window.location = 'manage_campaigns.aspx';</script>");
                }
                else
                {
                Response.Write("<script>alert('Something wrong please try again..')</script>");
            }
        }


        }

    }